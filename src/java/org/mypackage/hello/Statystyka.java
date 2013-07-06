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
import java.sql.Statement;
import java.util.ArrayList;


public class Statystyka {
    
    
    private String blad="Nie";
    
    public ArrayList<String> policz() throws SQLException {
     
     ArrayList<String> dania;
     dania = new ArrayList<String>();
     Connection conn2,conn1,conn = null;
     ResultSet rst;
     String sqls,sql;
     int ile=0;
            
            try {
                Bazadanych baza = new Bazadanych(); 
                Class.forName(baza.getDriverPostgreSQL()).newInstance();
                conn = DriverManager.getConnection(baza.getUrlPostgreSQL()+baza.getDbNamePostgreSQL(), baza.getUserNameAdminPostgreSQL(),baza.getPasswordAdminPostgreSQL()); 
                
                sql= "SELECT \"danie\", count(*) AS \"Ile\" FROM \"lista_dan\" GROUP BY \"danie\" ORDER BY \"danie\"";
                Statement statement = conn.createStatement();
                rst=statement.executeQuery(sql);
                
                while (rst.next()){   
                    if(rst.getInt(2)!=0) {
                        dania.add(rst.getString(1));
                        dania.add(Integer.toString(rst.getInt(2)));
                    }
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
