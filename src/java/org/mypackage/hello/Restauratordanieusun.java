
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje usuwanie dan z menu restauracji.
 */
public class Restauratordanieusun {
    private String blad="Nie";
    
    /**
     * Usuwa dania z listy dan restauracji
     * @param id tablica stringow zawierajaca identyfikatory dan, ktore maja byc usuniete.
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
