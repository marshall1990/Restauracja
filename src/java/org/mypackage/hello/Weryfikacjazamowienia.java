
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje zatwierdzenie zamowionych dan do realizacji przez kucharza.
 */
public class Weryfikacjazamowienia {
    private String blad="Nie";
    
  
    /**
     * Dodanie dan zamowionych przez klienta do listy dan do wykonania przez kucharza.
     * @param dania tablica stringow zawierajaca liste dan zamowionych przez klienta.
     * @param ilosc tablica stringow zawierajaca infformacje na temat liczby zamowionych dan danego rodzaju.
     * @param zalogowany login klienta zamawiajacego danie
     * @param nawynos okresla czy danie bylo zamowione w lokalu czy na wynos
     * @throws SQLException 
     */
    public void weryfikuj(String dania[], String ilosc[],String zalogowany, String nawynos) throws SQLException  {
       
        Connection conn = null;
        ResultSet rst;
        String sql;
        Integer ID;

        try {
            Bazadanych baza = new Bazadanych();
            conn = baza.connectKlientMySQL();
            
            sql="select `ID_User` from users where login='"+zalogowany+"'";
            Statement statement0=conn.createStatement();
            rst=statement0.executeQuery(sql);
            rst.next();
            ID=rst.getInt("ID_User");
            conn.close();
           
            conn = baza.connectAdminPostgreSQL();
            
            sql="insert into lista_zamowien values (?,?,?)";
            PreparedStatement statement1;
            statement1=conn.prepareStatement(sql);
            
            for (int i=0;i<dania.length;i++) {
                for (int j=0;j<Integer.parseInt(ilosc[i]);j++) {
                    statement1.setString(1,dania[i]);
                    statement1.setString(2,Integer.toString(ID));
                    statement1.setString(3,nawynos);
                    statement1.executeUpdate();
                }
            }
            

            
        }
        catch (Exception e) { 
                        System.out.println("Blad polaczenia z baza danych."); 
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
