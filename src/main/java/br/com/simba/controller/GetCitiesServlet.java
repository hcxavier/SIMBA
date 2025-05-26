package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.StateDAO;
import br.com.simba.model.util.SQLErrorLog;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getCities")
public class GetCitiesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new PostgresConnection();
        String stateAbbreviation = request.getParameter("state");
        List<String> cities = new ArrayList<>();
        Connection conn = null;

        if (stateAbbreviation != null && !stateAbbreviation.isEmpty()) {
            try {
                conn = dbConnection.getConnection();

                if (conn == null) {
                    throw new SQLException("Failed to establish database connection.");
                }

                StateDAO stateDAO = new StateDAO(conn);
                cities = stateDAO.getCitiesByState(stateAbbreviation);

            } catch (SQLException e) {
                SQLErrorLog.reportSqlException(e);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error: failed to search cities: " + e.getMessage());
                return;
            } catch (Exception e) {
                e.printStackTrace(System.err);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error: internal problem: " + e.getMessage());
                return;
            }
            finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        SQLErrorLog.reportSqlException(e);
                    }
                }
            }
        }

        String jsonCities = new Gson().toJson(cities);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonCities);
        out.flush();
    }
}
