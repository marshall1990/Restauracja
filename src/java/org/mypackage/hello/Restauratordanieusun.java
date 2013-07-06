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


public class Restauratordanieusun {
    private String blad="Nie";
    
    
    public void usun(String id[]) throws SQLException {

            String ids = "(";
            Connection conn = null;
            ResultSet rst;
            String sql,sqlw,sqll,sqld;
            if (id == null || id.length < 1) {}
            else {
            try {
                Bazadanych baza= new Bazadanych();
                conn = baza.connectAdminMySQL();
                
                for (int i=0;i<id.length;i++) { ids=ids+id[i]+",";}

                ids=ids.substring(0,ids.length()-1);
                ids=ids+")";
                
                
                sqld="delete from daniaskladniki where ID_Dania in "+ids;
                Statement statementd;
                statementd=conn.createStatement();
                statementd.executeUpdate(sqld);
                
                
                sqld="delete from danie where ID_Dania in "+ids;
                Statement statement;
                statement=conn.createStatement();
                statement.executeUpdate(sqld);
                
                conn.close();
            }
            catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
                       blad="Tak";
                       }
            finally { conn.close(); }
            
            }
    }

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
}
