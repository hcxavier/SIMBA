package br.com.simba;

import java.sql.ResultSet;

import br.com.simba.model.dao.*;

public class Main {
    public static void main(String[] args) {
        SupabaseConnection db = new SupabaseConnection();

        // Insert
        db.executeInsert("INSERT INTO User (username, name, address, email, phone, password) VALUES ('maiko_sousa', 'maiko', 'Rua das Flores, 123, Centro, São Paulo, SP, 01001-000', 'maiko@email.com', '11987654321', '1234', '1234567');");

        // Select
        try {
            ResultSet rs = db.executeSelect("SELECT * FROM User");
            while (rs != null && rs.next()) {
                System.out.println(rs.getString("username"));
            }
            if (rs != null) rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Close connection
        db.closeConnection();
    }
}
