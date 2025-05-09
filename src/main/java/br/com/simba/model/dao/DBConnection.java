package br.com.simba.model.dao;

import java.sql.Connection;

public interface DBConnection {
    public Connection getConnection();
    public void close();
}
