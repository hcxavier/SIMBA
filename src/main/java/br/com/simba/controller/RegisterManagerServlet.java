package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.School;
import br.com.simba.model.service.RegisterValidator;
import br.com.simba.model.valueobject.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/register/manager")
public class RegisterManagerServlet extends HttpServlet{
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        DBConnection dbConnection = new PostgresConnection();
        Connection connection = dbConnection.getConnection();
        SchoolDAO schoolDAO = new SchoolDAO(dbConnection.getConnection());
        RegisterValidator validate = new RegisterValidator();
        RequestDispatcher dispatcher;
        String requestUserType = request.getParameter("ocupation");
        String requestFullname = String.format("%s %s", request.getParameter("name"), request.getParameter("surname"));
        CPF requestCPF = validate.validateCPF(request.getParameter("cpf"), request);

        Email requestEmail = validate.validateEmail(request.getParameter("email"), request);

        Password requestPassword = validate.validatePassword(request.getParameter("password"), request);

        Username requestUsername = validate.validateUsername(request.getParameter("username"), request);

        String requestStreet = request.getParameter("street");
        String requestNeighborhood = request.getParameter("neighborhood"), requestCity = request.getParameter("city");
        String requestState = request.getParameter("state");
        School requestSchool = validate.validateSchoolName(request.getParameter("schoolName"), request);

        int requestNumber = -1;
        try {
            requestNumber = Integer.parseInt(request.getParameter("addressNumber"));
        } catch (NumberFormatException e) {
            request.setAttribute("invalidAddressNumber", "INVALID_ADDRESS_NUMBER");
        }

        Address requestAddress = validate.validateAddress(requestStreet, requestNumber, requestNeighborhood, requestCity, requestState, request);

        if (validate.anyNull(requestEmail, requestUsername, requestPassword, requestAddress, requestCPF, requestSchool)){
            request.setAttribute("registrationFailed", "REGISTRATION_FAILED");
            dispatcher = request.getRequestDispatcher("/pages/RegisterManager.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Manager manager = new Manager(requestUsername, requestFullname, requestAddress.getStreet(), requestAddress.getNumber(), requestAddress.getNeighborhood(),
                requestAddress.getCity(), requestAddress.getStateAbbr(), requestEmail, requestPassword, requestCPF, requestSchool);
        manager.addToDatabase(connection);
        System.out.printf("Teacher [%s] registered successfully.%n", requestFullname);
        request.getSession().setAttribute("success", "SUCCESS");

        dispatcher = request.getRequestDispatcher("/pages/Login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/RegisterManager.jsp");
        requestDispatcher.forward(request, response);
    }
}
