
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje usuwanie skladnikow z listy skladnikow restauracji.
 */
public class Restauratorskladnikusun {
    private String blad="Nie";
    
    /**
     * Usuwanie skladnikow z listy skladnikow restauracji.
     * @param id tablica stringow zawierajaca identyfiaktory skladnikow ktore maja byc usuniete z listy skladnikow restauracji.
     * @throws SQLException 
     */
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
                
                
                sqld="delete from skladniki where ID_Skladnika in "+ids;
                Statement statementd;
                statementd=conn.createStatement();
                statementd.executeUpdate(sqld);             
                conn.close();
            }
            catch (Exception e) { 
                        System.out.println("Blad polaczenia z baza danych."); 
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
