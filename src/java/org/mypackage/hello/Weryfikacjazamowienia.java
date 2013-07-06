/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Weryfikacjazamowienia {
    private String blad="Nie";
    
  
    
    /**
     *
     * @param dania
     * @param ilosc
     * @return
     */
    public void weryfikuj(String dania[], String ilosc[],String zalogowany, String nawynos) throws SQLException  {
       
        Connection conn = null;
        ResultSet rst;
        String sql;
        Integer ID;

        try {
            Bazadanych baza = new Bazadanych();
            
            Class.forName(baza.getDriverMySQL()).newInstance();
            conn = DriverManager.getConnection(baza.getUrlMySQL()+baza.getDbNameMySQL(), baza.getUserNameKlientMySQL(),baza.getPasswordKlientMySQL());
            
            sql="select `ID_User` from users where login='"+zalogowany+"'";
            Statement statement0=conn.createStatement();
            rst=statement0.executeQuery(sql);
            rst.next();
            ID=rst.getInt("ID_User");
            conn.close();
           
            
            Class.forName(baza.getDriverPostgreSQL()).newInstance();
            conn = DriverManager.getConnection(baza.getUrlPostgreSQL()+baza.getDbNamePostgreSQL(), baza.getUserNameAdminPostgreSQL(),baza.getPasswordAdminPostgreSQL());
              
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
