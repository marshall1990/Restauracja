/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * 
 * Ta klasa reprezentuje przypisywanie skladnikow do dania
 */
public class Dodaniedaniaskladniki {
    private String blad="Nie";
    
    /**
     * Przypisuje daniu o nazwie @param nazwa liste skladnikow @param skladniki, Zapisuje te dane w bazie danych
     * @param skladniki dania
     * @param nazwa dania 
     * @throws SQLException 
     */
    public void dodaj(String skladniki[], String nazwa) throws SQLException {
    
        Connection conn = null;
        ResultSet rst=null;
        

        try {
            Bazadanych baza = new Bazadanych(); 
            conn = baza.connectAdminMySQL();
            
            String sql="SELECT ID_Dania FROM danie where nazwa='"+nazwa+"'";
            Statement statement=conn.createStatement();
            rst=statement.executeQuery(sql);
            rst.next();

            sql="insert into `daniaskladniki` values (?,?,?)";
            PreparedStatement statement1=conn.prepareStatement(sql);

            for(int i=0; i<skladniki.length; i++) {      
                statement1.setInt(1,rst.getInt(1));
                statement1.setInt(2,Integer.parseInt(skladniki[i]));
                statement1.setInt(3,100);
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
