package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.User;
import br.com.simba.model.service.ManagerHandle;
import br.com.simba.model.service.RegistryHandle;

import br.com.simba.model.util.SQLErrorLog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/manager/barriers")
public class ManageBarriersServlet extends HttpServlet {
    private static final String OBSERVATION_DELIMITER = ";;;";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagerHandle managerHandle = new ManagerHandle();
        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || sessionUser == null) {
            if (request.getParameter("reportBarrierId") != null){
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário não autenticado.");
                return;
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = response.getWriter();
            out.print("{\"error\":\"Usuário não autenticado (sessão ou usuário nulo).\"}");
            out.flush();

            return;
        }

        String reportBarrierIdStr = request.getParameter("reportBarrierId");

        try {
            RegistryHandle registryHandle = new RegistryHandle();
            Manager manager = managerHandle.getManagerFromSessionUser(sessionUser);

            if (manager == null) {
                if (request.getParameter("reportBarrierId") != null){
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acesso negado. O usuário não é um gestor válido.");
                    return;
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                PrintWriter out = response.getWriter();
                out.print("{\"error\":\"Acesso negado. O usuário não é um gestor válido.\"}");
                out.flush();

                return;
            }

            if (reportBarrierIdStr != null) {
                try {
                    int barrierId = Integer.parseInt(reportBarrierIdStr);
                    registryHandle.handleGeneratePdfReport(request, response, barrierId);
                } catch (NumberFormatException e) {
                    if (!response.isCommitted()) response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID da barreira inválido.");
                }
            }

            if (reportBarrierIdStr == null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();

                int schoolId = manager.getSchoolId();
                RegistryDAO registryDAO = new RegistryDAO();
                List<Registry> barriers = registryDAO.listRegistriesBySchoolId(schoolId);

                StringBuilder jsonBuilder = new StringBuilder("[");

                for (int i = 0; i < barriers.size(); i++) {
                    Registry barrier = barriers.get(i);
                    jsonBuilder.append("{");
                    jsonBuilder.append("\"id\":").append(barrier.getId()).append(",");
                    jsonBuilder.append("\"name\":\"").append(escapeJson(barrier.getBarrierSpecification())).append("\",");
                    jsonBuilder.append("\"location\":\"").append(escapeJson(barrier.getLocation())).append("\",");
                    jsonBuilder.append("\"type\":\"").append(escapeJson(barrier.getBarrierType().toString())).append("\",");
                    jsonBuilder.append("\"criticality\":\"").append(escapeJson(barrier.getBarrierCriticality().toString())).append("\",");
                    jsonBuilder.append("\"status\":\"").append(escapeJson(barrier.getBarrierStatus().toString())).append("\",");
                    jsonBuilder.append("\"date\":\"").append(escapeJson(barrier.getBarrierIdentificationDate().format(DateTimeFormatter.ISO_LOCAL_DATE))).append("\",");

                    String obsText = registryDAO.getObservationsTextByRegistryId(barrier.getId());
                    List<String> observationsList = new ArrayList<>();

                    if (obsText != null && !obsText.isEmpty()) observationsList = Arrays.asList(obsText.split(OBSERVATION_DELIMITER));

                    jsonBuilder.append("\"observations\":[");

                    for (int j = 0; j < observationsList.size(); j++) {
                        jsonBuilder.append("\"").append(escapeJson(observationsList.get(j))).append("\"");

                        if (j < observationsList.size() - 1) {
                            jsonBuilder.append(",");
                        }
                    }

                    jsonBuilder.append("]");
                    jsonBuilder.append("}");

                    if (i < barriers.size() - 1) jsonBuilder.append(",");
                }

                jsonBuilder.append("]");
                out.print(jsonBuilder);
                out.flush();
            }

        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);

            if (!response.isCommitted()) {
                if (request.getParameter("reportBarrierId") != null){
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar dados para o relatório.");
                    return;
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                PrintWriter out = response.getWriter();
                out.print("{\"error\":\"Erro ao acessar o banco de dados (JSON): " + escapeJson(e.getMessage()) + "\"}");
                out.flush();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);

            if (!response.isCommitted()) {
                if (request.getParameter("reportBarrierId") != null){
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro inesperado ao gerar relatório: " + e.getMessage());
                    return;
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                PrintWriter out = response.getWriter();
                out.print("{\"error\":\"Erro inesperado (JSON): " + escapeJson(e.getMessage()) + "\"}");
                out.flush();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        ManagerHandle managerHandle = new ManagerHandle();

        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || sessionUser == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print("{\"error\":\"Usuário não autenticado (sessão ou usuário nulo).\"}");
            out.flush();
            return;
        }

        try {
            RegistryHandle registryHandle = new RegistryHandle();
            Manager manager = managerHandle.getManagerFromSessionUser(sessionUser);

            if (manager == null) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\":\"Acesso negado para a ação. O usuário não é um gestor válido.\"}");
                out.flush();
                return;
            }

            boolean actionMatched = false;
            if ("changeStatus".equals(action)) {
                actionMatched = true;
                registryHandle.handleChangeStatus(request, response, out);
            }
            if (!actionMatched && "addObservation".equals(action)) {
                actionMatched = true;
                registryHandle.handleAddObservation(request, response, out);
            }
            if (!actionMatched) {
                if (!response.isCommitted()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                out.print("{\"error\":\"Ação desconhecida: " + escapeJson(action) + "\"}");
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Erro ao acessar o banco de dados: " + escapeJson(e.getMessage()) + "\"}");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()){
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Erro inesperado: " + escapeJson(e.getMessage()) + "\"}");
            }
        }
    }

    private String escapeJson(String s) {
        if (s == null) {
            return "";
        }
        return s.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}