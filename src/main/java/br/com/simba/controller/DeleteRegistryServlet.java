package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.RegistryDAO;

import br.com.simba.model.util.SQLErrorLog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/deleteRegistryServlet")
public class DeleteRegistryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder jsonResponse = new StringBuilder();

        String recordIdParam = request.getParameter("id");

        if (recordIdParam == null || recordIdParam.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.append("{\"success\":false, \"error\":\"ID do registro não fornecido.\"}");
            out.print(jsonResponse.toString());
            out.flush();
            return;
        }

        int recordId;
        try {
            recordId = Integer.parseInt(recordIdParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.append("{\"success\":false, \"error\":\"ID do registro inválido.\"}");
            out.print(jsonResponse.toString());
            out.flush();
            return;
        }

        boolean deleted = false;
        String errorMessage = null;

        try {
            RegistryDAO registryDAO = new RegistryDAO();
            registryDAO.delete(recordId);
        } catch (Exception e) {
            errorMessage = "Erro interno ao tentar excluir o registro: " + e.getMessage();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        jsonResponse.append("{\"success\":true, \"message\":\"Registro excluído com sucesso.\"}");

        out.print(jsonResponse.toString());
        out.flush();
        out.close();
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Método GET não é suportado para esta URL.");
    }
}