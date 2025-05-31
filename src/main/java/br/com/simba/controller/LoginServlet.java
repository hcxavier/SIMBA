package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.UserDAO;
//import br.com.simba.model.service.LoginValidator;
import br.com.simba.model.entities.User;
import br.com.simba.model.service.LoginValidator;
import br.com.simba.model.service.RedirectUser;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private DBConnection connection = new PostgresConnection();
    private UserDAO userDAO = new UserDAO(connection.getConnection());

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RedirectUser redirectUser = new RedirectUser();
        HttpSession session = request.getSession();

        LoginValidator loginValidator = new LoginValidator();
        RequestDispatcher dispatcher;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (!loginValidator.isUsernamePasswordValid(username, password)){
            request.setAttribute("accessUnauthorized", "Apelido de acesso ou senha incorretos!");
            dispatcher = request.getRequestDispatcher("/pages/Login.jsp");
            dispatcher.forward(request, response);
            return;
        }
        User user = userDAO.getUserByUsername(new Username(username));
        session.setAttribute("user", user);
        redirectUser.redirectLogin(new Username(username), response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        RedirectUser redirectUser = new RedirectUser();

        if (session.getAttribute("user") != null){
            String sessionUsername = ((User) session.getAttribute("user")).getUsername();
            redirectUser.redirectLogin(new Username(sessionUsername), response);
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Login.jsp");
        dispatcher.forward(request, response);
    }
}
