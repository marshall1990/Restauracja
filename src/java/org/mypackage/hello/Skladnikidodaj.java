
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje dodawanie nowego skladnika do bazy danych skladnikow restauracji.
 */
public class Skladnikidodaj {
    private String blad="Dodales danie";
    /**
     * Weryfikacja czy podana nazwa skladnika jest prawidlowa oraz czy taki skladnik nie jest juz w bazie danych, jesli nie dodanie nowego skladnika.
     * @param nazwa skladnika ktory chcemy dodac
     * @param ilosc skladnika jaka bedzie w magazynie
     * @param opis skladnika
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
            blad="Wprowadzono niepoprawna nazwe";
         }
        if ((ilosc.equals("Brak")) || (ilosc.trim().equals(""))) {
            if (blad.equals("Nie")) {
                blad="Wprowadzono niepoprawna ilosc";
             } else {
                blad=blad+",<br />niepoprawna ilosc";
             }
        } 
        if (blad.equals("Dodales danie")) {
            
                    try {
                        Bazadanych baza = new Bazadanych();
                        conn = baza.connectKlientMySQL();
                        
                        String sql="select count(Skladnik) from skladniki where Skladnik='"+nazwa+"'";
                        Statement statement0=conn.createStatement();
                        rst=statement0.executeQuery(sql);
                        rst.next();

                        if (rst.getInt(1)>0) {
                            blad="Taki skladnik juz znajduje sie w bazie danych.";
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
                        System.out.println("Blad polaczenia z baza danych."); 
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
