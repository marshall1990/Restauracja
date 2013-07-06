/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Brakujacedodaj {

    private String blad="Nie";
    
    public void dodaj(String[] braki) throws SQLException  {
    
        Connection conn = null;
        ResultSet rst;
        
     try {
            Bazadanych baza= new Bazadanych();
            Class.forName(baza.getDriverPostgreSQL()).newInstance();
            conn = DriverManager.getConnection(baza.getUrlPostgreSQL()+baza.getDbNamePostgreSQL(), baza.getUserNameAdminPostgreSQL(),baza.getPasswordAdminPostgreSQL());

            String sql;
            sql = "insert into braki values (?)";
            PreparedStatement statement1=conn.prepareStatement(sql);

            for(int i=0; i<braki.length; i++) {      
                statement1.setString(1,braki[i]);
                statement1.executeUpdate();
               }                
          }
          catch (Exception e) { 
              System.out.println("Błąd połączenia z bazą danych."); 
              blad="Tak";
           } 
          finally { conn.close(); }
    }

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
    
}
