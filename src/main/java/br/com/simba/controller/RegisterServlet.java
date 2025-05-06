package br.com.simba.controller;

import br.com.simba.config.exceptions.*;
import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.Student;
import br.com.simba.model.entities.Teacher;
import br.com.simba.model.service.RegisterValidator;
import br.com.simba.model.valueobject.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RegisterValidator validate = new RegisterValidator();
        RequestDispatcher dispatcher;
        String requestUserType = request.getParameter("ocupation");
        String requestFullname = String.format("%s %s", request.getParameter("name"), request.getParameter("surname"));
        String requestUserId = request.getParameter("user_id");

        Email requestEmail = validate.validateEmail(request.getParameter("email"), request);

        Password requestPassword = validate.validatePassword(request.getParameter("password"), request);

        Username requestUsername = validate.validateUsername(request.getParameter("username"), request);

        String requestStreet = request.getParameter("street");
        String requestNeighborhood = request.getParameter("neighborhood"), requestCity = request.getParameter("city");
        String requestState = request.getParameter("state");

        int requestNumber = -1;
        try {
            requestNumber = Integer.parseInt(request.getParameter("addressNumber"));
        } catch (NumberFormatException e) {
            request.setAttribute("invalidAddressNumber", "INVALID_ADDRESS_NUMBER");
        }

        Address requestAddress = validate.validateAddress(requestStreet, requestNumber, requestNeighborhood, requestCity, requestState, request);

        if (requestUserType.equals("Teacher") && !validate.anyNull(requestEmail, requestUsername, requestPassword, requestAddress)){
            Siape requestSiape = validate.validateSiape(request.getParameter("user_id"), request);

            if (requestSiape != null){
                Teacher teacher = new Teacher(requestUsername, requestFullname, requestAddress.getStreet(), requestAddress.getNumber(), requestAddress.getNeighborhood(),
                        requestAddress.getCity(), requestAddress.getStateAbbr(), requestEmail, requestPassword, requestSiape);
                teacher.addToDatabase();
                System.out.printf("Teacher [%s] registered successfully.%n", requestFullname);
                request.getSession().setAttribute("success", "SUCCESS");

                dispatcher = request.getRequestDispatcher("/login");
                dispatcher.forward(request, response);
                return;
            }
        }

        if (requestUserType.equals("Student") && !validate.anyNull(requestEmail, requestUsername, requestPassword, requestAddress)){
            Student student = new Student(requestUsername, requestFullname, requestAddress.getStreet(), requestAddress.getNumber(), requestAddress.getNeighborhood(),
                    requestAddress.getCity(), requestAddress.getStateAbbr(), requestEmail, requestPassword, requestUserId);
            student.addToDatabase();
            System.out.printf("Student [%s] registered successfully.%n", requestFullname);
            request.getSession().setAttribute("success", "SUCCESS");
            dispatcher = request.getRequestDispatcher("/pages/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        request.setAttribute("registrationFailed", "REGISTRATION_FAILED");
        dispatcher = request.getRequestDispatcher("/pages/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/register.jsp");
        requestDispatcher.forward(request, response);
    }
}
