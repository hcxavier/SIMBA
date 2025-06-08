package br.com.simba.model.service;

import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RedirectUser {
    UserDAO userDAO = new UserDAO();


    public void redirectLogin(Username username, HttpServletResponse response) {
        User user = userDAO.getUserByUsername(username);

        try{
            if (user.getUserType().equals("reporter")){
                response.sendRedirect("/dashboard");
                return;
            };

            response.sendRedirect("/dashboard/manager");
        } catch (IOException e){
            throw new NullPointerException("Error: failed to redirect user to /dashboard or /pages/nbr-9050 page!");
        }
    }

    public boolean userNullRedirectToLogin(HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("user") != null) return false;

        try {
            response.sendRedirect("/login");
            return true;
        } catch (IOException e){
            throw new IllegalArgumentException("Error: failed to redirect to login page!");
        }
    }

    public boolean validateUserType(HttpSession session, String targetType, HttpServletResponse response){
        User user = (User) session.getAttribute("user");

        if (user.getUserType().trim().equals(targetType.trim())) return true;

        try {
            response.sendRedirect("/index");
            return false;
        } catch (IOException e){
            throw new IllegalArgumentException("Error: failed to redirect to index page!");
        }
    }
}
