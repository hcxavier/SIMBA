package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.service.RedirectUser;
import br.com.simba.model.service.RegistryHandle;
import br.com.simba.model.service.SchoolHandle;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RedirectUser redirectUser = new RedirectUser();
        if(redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;

        DBConnection dbConnection = new PostgresConnection();
        SchoolHandle schoolHandle = new SchoolHandle(dbConnection.getConnection());
        RegistryHandle registryHandle = new RegistryHandle(dbConnection.getConnection());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Dashboard.jsp");

        request.setAttribute("schoolAmount", schoolHandle.getAmountSchools());
        request.setAttribute("registryAmount", registryHandle.getAmountRegistry());
        request.setAttribute("registryUnderAnalysisAmount", registryHandle.getAmountRegistryByStatus("UNDER_ANALYSIS"));
        request.setAttribute("registryResolvedAmount", registryHandle.getAmountRegistryByStatus("RESOLVED"));

        dispatcher.forward(request, response);
    }
}
