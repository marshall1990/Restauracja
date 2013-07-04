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


public class Dodaniedaniadanie {
    
    private String nazwadania="Brak";
    private String przepis="Brak";
    private String blad="Nie";

    /**
     * @return the nazwadania
     */
    public String getNazwadania() {
        return nazwadania;
    }

    /**
     * @param nazwadania the nazwadania to set
     */
    public void setNazwadania(String nazwadania) {
        this.nazwadania = nazwadania;
    }

    /**
     * @return the przepis
     */
    public String getPrzepis() {
        return przepis;
    }

    /**
     * @param przepis the przepis to set
     */
    public void setPrzepis(String przepis) {
        this.przepis = przepis;
    }
    
    public void weryfikuj(String Login) throws SQLException  {
        Connection conn = null;
        String sql;
        ResultSet rst=null;
        String userID=null;
        
        if ((getNazwadania().equals("Brak")) || (getNazwadania().trim().equals(""))) {
             blad="Wprowadzono nieprawidłowa nazwa dania";     
         }
  
        if ((getPrzepis().equals("Brak")) || (getPrzepis().trim().equals(""))) {
            if (getBlad().equals("Nie")) {
                  blad="Wprowadzono nieprawidłowy przepis";
            } else {
                blad=getBlad()+",<br />nieprawidłowy przepis";
                }
        }
        
        
        if (getBlad().equals("Nie")) {
        
            try {
                
                Bazadanych baza = new Bazadanych(); 
                Class.forName(baza.getDriver3()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl3()+baza.getDbName3(), baza.getUserName3(),baza.getPassword3());
                
                sql="select count(nazwa) from danie where nazwa='"+getNazwadania()+"'";
                Statement statement=conn.createStatement();
                rst=statement.executeQuery(sql);
                rst.next();

                if (rst.getInt(1)>0) {
                    blad="Danie o takiej nazwie już jest w menu. Podaj inną nazwę";
                }
                   else {
                    
                       sql="select ID_User from users where login='"+Login+"'";
                       Statement statement0=conn.createStatement();
                       rst=statement0.executeQuery(sql);
                       rst.next();
                       userID=rst.getString(1);

                       sql="insert into `danie` values (?,?,?,?)";
                       PreparedStatement statement1=conn.prepareStatement(sql);
                       statement1.setInt(1,0);
                       statement1.setString(2,getNazwadania());
                       statement1.setString(3,getPrzepis());
                       statement1.setString(4,userID);
                       statement1.executeUpdate();
                     }
            }
            catch (Exception e) { 
                        System.out.println("Błąd połączenia z bazą danych."); 
                        blad="Tak";
                        }
            finally { conn.close(); }
         }
         else {
            blad=getBlad()+".";
        }
    }

    /**
     * @return the blad
     */
    public String getBlad() {
        return blad;
    }
}
