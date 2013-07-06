
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Danieponazwie {
    private String blad="Nie";
       
    public ArrayList<String> wypisz(String nazwa) throws SQLException {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn = null;
        ResultSet rst;

                    try {
                        Bazadanych baza = new Bazadanych(); 
                        Class.forName(baza.getDriverMySQL()).newInstance();
                        conn = DriverManager.getConnection(baza.getUrlMySQL()+baza.getDbNameMySQL(), baza.getUserNameKlientMySQL(),baza.getPasswordKlientMySQL());    

                        String sql="SELECT nazwa FROM danie WHERE nazwa=?";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        statement.setString(1,nazwa);
                        rst=statement.executeQuery();
                        
                        while(rst.next()){
                           skladniki.add(rst.getString(1));
                         }
                       }
                      catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
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
