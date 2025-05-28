package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.service.RegistryHandle;

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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/searchRegistriesServlet")
public class SearchRegistriesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = session.getAttribute("user").toString();
        DBConnection dbConnection = new PostgresConnection();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        String sortOrder = request.getParameter("sortOrder");
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "recent";
        }

        List<Registry> records = new ArrayList<>();
        Connection conn = null;

        try {
            conn = dbConnection.getConnection();

            if (conn == null) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Database connection failed\"}");
                out.flush();
                return;
            }

            RegistryHandle registryHandle = new RegistryHandle(conn, username);

            switch (sortOrder) {
                case "recent":
                    records = registryHandle.getRegistriesByNameAndOrder(searchTerm, "recent");
                    break;
                case "oldest":
                    records = registryHandle.getRegistriesByNameAndOrder(searchTerm, "oldest");
                    break;
                case "urgency_high":
                    records = registryHandle.getRegistriesByNameAndUrgency(searchTerm, BarrierCriticality.HIGH);
                    break;
                case "urgency_low":
                    records = registryHandle.getRegistriesByNameAndUrgency(searchTerm, BarrierCriticality.LOW);
                    break;
                case "status_pending":
                    records = registryHandle.getRegistriesByNameAndStatus(searchTerm, BarrierStatus.UNDER_ANALYSIS);
                    break;
                case "status_resolved":
                    records = registryHandle.getRegistriesByNameAndStatus(searchTerm, BarrierStatus.RESOLVED);
                    break;
                default:
                    records = registryHandle.getRegistriesByNameAndOrder(searchTerm, "recent");
                    break;
            }

            String jsonResponse = convertRegistriesToJson(records);
            out.print(jsonResponse);

        } catch (Exception e) {
            // É uma boa prática logar a exceção no servidor para futuras análises
            e.printStackTrace(System.err);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Error processing request: " + escapeJson(e.getMessage()) + "\"}");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err); // Logar erro ao fechar conexão
                }
            }
            if (out != null) {
                out.flush();
            }
        }
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

    private String convertRegistriesToJson(List<Registry> records) {
        if (records == null || records.isEmpty()) {
            return "[]";
        }

        StringBuilder json = new StringBuilder("[");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        for (int i = 0; i < records.size(); i++) {
            Registry record = records.get(i);

            if (record == null) {
                if (i > 0 && json.charAt(json.length() - 1) != '[') {
                    json.append(",");
                }
                json.append("null");
                continue;
            }

            json.append("{");
            json.append("\"id\":").append(record.getId()).append(",");

            String spec = record.getBarrierSpecification();
            json.append("\"barrierSpecification\":\"").append(escapeJson(spec)).append("\",");

            String barrierTypeStr = "N/A";
            if (record.getBarrierType() != null) {
                barrierTypeStr = escapeJson(record.getBarrierType().getDisplayName());
            }
            json.append("\"barrierType\":\"").append(barrierTypeStr).append("\",");

            String criticalityStr = "N/A";
            if (record.getBarrierCriticality() != null) {
                criticalityStr = escapeJson(record.getBarrierCriticality().getDisplayName());
            }
            json.append("\"barrierCriticality\":\"").append(criticalityStr).append("\",");

            String statusStr = "N/A";
            if (record.getBarrierStatus() != null) {
                statusStr = escapeJson(record.getBarrierStatus().getDisplayName());
            }
            json.append("\"barrierStatus\":\"").append(statusStr).append("\",");

            String formattedDate = "N/A";
            LocalDate dateToFormat = record.getBarrierIdentificationDate();
            if (dateToFormat != null) {
                try {
                    formattedDate = dateToFormat.format(dateFormatter);
                } catch (Exception ex) {
                    System.err.println("Error formatting date " + dateToFormat + " for record ID " + record.getId() + ": " + ex.getMessage());
                }
            }
            json.append("\"creationDate\":\"").append(formattedDate).append("\"");
            json.append("}");

            if (i < records.size() - 1) {
                boolean nextIsNull = (i + 1 < records.size() && records.get(i + 1) == null && (i + 2 >= records.size() || records.get(i+2) != null) );
                boolean allNextAreNull = true;
                if (i + 1 < records.size()) {
                    for(int k = i + 1; k < records.size(); k++) {
                        if(records.get(k) != null) {
                            allNextAreNull = false;
                            break;
                        }
                    }
                } else {
                    allNextAreNull = false;
                }


                if (!allNextAreNull) {
                    json.append(",");
                }
            }
        }

        if (json.length() > 1 && json.charAt(json.length() -1) == ',') {
            json.deleteCharAt(json.length() -1);
        }
        json.append("]");
        return json.toString();
    }
}