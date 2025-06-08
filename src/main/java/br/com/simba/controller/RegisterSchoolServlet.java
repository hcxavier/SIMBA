package br.com.simba.controller;

import br.com.simba.model.service.RedirectUser;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard/register-school")
public class RegisterSchoolServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RedirectUser redirectUser = new RedirectUser();
//        if (redirectUser.userNullRedirectToLogin(request.getSession(), response)) return;
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/RegisterSchool.jsp");
        dispatcher.forward(request, response);
    }
}
