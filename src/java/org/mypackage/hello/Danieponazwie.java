
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * 
 * Ta klasa reprezentuje wyszukiwanie dania po nazwie
 */
public class Danieponazwie {
    private String blad="Nie";
    
    /**
     * 
     * @param nazwa dania ktore klient szuka
     * @return ArrayList<String> zawierajaca liste dan o okreslonej nazwie
     * @throws SQLException 
     */
    public ArrayList<String> wypisz(String nazwa) throws SQLException {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn = null;
        ResultSet rst;

                    try {
                        Bazadanych baza = new Bazadanych(); 
                        conn = baza.connectKlientMySQL();
                        
                        String sql="SELECT nazwa FROM danie WHERE nazwa=?";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        statement.setString(1,nazwa);
                        rst=statement.executeQuery();
                        
                        while(rst.next()){
                           skladniki.add(rst.getString(1));
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
