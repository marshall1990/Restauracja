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
    
  
    
    /**
     *
     * @param dania
     * @param ilosc
     * @return
     */
    public String weryfikuj(String dania[], String ilosc[],String zalogowany, String nawynos) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
       
        Connection conn;
        ResultSet rst;
        String sql;
        Integer ID;

        //try {
            Bazadanych baza = new Bazadanych();
            
            Class.forName(baza.getDriver1()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());
            
            sql="select `ID_User` from users where login='"+zalogowany+"'";
            Statement statement0=conn.createStatement();
            rst=statement0.executeQuery(sql);
            rst.next();
            ID=rst.getInt("ID_User");
            conn.close();
           
            
            Class.forName(baza.getDriver2()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());
              
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
            
            conn.close();
            
        //}
        //catch (Exception e){ blad="Tak";}
        return zalogowany;
        
        
    }
}
