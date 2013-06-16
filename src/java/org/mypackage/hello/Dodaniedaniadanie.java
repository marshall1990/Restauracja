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

/**
 *
 * @author Marzena
 */
public class Dodaniedaniadanie {
    
    private String nazwadania="Brak";
    private String przepis="Brak";

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
    
    public String weryfikuj(String Login) throws SQLException  {
        String blad;
        blad = "Nie";
        Connection conn = null;
        String sql;
        ResultSet rst=null;
        String userID=null;
        
        if ((getNazwadania().equals("Brak")) || (getNazwadania().trim().equals(""))) {
             blad="Wprowadzono nieprawidłowa nazwa dania";     
         }
  
        if ((getPrzepis().equals("Brak")) || (getPrzepis().trim().equals(""))) {
            if (blad.equals("Nie")) {
                  blad="Wprowadzono nieprawidłowy przepis";
            } else {
                blad=blad+",<br />nieprawidłowy przepis";
                }
        }
        
        
        if (blad.equals("Nie")) {
        
            try {
                
                Bazadanych baza = new Bazadanych(); 
                Class.forName(baza.getDriver1()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());
                
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
                 blad="Błąd połączenia z bazą danych";    
               }
            finally { conn.close(); }
         }
         else {
            blad=blad+".";
        }
        
        
        return blad;
    }
}
