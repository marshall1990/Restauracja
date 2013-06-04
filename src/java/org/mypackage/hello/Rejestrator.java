/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Rejestrator {
  
	private String imie="Brak";
	private String nazwisko="Brak";
        private String login="Brak";
        private String password="Brak";
        private String nazwadania="Brak";
        private String przepis="Brak";
        private String url1="jdbc:mysql://johnny.heliohost.org:3306/";
        private String dbName1="hariseld_dania";
        private String driver1="com.mysql.jdbc.Driver";
        private String userName1="hariseld_hari";
        private String password1="123qwe";
        
    /**
     * @return the imie
     */
    public String getImie() {
        return imie;
    }

    /**
     * @param imie the imie to set
     */
    public void setImie(String imie) {
        this.imie = imie;
    }

    /**
     * @return the nazwisko
     */
    public String getNazwisko() {
        return nazwisko;
    }

    /**
     * @param nazwisko the nazwisko to set
     */
    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

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
        String blad;
        blad = "Brak";
        
        if ((imie.equals("Brak")) || (imie.trim().equals(""))) {
            blad="Wprowadzono niepoprawne imię";
         }
        if ((nazwisko.equals("Brak")) || (nazwisko.trim().equals(""))) {
            if (blad.equals("Brak")) {
                blad="Wprowadzono niepoprawne nazwisko";
             } else {
                blad=blad+",<br />niepoprawne nazwisko";
             }
        }
        if ((login.equals("Brak")) || (login.trim().equals(""))) {
            if (blad.equals("Brak")) {
              blad="Wprowadzono niepoprawny login";
            } else {
                blad=blad+",<br />niepoprawny login";
            }
        }
  
        if ((password.equals("Brak")) || (password.trim().equals(""))) {
            if (blad.equals("Brak")) {
                  blad="Wprowadzono niepoprawne hasło";
            } else {
                blad=blad+",<br />niepoprawne hasło";
                }
        }
        
        
  
       return blad;
    }    
    public String weryfikuj2() {
        String blad = "Nie";
        Connection conn;
        ResultSet rst;
        String sql="1";
        
        if ((login.equals("Brak")) || (login.trim().equals(""))) {
             blad="Wprowadzono niepoprawny login";     
         }
  
        if ((password.equals("Brak")) || (password.trim().equals(""))) {
            if (blad.equals("Nie")) {
                  blad="Wprowadzono niepoprawne hasło";
            } else {
                blad=blad+",<br />niepoprawne hasło";
                }
        }
        
        if (blad.equals("Nie")) {
        
            try {
                Class.forName(driver1).newInstance();
                conn = DriverManager.getConnection(url1+dbName1,userName1,password1);  

                sql="select count(login) from users where login='"+login+"' and password='"+password+"'";
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
        return blad;
    }
    
    public String weryfikujdanie() {
        String blad;
        blad = "Brak";
        
        if ((getNazwadania().equals("Brak")) || (getNazwadania().trim().equals(""))) {
             blad="Wprowadzono nieprawidłowa nazwa dania";     
         }
  
        if ((getPrzepis().equals("Brak")) || (getPrzepis().trim().equals(""))) {
            if (blad.equals("Brak")) {
                  blad="Wprowadzono nieprawidłowy przepis";
            } else {
                blad=blad+",<br />nieprawidłowy przepis";
                }
        }
        return blad;
    }

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
}
