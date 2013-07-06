
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje usuwanie składników z listy składników restauracji.
 */
public class Restauratorskladnikusun {
    private String blad="Nie";
    
    /**
     * Usuwanie składników z listy składników restauracji.
     * @param id tablica stringów zawierająca identyfiaktory składników które mają być usunięte z listy składników restauracji.
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
