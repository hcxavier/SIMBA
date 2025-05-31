package br.com.simba.model.service;

import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;

import java.sql.Connection;
import java.sql.SQLException;

public class ManagerHandle {
    public Manager getManagerFromSessionUser(User sessionUser, Connection conn) throws SQLException {
        if (sessionUser == null) return null;

        String userTypeFromSession = sessionUser.getUserType();
        String normalizedUserType = (userTypeFromSession != null) ? userTypeFromSession.trim().toLowerCase() : null;
        boolean isManagerType = "manager".equals(normalizedUserType);

        if (!isManagerType) return null;

        ManagerDAO managerDAO = new ManagerDAO(conn);

        return managerDAO.getManagerByUsername(new Username(sessionUser.getUsername()));
    }
}
