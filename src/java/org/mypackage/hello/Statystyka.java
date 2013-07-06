
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * 
 * Ta klasa reprezentuje dane statystyczne na temat dan dostarczonych klientom.
 */
public class Statystyka {
    
    
    private String blad="Nie";
    /**
     * 
     * @return ArrayList<String> zawierajaca liste dan ktore zostaly do tej pory dostarczone klientom.
     * @throws SQLException 
     */
    public ArrayList<String> policz() throws SQLException {
     
     ArrayList<String> dania;
     dania = new ArrayList<String>();
     Connection conn = null;
     ResultSet rst;
     String sql;
            
            try {
                Bazadanych baza = new Bazadanych();
                conn = baza.connectAdminPostgreSQL();
                
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
                        System.out.println("Blad polaczenia z baza danych."); 
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
