package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.RegistryDAO; // Adicionado import
import br.com.simba.model.entities.Registry; // Adicionado import
import br.com.simba.model.service.RedirectUser;
import br.com.simba.model.service.RegistryHandle;
import br.com.simba.model.service.SchoolHandle;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List; // Adicionado import


@WebServlet("/dashboard/manager")
public class DashboardManager extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        RedirectUser redirectUser = new RedirectUser();
        if(redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;
        if(!redirectUser.validateUserType(request.getSession(), "manager", response)) return;

        SchoolHandle schoolHandle = new SchoolHandle();
        RegistryHandle registryHandle = new RegistryHandle();
        RegistryDAO registryDAO = new RegistryDAO();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/DashboardManager.jsp");

        request.setAttribute("schoolAmount", schoolHandle.getAmountSchools());
        request.setAttribute("registryAmount", registryHandle.getAmountRegistry());
        request.setAttribute("registryUnderAnalysisAmount", registryHandle.getAmountRegistryByStatus("UNDER_ANALYSIS"));
        request.setAttribute("registryResolvedAmount", registryHandle.getAmountRegistryByStatus("RESOLVED"));

        List<Registry> recentRegistries = registryDAO.listAllRegistries();
        request.setAttribute("listRegistries", recentRegistries);

        dispatcher.forward(request, response);
    }
}