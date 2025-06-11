package br.com.simba.controller;

import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.School;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.CNPJ;
import br.com.simba.model.valueobject.Phone;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard/register-school")
public class RegisterSchoolServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/RegisterSchool.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String name = request.getParameter("name");
            String cnpjValue = request.getParameter("cnpj");
            String phoneValue = request.getParameter("phone");
            String street = request.getParameter("street");
            int number = Integer.parseInt(request.getParameter("number"));
            String neighborhood = request.getParameter("neighborhood");
            String city = request.getParameter("city");
            String stateAbbr = request.getParameter("stateAbbr");
            CNPJ cnpj = new CNPJ(cnpjValue);
            Phone phone = new Phone(phoneValue);
            School school = new School(name, street, number, neighborhood, city, stateAbbr, phone, cnpj);
            SchoolDAO schoolDAO = new SchoolDAO();
            schoolDAO.insert(school);
            request.getSession().setAttribute("successMessage", "Escola cadastrada com sucesso!");
            response.sendRedirect(request.getContextPath() + "/dashboard/register-school");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "O número do endereço é inválido.");
            doGet(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Dados inválidos: " + e.getMessage());
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ocorreu um erro ao cadastrar a escola. Tente novamente.");
            doGet(request, response);
        }
    }
}