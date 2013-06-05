/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


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
    
    public String weryfikuj() {
        String blad = "Nie";
        Connection conn;
        ResultSet rst;
        String sql;
        
        if ((getLogin().equals("Brak")) || (getLogin().trim().equals(""))) {
             blad="Wprowadzono niepoprawny login";     
         }
  
        if ((getPassword().equals("Brak")) || (getPassword().trim().equals(""))) {
            if (blad.equals("Nie")) {
                  blad="Wprowadzono niepoprawne hasło";
            } else {
                blad=blad+",<br />niepoprawne hasło";
                }
        }
        
        if (blad.equals("Nie")) {
        
            try {
                Bazadanych baza = new Bazadanych(); 
                Class.forName(baza.getDriver1()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());  

                sql="select count(login) from users where login='"+getLogin()+"' and password='"+getPassword()+"'";
                Statement statement0=conn.createStatement();
                rst=statement0.executeQuery(sql);
                rst.next();
                
                if (rst.getInt(1)>0) {       } //response.sendRedirect("podanie_menu.jsp");
                   else {
                      blad="Użytkownik o podanej nazwie lub podanym haśle nie istnieje.";
                     }
                conn.close();    
              }
            catch (Exception e) {
                 blad="Błąd połączenia z bazą danych";    
               }
          }
        else {
            blad=blad+".";
        }
        return blad;
    }
     
}
