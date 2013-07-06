
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
     * 
     * Ta klasa reprezentuje menu
     */ 

public class Calemenu {
    private String blad="Nie";
    /**
     * 
     * @return ArrayList zawierajaca liste wszystkich dan w menu
     * @throws SQLException 
     */   
    public ArrayList<String> wypisz() throws SQLException {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn = null;
        ResultSet rst;

                    try {
                        Bazadanych baza = new Bazadanych(); 
                        conn = baza.connectKlientMySQL();
                        
                        String sql="SELECT ID_Dania,nazwa FROM danie ORDER BY nazwa";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        rst=statement.executeQuery();
                        
                        while(rst.next()){
                           skladniki.add(rst.getString(1));
                           skladniki.add(rst.getString(2));
                         }
                       }
                      catch (Exception e) { 
                        System.out.println("Blad polaczenia z baza danych."); 
                        blad="Tak";
                        } 
                    finally { conn.close(); }
        return skladniki;
    }  

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
}
