package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.service.RedirectUser;
import br.com.simba.model.service.RegistryHandle;
import br.com.simba.model.service.SchoolHandle;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolHandle schoolHandle = new SchoolHandle();
        RegistryHandle registryHandle = new RegistryHandle();
        RegistryDAO registryDAO = new RegistryDAO();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Dashboard.jsp");
        RedirectUser redirectUser = new RedirectUser();
        if (redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;
        if (!redirectUser.validateUserType(request.getSession(), "reporter", response)) return;

        request.setAttribute("schoolAmount", schoolHandle.getAmountSchools());
        request.setAttribute("registryAmount", registryHandle.getAmountRegistry());
        request.setAttribute("registryUnderAnalysisAmount", registryHandle.getAmountRegistryByStatus("UNDER_ANALYSIS"));
        request.setAttribute("registryResolvedAmount", registryHandle.getAmountRegistryByStatus("RESOLVED"));

        List<Registry> recentRegistries = registryDAO.listAllRegistries();
        request.setAttribute("listRegistries", recentRegistries);

        dispatcher.forward(request, response);
    }
}