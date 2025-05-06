package br.com.simba.model.service;

import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

public class LoginValidator {

    public boolean isUsernamePasswordValid (String username, String password){
        User user = isUsernameValid(username);
        if (user == null) return false;

        return BCrypt.checkpw(password, user.getPassword());
    }

    private User isUsernameValid (String username) {
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByUsername(username);

        if (user == null) return null;

        return user;
    }
}
