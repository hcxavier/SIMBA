package br.com.simba.model.service;

import br.com.simba.exceptions.*;
import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.School;
import br.com.simba.model.valueobject.*;
import br.com.simba.model.dao.UserDAO;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.time.LocalDate;

public class RegisterValidator {
    private UserDAO userDAO;
    private Connection connection;

    public RegisterValidator(){
        DBConnection dbConnection = new PostgresConnection();
        connection = dbConnection.getConnection();
        userDAO = new UserDAO(connection);
    }

    public Email validateEmail(String email, HttpServletRequest request){
        if (!isEmailAvailable(new Email(email))){
            request.setAttribute("invalidEmail", "Email já está em uso");
            return null;
        }

        if (email.isEmpty()){
            request.setAttribute("invalidEmail", "Campo de email vazio!");
            return null;
        }

        try {
            return new Email(email);
        } catch (InvalidEmailException e) {
            request.setAttribute("invalidEmail", "Email inválido!");
            return null;
        }
    }

    private boolean isUsernameAvailable(Username username) {
        try {
            userDAO.getUserByUsername(username);
            return false;
        } catch (Exception e) {
            return true;
        }
    }

    private boolean isEmailAvailable(Email email) {
        try {
            userDAO.getUserByEmail(email);
            return false;
        } catch (Exception e) {
            return true;
        }
    }

    public Username validateUsername(String username, HttpServletRequest request){
        if (username.isEmpty()){
            request.setAttribute("invalidUsername", "Campo de apelido de acesso vazio!");
            return null;
        }

        if (!isUsernameAvailable(new Username(username))){
            request.setAttribute("invalidUsername", "Apelido de acesso já está em uso");
            return null;
        }
        try {
            return new Username(username);
        } catch (InvalidUsernameException e) {
            request.setAttribute("invalidUsername", "Apelido de acesso inválido! Não pode começar e nem terminar com os símbolos (_ e .).");
            return null;
        }
    }

    public LocalDate validateIdentificationDate(String date, HttpServletRequest request){
        if (date == null || date.isEmpty()){
            request.setAttribute("identificationDate", "Data inválida!");
            return null;
        }

        return LocalDate.parse(date);
    }

    public Password validatePassword(String password, HttpServletRequest request){
        if (password.isEmpty()){
            request.setAttribute("invalidPassword", "Campo de senha vazio!");
            return null;
        }

        try {
            return new Password(password);
        } catch (InvalidPasswordException e){
            request.setAttribute("invalidPassword", "Senha inválida! A senha deve conter pelo menos um símbolo (@, #, _, -), letra minúscula, letra maiúscula e número.");
            return null;
        }
    }

    public Address validateAddress(String street, int addressNumber, String neighborhood, String city, String state, HttpServletRequest request){
        if (street.isEmpty() || neighborhood.isEmpty() || city.isEmpty() || state.isEmpty() || addressNumber == -1){
            request.setAttribute("invalidAddress", "Campo de endereço vazio!");
            return null;
        }

        try {
            return new Address(street, addressNumber, neighborhood, city, state);
        } catch (InvalidAddressException e){
            request.setAttribute("invalidAddress", "Endereço inválido!");
            return null;
        }
    }

    public CPF validateCPF(String cpf, HttpServletRequest request){
        if (cpf.isEmpty()){
            request.setAttribute("invalidCPF", "Campo do CPF vazio!");
            return null;
        }

        try {
            return new CPF(cpf);
        } catch (InvalidCPFException e){
            request.setAttribute("invalidCPF", "CPF inválido!");
            return null;
        }
    }

    public School validateSchoolName(String schoolName, HttpServletRequest request){
        SchoolDAO schoolDAO = new SchoolDAO(connection);
        try {
            return schoolDAO.getSchoolByName(request.getParameter("schoolName"));
        } catch (DataAccessException e){
            request.setAttribute("invalidCPF", "CPF inválido!");
            return null;
        }
    }

    public boolean cpfIsNull(CPF CPF){
        if (CPF == null) return true;

        return false;
    }

    public boolean anyNull(Email email, Username username, Password password, Address address){
        if (email == null || username == null || password == null || address == null || address.getNumber() == -1) return true;

        return false;
    }

    public boolean anyNull(Email email, Username username, Password password, Address address, CPF CPF, School school){
        if (email == null || username == null || password == null || address == null || CPF == null || school == null || address.getNumber() == -1) return true;

        return false;
    }

    public boolean anyNull(School school, LocalDate localDate){
        if (school == null || localDate == null) return true;

        return false;
    }
}
