package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.entities.School;
import br.com.simba.model.service.SchoolHandle;
import br.com.simba.model.util.SQLErrorLog;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search-schools-filtered")
public class SearchSchoolsWithFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cityParam = request.getParameter("city");
        String nameParam = request.getParameter("search_school");

        List<School> schools;

        try {
            SchoolHandle schoolHandle = new SchoolHandle();

            schools = schoolHandle.getSchoolsByCityAndName(cityParam, nameParam);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Erro interno ao processar a solicitação: " + e.getMessage());
            return;
        }

        Gson gson = new GsonBuilder().create();
        String jsonResponse = gson.toJson(schools);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}