package br.com.simba.model.service;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RedirectUser {
    DBConnection dbConnection = new PostgresConnection();
    UserDAO userDAO = new UserDAO(dbConnection.getConnection());


    public void redirectLogin(Username username, HttpServletResponse response) {
        User user = userDAO.getUserByUsername(username);

        try{
            if (user.getUserType().equals("reporter")){
                response.sendRedirect("/dashboard");
                return;
            };

            response.sendRedirect("/pages/nbr-9050");
        } catch (IOException e){
            throw new NullPointerException("Error: failed to redirect user to /dashboard or /pages/nbr-9050 page!");
        }
    }

    public void userNullRedirectToLogin(HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("user") != null) return;

        try {
            response.sendRedirect("/login");
        } catch (IOException e){
            throw new IllegalArgumentException("Error: failed to redirect to login page");
        }

    }
}
