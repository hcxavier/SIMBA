package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Registry;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/getRegistryServlet")
public class GetRegistryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder jsonResponse = new StringBuilder();
        DBConnection dbConnection = new PostgresConnection();
        Connection conn = null;

        String recordIdParam = request.getParameter("id");
        if (recordIdParam == null || recordIdParam.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"error\":\"ID do registro não fornecido.\"}");
            out.flush();
            return;
        }

        int recordId;
        try {
            recordId = Integer.parseInt(recordIdParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"error\":\"ID do registro inválido.\"}");
            out.flush();
            return;
        }

        try {
            conn = dbConnection.getConnection();
            if (conn == null) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Falha ao conectar ao banco de dados.\"}");
                out.flush();
                return;
            }

            RegistryDAO registryDAO = new RegistryDAO(conn);
            Registry record = registryDAO.findById(recordId);

            if (record == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                // JSON CORRETO PARA ERRO
                jsonResponse.append("{\"error\":\"Registro não encontrado.\"}");
            } else {
                jsonResponse.append("{");
                jsonResponse.append("\"id\":").append(record.getId()).append(",");
                jsonResponse.append("\"barrierSpecification\":\"").append(escapeJson(record.getBarrierSpecification())).append("\",");
                jsonResponse.append("\"resolutionSuggestion\":\"").append(escapeJson(record.getResolutionSuggestion())).append("\",");
                jsonResponse.append("\"location\":\"").append(escapeJson(record.getLocation())).append("\",");

                jsonResponse.append("\"rawBarrierType\":\"").append(record.getBarrierType() != null ? escapeJson(record.getBarrierType().name()) : "").append("\",");
                jsonResponse.append("\"rawBarrierCriticality\":\"").append(record.getBarrierCriticality() != null ? escapeJson(record.getBarrierCriticality().name()) : "").append("\",");
                jsonResponse.append("\"rawBarrierStatus\":\"").append(record.getBarrierStatus() != null ? escapeJson(record.getBarrierStatus().name()) : "").append("\",");

                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String formattedDate = "N/A";
                if (record.getBarrierIdentificationDate() != null) {
                    try {
                        formattedDate = record.getBarrierIdentificationDate().format(dateFormatter);
                    } catch (Exception e) {
                        System.err.println("Error formatting date for getRegistryServlet: " + e.getMessage());
                    }
                }
                jsonResponse.append("\"creationDate\":\"").append(formattedDate).append("\"");
                jsonResponse.append("}");
            }
            out.print(jsonResponse.toString());

        } catch (Exception e) {
            e.printStackTrace(System.err);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Erro ao buscar registro: " + escapeJson(e.getMessage()) + "\"}");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (out != null) {
                out.flush();
            }
        }
    }

    private String escapeJson(String str) {
        if (str == null) return "";

        return str.replace("\\", "\\\\")  // Deve vir primeiro
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}