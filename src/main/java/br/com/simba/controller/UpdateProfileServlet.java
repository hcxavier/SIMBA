package br.com.simba.controller;
import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Email;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/updateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private DBConnection connection = new PostgresConnection();
    private UserDAO userDAO = new UserDAO(connection.getConnection());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String fullName = request.getParameter("fullName");
            String usernameParam = request.getParameter("username");
            String email = request.getParameter("email");
            String street = request.getParameter("street");
            String addressNumberStr = request.getParameter("addressNumber");
            String neighborhood = request.getParameter("neighborhood");
            String city = request.getParameter("city");
            String state = request.getParameter("state");

            int addressNumber = 0;
            try {
                addressNumber = Integer.parseInt(addressNumberStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("dashboard/profile?error=invalidAddressNumber");
                return;
            }

            User user = (User) request.getSession().getAttribute("user");
            user.setName(fullName);
            user.setUsername(new Username(usernameParam));
            user.setEmail(new Email(email));
            user.setAddress(street, addressNumber, neighborhood, city, state);

            try {
                User existingUser = userDAO.getUserByUsername(new Username(user.getUsername()));
                user.setPassword(existingUser.getPassword());
                userDAO.update(user);
                request.getSession().setAttribute("user", user);
                response.sendRedirect("dashboard/profile?success=true");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("dashboard/profile?error=true");
            }
    }


}