package br.com.simba.model.service;

import br.com.simba.config.exceptions.*;
import br.com.simba.model.valueobject.*;
import br.com.simba.model.dao.UserDAO;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterValidator {
    public Email validateEmail(String email, HttpServletRequest request){
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

    private boolean isUsernameAvailable(String username) {
        UserDAO userDAO = new UserDAO();

        if (userDAO.findByUsername(username) == null) return true;

        return false;
    }

    public Username validateUsername(String username, HttpServletRequest request){
        if (username.isEmpty()){
            request.setAttribute("invalidUsername", "Campo de apelido de acesso vazio!");
            return null;
        }

        if (!isUsernameAvailable(username)){
            request.setAttribute("usernameAlreadyUsed", "Apelido de acesso já está em uso");
            return null;
        }
        try {
            return new Username(username);
        } catch (InvalidUsernameException e) {
            request.setAttribute("invalidUsername", "Apelido de acesso inválido! Não pode começar e nem terminar com os símbolos (_ e .).");
            return null;
        }
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

    public Siape validateSiape(String siape, HttpServletRequest request){
        if (siape.isEmpty()){
            request.setAttribute("invalidSiape", "Campo do siape vazio!");
            return null;
        }

        try {
            return new Siape(siape);
        } catch (InvalidSiapeException e){
            request.setAttribute("invalidSiape", "Siape inválido!");
            return null;
        }
    }

    public boolean siapeIsNull(Siape siape){
        if (siape == null) return true;

        return false;
    }

    public boolean anyNull(Email email, Username username, Password password, Address address){
        if (email == null || username == null || password == null || address == null || address.getNumber() == -1) return true;

        return false;
    }
}
