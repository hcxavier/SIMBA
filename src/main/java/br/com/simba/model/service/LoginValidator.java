package br.com.simba.model.service;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.dao.*;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.Reporter;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;

public class LoginValidator {
    private UserDAO userDAO;

    public LoginValidator() {
        userDAO = new UserDAO();
    }

    public boolean isUsernamePasswordValid(String username, String password) {
        try {
            User user = userDAO.getUserByUsername(new Username(username));
            return BCrypt.checkpw(password, user.getHashedPassword());
        } catch (DataAccessException e) {
            System.out.println("Username not found in database!");
            return false;
        }
    }
}

