/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Listadan {
   
    private String blad="Nie";
    
    /**
     *
     * @param bazadan
     */
    public ArrayList<String> wyswietl(String bazadan) throws SQLException {    
        
        ArrayList<String> dania;
        dania = new ArrayList<String>();
        Connection conn = null;
        ResultSet rst;
        String sql;
        
        try {
            Bazadanych baza= new Bazadanych();
            conn = baza.connectAdminPostgreSQL();
            
            sql="select * from "+bazadan;
            Statement statement=conn.createStatement();
            rst=statement.executeQuery(sql);
            
                while (rst.next()) {
                   dania.add(rst.getString(1));
                   dania.add(rst.getString(2));
                   dania.add(rst.getString(3));
                   dania.add(Integer.toString(rst.getInt(4)));
                 }
        }
        catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
                        blad="Tak";
                        }
        finally { conn.close(); }
        return dania;
    }    

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
    
    
}
