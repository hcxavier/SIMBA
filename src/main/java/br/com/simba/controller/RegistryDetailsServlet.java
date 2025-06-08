package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Registry;
// Adicione os imports necessários se não estiverem já presentes


import br.com.simba.model.service.RedirectUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/dashboard/registry")
public class RegistryDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RedirectUser redirectUser = new RedirectUser();
        if(redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;
        String barrierIdStr = request.getParameter("id");
        Registry registry = null;
        String errorMessage = null;

        if (barrierIdStr != null && !barrierIdStr.trim().isEmpty()) {
            try {
                int barrierId = Integer.parseInt(barrierIdStr);
                try {
                    RegistryDAO registryDAO = new RegistryDAO();
                    registry = registryDAO.findById(barrierId);
                    if (registry == null) {
                        errorMessage = "Barreira não encontrada com o ID fornecido.";
                    }
                } catch (Exception e) {
                    System.err.println("General Error in BarrierDetailsServlet: " + e.getMessage());
                    e.printStackTrace();
                    errorMessage = "Ocorreu um erro inesperado ao buscar os dados da barreira.";
                }
            } catch (NumberFormatException e) {
                errorMessage = "ID da barreira inválido.";
            }
        } else {
            errorMessage = "ID da barreira não fornecido.";
        }

        if (registry != null) {
            request.setAttribute("registry", registry);
        }
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }

        request.getRequestDispatcher("/pages/RegistryDetails.jsp").forward(request, response);
    }
}