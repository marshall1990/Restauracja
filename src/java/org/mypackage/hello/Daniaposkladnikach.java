
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 
 * Ta klasa reprezentuje listę dań, które zawierają określone składniki.
 */
public class Daniaposkladnikach {
 
    private String blad="Nie";
    /**
     * 
     * @param skladniki lista składników, które wybrał klient
     * @return ArrayList<String> zawierającą listę dań, które zawierają składniki składniki znajdujące się na liście @param skladniki
     * @throws SQLException 
     */
    public ArrayList<String> weryfikuj(String skladniki[]) throws SQLException {
        
        ArrayList<String> dania = new ArrayList<String>();
        Connection conn = null;
        ResultSet rst;
        String sql="";
        

        try {
            Bazadanych baza = new Bazadanych(); 
            conn = baza.connectKlientMySQL();
            
            if(skladniki != null) {
                for(int i=0; i<skladniki.length; i++){ 
                       sql=sql+"SELECT `Nazwa` FROM danie where `ID_dania` in (SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?))";
                       if (i<skladniki.length-1) { sql=sql+" UNION "; }
                   }

                PreparedStatement statement=conn.prepareStatement(sql);

                for(int i=0; i<skladniki.length; i++) {
                   statement.setString(i+1,skladniki[i]);
                 }

                rst=statement.executeQuery();

                while (rst.next()) {
                   dania.add(rst.getString(1));
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
