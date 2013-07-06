
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * 
 * Ta klasa reprezentuje uzupełnienie brakujących składników.
 */
public class Zaopatrzenie {
    private String blad="Nie";
    /**
     * Usuwanie składników z listy brakujących składników w restautacji.
     * @param id tablica stringów zawierająca listę identyfikatorów składników, które zostały uzupełnione.
     * @throws SQLException 
     */
    public void uzupelnij(String id[]) throws SQLException {

            Connection conn = null;
            ResultSet rst;
            String sql;
            
            try {
                Bazadanych baza= new Bazadanych();
                conn = baza.connectAdminPostgreSQL();
                
                sql="delete from braki where skladnik=?";
                PreparedStatement statement;
                statement=conn.prepareStatement(sql);
                
                for (int i=0;i<id.length;i++) {
                    statement.setString(1,id[i]);
                    statement.executeUpdate();
                }
                

            }
            catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
                        blad="Tak";
                        }
            finally { conn.close(); }
    }

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
}
