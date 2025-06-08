package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
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
import java.util.ArrayList; // Adicionado import para inicialização segura

@WebServlet("/dashboard/manager")
public class DashboardManager extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        RedirectUser redirectUser = new RedirectUser();
        if(redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;
        if(!redirectUser.validateUserType(request.getSession(), "manager", response)) return;

        DBConnection dbConnection = new PostgresConnection();
        SchoolHandle schoolHandle = new SchoolHandle(dbConnection.getConnection());
        RegistryHandle registryHandle = new RegistryHandle(dbConnection.getConnection());
        RegistryDAO registryDAO = new RegistryDAO(dbConnection.getConnection()); // Instanciar RegistryDAO
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/DashboardManager.jsp");

        request.setAttribute("schoolAmount", schoolHandle.getAmountSchools());
        request.setAttribute("registryAmount", registryHandle.getAmountRegistry());
        request.setAttribute("registryUnderAnalysisAmount", registryHandle.getAmountRegistryByStatus("UNDER_ANALYSIS"));
        request.setAttribute("registryResolvedAmount", registryHandle.getAmountRegistryByStatus("RESOLVED"));

        // Buscar e adicionar a lista de registros recentes
        List<Registry> recentRegistries = registryDAO.listAllRegistries(); // Ou uma consulta específica para o manager, se necessário
        request.setAttribute("listRegistries", recentRegistries);

        dispatcher.forward(request, response);
    }
}