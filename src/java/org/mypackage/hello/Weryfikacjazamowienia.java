
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje zatwierdzenie zamówionych dań do realizacji przez kucharza.
 */
public class Weryfikacjazamowienia {
    private String blad="Nie";
    
  
    /**
     * Dodanie dań zamówionych przez klienta do listy dań do wykonania przez kucharza.
     * @param dania tablica stringów zawierająca listę dań zamówionych przez klienta.
     * @param ilosc tablica stringów zawierająca infformacje na temat liczby zamówionych dań danego rodzaju.
     * @param zalogowany login klienta zamawiającego danie
     * @param nawynos określa czy danie było zamówione w lokalu czy na wynos
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
