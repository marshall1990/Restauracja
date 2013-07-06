package org.mypackage.hello;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * Ta klasa reprezentuje połączenia z bazami danych.
 */
public class Bazadanych {
  
    private String urlMySQL="jdbc:mysql://johnny.heliohost.org:3306/";
    private String dbNameMySQL="hariseld_dania";
    private String driverMySQL="com.mysql.jdbc.Driver";
    private String userNameKlientMySQL="hariseld_klient";
    private String passwordKlientMySQL="klient";
    
    private String urlPostgreSQL="jdbc:postgresql://johnny.heliohost.org:5432/";
    private String dbNamePostgreSQL="hariseld_zlecenia";
    private String driverPostgreSQL="org.postgresql.Driver";
    private String userNameAdminPostgreSQL="hariseld";
    private String passwordAdminPostgreSQL="123qwe";
    
    private String userNameAdminMySQL="hariseld_hari";
    private String passwordAdminMySQL="123qwe";
    
    /**
     * 
     * @return połączenie z bazą danych MySQL - ograniczone uprawnienia.
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public Connection connectKlientMySQL() throws SQLException, ClassNotFoundException{
        
        Connection connection;
        Class.forName(driverMySQL);
        connection = DriverManager.getConnection(urlMySQL+dbNameMySQL,userNameKlientMySQL,passwordKlientMySQL);
        return connection;
    
    }
    
    /**
     * 
     * @return połączenie z bazą danych MySQL - pełne uprawnienia.
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public Connection connectAdminMySQL() throws SQLException, ClassNotFoundException{
        
        Connection connection;
        Class.forName(driverMySQL);
        connection = DriverManager.getConnection(urlMySQL+dbNameMySQL,userNameAdminMySQL,passwordAdminMySQL);
        return connection;
    
    }
    
    /**
     * 
     * @return połączenie z bazą danych PostgreSQL - pełne uprawnienia.
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public Connection connectAdminPostgreSQL() throws SQLException, ClassNotFoundException{
        
        Connection connection;
        Class.forName(driverPostgreSQL);
        connection = DriverManager.getConnection(urlPostgreSQL+dbNamePostgreSQL,userNameAdminPostgreSQL,passwordAdminPostgreSQL);
        return connection;
    
    }
   
}