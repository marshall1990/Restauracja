package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * dodaje brakujące składniki do listy brakujących składników 
 * 
 */
public class Brakujacedodaj {

    private String blad="Nie";
    /**
     * dodaje brakujące składniki do listy brakujących składników 
     * @param braki Tablica łańcuchów zawierająca brakujące składniki
     * @throws SQLException 
     */
    public void dodaj(String[] braki) throws SQLException  {
    
        Connection conn = null;
        
     try {
            Bazadanych baza= new Bazadanych();
            conn = baza.connectAdminPostgreSQL();
            
            String sql = "insert into braki values (?)";
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
