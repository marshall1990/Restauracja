/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * Ta klasa reprezentuje weryfikowanie danych podanych podczas logowania przez uzytkownika 
 */
public class Logowanie {
  
	
        private String login="Brak";
        private String password="Brak";

        
   
    /**
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * weryfikuje czy dane podane podczas logowania sa poprawne oraz czy konto uzytkownika istnieje w systemie.
     * @return String zawierajacy informacje czy wystapil blad
     * @throws SQLException 
     */
    public String weryfikuj() throws SQLException {
        String blad = "Nie";
        Connection conn = null;
        ResultSet rst;
        String sql;
        
        if ((getLogin().equals("Brak")) || (getLogin().trim().equals(""))) {
             blad="Wprowadzono niepoprawny login";     
         }
  
        if ((getPassword().equals("Brak")) || (getPassword().trim().equals(""))) {
            if (blad.equals("Nie")) {
                  blad="Wprowadzono niepoprawne haslo";
            } else {
                blad=blad+",<br />niepoprawne haslo";
                }
        }
        
        if (blad.equals("Nie")) {
        
            try {
                Bazadanych baza = new Bazadanych(); 
                conn = baza.connectKlientMySQL();
                
                sql="select count(login) from users where login='"+getLogin()+"' and password='"+getPassword()+"'";
                Statement statement0=conn.createStatement();
                rst=statement0.executeQuery(sql);
                rst.next();
                
                if (rst.getInt(1)>0) {       } //response.sendRedirect("podanie_menu.jsp");
                   else {
                      blad="Uzytkownik o podanej nazwie lub podanym hasle nie istnieje.";
                     }  
              }
            catch (Exception e) {
                 blad="Blad polaczenia z baza danych";    
               }
            finally { conn.close(); }
          }
        else {
            blad=blad+".";
        }
        return blad;
    }
     
}
