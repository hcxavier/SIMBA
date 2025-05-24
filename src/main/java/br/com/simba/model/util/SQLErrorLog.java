package br.com.simba.model.util;

import java.sql.SQLException;

public class SQLErrorLog {
    public static void reportSqlException(SQLException e){
        System.out.println("SQL State: " + e.getSQLState());
        System.out.println("Error Code: " + e.getErrorCode());
        System.out.println("Message: " + e.getMessage());
        e.printStackTrace(System.err);
    }
}
