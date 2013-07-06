package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * dodaje brakujace skladniki do listy brakujacych skladnikow 
 * 
 */
public class Brakujacedodaj {

    private String blad="Nie";
    /**
     * dodaje brakujace skladniki do listy brakujacych skladnikow 
     * @param braki Tablica lancuchow zawierajaca brakujace skladniki
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
              System.out.println("Blad polaczenia z baza danych."); 
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
