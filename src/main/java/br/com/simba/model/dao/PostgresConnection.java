package br.com.simba.model.dao;

import br.com.simba.model.util.SQLErrorLog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresConnection implements DBConnection {
    private Connection connection = null;

    @Override
    public Connection getConnection() {
        if (connection != null) return connection;

        try {
            Class.forName("org.postgresql.Driver");
            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

//            String url = "jdbc:postgresql://localhost:5432/simbadb";
//            String user = "simba";
//            String password = "@Cloud772";
            connection = DriverManager.getConnection(url, user, password);

        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            System.out.println("Error connecting to the database");
            throw new RuntimeException(e);

        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL Driver not found");
            throw new RuntimeException(e);
        }

        return connection;
    }

    @Override
    public void close() {
        if (connection == null) throw new IllegalArgumentException("Connection doesn't exist or is closed!");

        try {
            connection.close();
            connection = null;
        } catch (SQLException e) {
            System.out.println("Error closing connection");
            e.printStackTrace();
        }
    }
}
