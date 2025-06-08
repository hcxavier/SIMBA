package br.com.simba.controller;

import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.User;
import br.com.simba.model.util.PasswordUtils;
import br.com.simba.model.valueobject.Password;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String usernameParam = request.getParameter("username");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");

            try {
                User user = userDAO.getUserByUsername(new Username(usernameParam));
                if (user != null && PasswordUtils.checkPassword(currentPassword, user.getHashedPassword())) {
                    user.setPassword(new Password(newPassword));
                    userDAO.updatePassword(user);
                    response.sendRedirect(request.getContextPath() + "/dashboard/profile");
                } else {
                    response.getWriter().write("Senha atual incorreta!");
                }
            } catch (Exception e) {
                e.printStackTrace();
                e.printStackTrace(response.getWriter());
                response.getWriter().write("Erro ao atualizar senha.");
            }
    }
}
