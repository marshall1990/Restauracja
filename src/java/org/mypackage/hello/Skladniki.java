
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Skladniki {
    private String blad="Nie";
       
    public ArrayList<String> wypisz() throws SQLException {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn = null;
        ResultSet rst;

                    try {
                        Bazadanych baza = new Bazadanych(); 
                        Class.forName(baza.getDriverMySQL()).newInstance();
                        conn = DriverManager.getConnection(baza.getUrlMySQL()+baza.getDbNameMySQL(), baza.getUserNameKlientMySQL(),baza.getPasswordKlientMySQL());    

                        String sql="SELECT ID_Skladnika,skladnik FROM skladniki ORDER BY skladnik";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        rst=statement.executeQuery();
                        
                        while(rst.next()){
                           skladniki.add(rst.getString(1));
                           skladniki.add(rst.getString(2));
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
