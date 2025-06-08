package br.com.simba.controller;

import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.entities.Reporter;
import br.com.simba.model.service.RegisterValidator;
import br.com.simba.model.valueobject.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register/reporter")
public class RegisterReporterServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/RegisterReporter.jsp");
        dispatcher.forward(request, response);
    }

        @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RegisterValidator validate = new RegisterValidator();
        RequestDispatcher dispatcher;
        String requestFullname = String.format("%s %s", request.getParameter("name"), request.getParameter("surname"));

        Email requestEmail = validate.validateEmail(request.getParameter("email"), request);
        Password requestPassword = validate.validatePassword(request.getParameter("password"), request);
        Username requestUsername = validate.validateUsername(request.getParameter("username"), request);

        String requestStreet = request.getParameter("street");
        String requestNeighborhood = request.getParameter("neighborhood");
        String requestCity = request.getParameter("city");
        String requestState = request.getParameter("state");

        int requestNumber = -1;
        try {
            requestNumber = Integer.parseInt(request.getParameter("addressNumber"));
        } catch (NumberFormatException e) {
            request.setAttribute("invalidAddressNumber", "INVALID_ADDRESS_NUMBER");
        }

        Address requestAddress = validate.validateAddress(requestStreet, requestNumber, requestNeighborhood, requestCity, requestState, request);

        if (validate.anyNull(requestEmail, requestUsername, requestPassword, requestAddress)){
            request.setAttribute("registrationFailed", "REGISTRATION_FAILED");
            dispatcher = request.getRequestDispatcher("/pages/RegisterReporter.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Reporter reporter = new Reporter(requestUsername, requestFullname, requestAddress.getStreet(), requestAddress.getNumber(),
                requestAddress.getNeighborhood(), requestAddress.getCity(), requestAddress.getStateAbbr(), requestEmail, requestPassword);
        reporter.addToDatabase();
        System.out.printf("Reporter [%s] registered successfully.%n", requestFullname);
        request.getSession().setAttribute("success", "SUCCESS");
        dispatcher = request.getRequestDispatcher("/pages/Login.jsp");
        dispatcher.forward(request, response);
    }
}
