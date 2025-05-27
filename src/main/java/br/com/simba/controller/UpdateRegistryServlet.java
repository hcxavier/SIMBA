package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/updateRegistryServlet")
public class UpdateRegistryServlet extends HttpServlet {

    private final Gson gson = new Gson();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String, Object> jsonResponseMap = new HashMap<>();
        DBConnection dbConnection = new PostgresConnection();
        Connection conn = null;

        try {
            String recordIdParam = request.getParameter("recordId");
            String barrierSpecification = request.getParameter("barrierSpecification");
            String barrierTypeStr = request.getParameter("barrierType");
            String barrierCriticalityStr = request.getParameter("barrierCriticality");
            String location = request.getParameter("location");
            String resolutionSuggestion = request.getParameter("resolutionSuggestion");

            if (recordIdParam == null || recordIdParam.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "ID do registro não fornecido.");
                return;
            }

            int recordId;
            try {
                recordId = Integer.parseInt(recordIdParam);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "ID do registro inválido.");
                return;
            }

            if (barrierSpecification == null || barrierSpecification.trim().isEmpty() ||
                    barrierTypeStr == null || barrierTypeStr.trim().isEmpty() ||
                    barrierCriticalityStr == null || barrierCriticalityStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "Campos obrigatórios não preenchidos (Nome, Tipo, Criticidade).");
                return;
            }

            conn = dbConnection.getConnection();
            if (conn == null) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "Falha ao conectar ao banco de dados.");
                return;
            }
            conn.setAutoCommit(false);

            RegistryDAO registryDAO = new RegistryDAO(conn);
            Registry registry = registryDAO.findById(recordId);

            if (registry == null) {
                if (conn != null) conn.rollback();
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "Registro não encontrado para atualização.");
                return;
            }

            registry.setBarrierSpecification(barrierSpecification);
            registry.setLocation(location);
            registry.setResolutionSuggestion(resolutionSuggestion);

            try {
                registry.setBarrierType(BarrierCategory.valueOf(barrierTypeStr.toUpperCase()));
                registry.setBarrierCriticality(BarrierCriticality.valueOf(barrierCriticalityStr.toUpperCase()));
            } catch (IllegalArgumentException e) {
                if (conn != null) conn.rollback();
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                jsonResponseMap.put("success", false);
                jsonResponseMap.put("error", "Valores inválidos para Tipo de Barreira ou Criticidade: " + escapeJson(e.getMessage()));
                return;
            }

            registryDAO.update(registry);
            conn.commit();

            jsonResponseMap.put("success", true);
            jsonResponseMap.put("message", "Registro atualizado com sucesso!");

        } catch (SQLException e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex_roll) {
                System.err.println("Erro ao fazer rollback da transação SQL: " + ex_roll.getMessage());
                ex_roll.printStackTrace(System.err);
            }
            System.err.println("Erro SQL no UpdateRecordServlet: " + e.getMessage());
            e.printStackTrace(System.err);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponseMap.put("success", false);
            jsonResponseMap.put("error", "Erro de banco de dados ao tentar atualizar o registro: " + escapeJson(e.getMessage()));
        } catch (Exception e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex_roll) {
                System.err.println("Erro ao fazer rollback da transação (Exceção genérica): " + ex_roll.getMessage());
                ex_roll.printStackTrace(System.err);
            }
            System.err.println("Erro inesperado no UpdateRecordServlet: " + e.getMessage());
            e.printStackTrace(System.err);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponseMap.put("success", false);
            jsonResponseMap.put("error", "Erro interno ao tentar atualizar o registro: " + escapeJson(e.getMessage()));
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Erro ao fechar a conexão com o banco de dados: " + e.getMessage());
                    e.printStackTrace(System.err);
                }
            }

            sendResponse(response, jsonResponseMap);
        }
    }

    private void sendResponse(HttpServletResponse response, Map<String, Object> responseMap) throws IOException {
        if (responseMap.isEmpty()) {
            if (response.getStatus() == HttpServletResponse.SC_OK) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
            responseMap.put("success", false);
            responseMap.put("error", "Ocorreu um erro inesperado no processamento da requisição.");
        }

        String jsonOutput = this.gson.toJson(responseMap);
        PrintWriter out = response.getWriter();
        out.print(jsonOutput);
        out.flush();
    }

    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}