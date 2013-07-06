
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje dodawanie nowego składnika do bazy danych składników restauracji.
 */
public class Skladnikidodaj {
    private String blad="Dodałeś danie";
    /**
     * Weryfikacja czy podana nazwa składnika jest prawidłowa oraz czy taki składnik nie jest już w bazie danych, jeśli nie dodanie nowego składnika.
     * @param nazwa składnika który chcemy dodać
     * @param ilosc składnika jaka będzie w magazynie
     * @param opis składnika
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws IllegalAccessException 
     */   
    public void wypisz(String nazwa, String ilosc, String opis) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, IllegalAccessException {
        

        
        Connection conn = null;
        ResultSet rst;

        
        if ((nazwa.equals("Brak")) || (nazwa.trim().equals(""))) {
            blad="Wprowadzono niepoprawna nazwę";
         }
        if ((ilosc.equals("Brak")) || (ilosc.trim().equals(""))) {
            if (blad.equals("Nie")) {
                blad="Wprowadzono niepoprawną ilość";
             } else {
                blad=blad+",<br />niepoprawna ilość";
             }
        } 
        if (blad.equals("Dodałeś danie")) {
            
                    try {
                        Bazadanych baza = new Bazadanych();
                        conn = baza.connectKlientMySQL();
                        
                        String sql="select count(Skladnik) from skladniki where Skladnik='"+nazwa+"'";
                        Statement statement0=conn.createStatement();
                        rst=statement0.executeQuery(sql);
                        rst.next();

                        if (rst.getInt(1)>0) {
                            blad="Taki składnik już znajduje się w bazie danych.";
                        }
                        else {
                        
                            sql="insert into skladniki values (?,?,?,?)";
                            PreparedStatement statement=conn.prepareStatement(sql);
                            statement.setInt(1,0);
                            statement.setString(2,nazwa);
                            statement.setString(3,ilosc);
                            statement.setString(4,opis);
                            statement.executeUpdate();
                        }
                     }
                     catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
                       blad="Tak";
                      } 
                   finally { conn.close(); }
                    
        }
        else {
            blad=blad+".";
        }
    }  

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
}
