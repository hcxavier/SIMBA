package br.com.simba.controller;

import br.com.simba.model.entities.User;
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

@WebServlet("/register/choose")
public class RegisterLobbyServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RedirectUser redirectUser = new RedirectUser();

        if (session.getAttribute("user") != null){
            String sessionUsername = ((User) session.getAttribute("user")).getUsername();
            redirectUser.redirectLogin(new Username(sessionUsername), response);
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/RegisterLobby.jsp");
        dispatcher.forward(request, response);
    }
}
