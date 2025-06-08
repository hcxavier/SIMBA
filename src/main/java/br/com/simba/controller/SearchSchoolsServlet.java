package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.entities.School;
import br.com.simba.model.service.SchoolHandle;
import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search-school")
public class SearchSchoolsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String schoolNameQuery = request.getParameter("q");

        System.out.println("DEBUG [Servlet]: SearchSchoolsServlet foi chamado!");
        System.out.println("DEBUG [Servlet]: Parâmetro 'q' recebido: " + request.getParameter("q"));
        SchoolHandle schoolHandle = new SchoolHandle();
        List<School> schools = schoolHandle.getSchoolsByName(schoolNameQuery);

        List<String> schoolNames = new ArrayList<>();

        if (schools != null) {
            for (School schoolObj : schools) {
                schoolNames.add(schoolObj.getName());
            }
        }

        String jsonResponse = new Gson().toJson(schoolNames);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
