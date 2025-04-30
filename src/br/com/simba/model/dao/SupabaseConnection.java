package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SupabaseConnection {
    private final String url = "jdbc:postgresql://db.xlspqfcjyhhzztqypocf.supabase.co:5432/postgres?sslmode=require";

    private final String user = "postgres";
    private final String password = "";
    private static Connection connection = null;

    public Connection openConnection() {
        if (connection != null) return connection;

        try {
            Class.forName("org.postgresql.Driver"); 
            connection = DriverManager.getConnection(url, user, password);
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
