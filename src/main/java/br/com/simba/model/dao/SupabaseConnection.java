package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SupabaseConnection {

    private static Connection connection = null;

    public Connection openConnection() {
        if (connection != null)
            return connection;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    System.getenv("DB_URL"),
                    System.getenv("DB_USER"),
                    System.getenv("DB_PASSWORD"));

        } catch (SQLException e) {
            System.out.println("Error connecting to the database");
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL Driver not found");
            throw new RuntimeException(e);
        }

        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                System.out.println("Error closing connection");
                e.printStackTrace();
            }
        }
    }
}
