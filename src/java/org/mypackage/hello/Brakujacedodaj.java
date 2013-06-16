/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Brakujacedodaj {

    
    
    public void dodaj(String[] braki){
    
        Connection conn;
        ResultSet rst;
        
     try {
            Bazadanych baza= new Bazadanych();
            Class.forName(baza.getDriver2()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());

            String sql;
            sql = "insert into braki values (?)";
            PreparedStatement statement1=conn.prepareStatement(sql);

            for(int i=0; i<braki.length; i++) {      
                statement1.setString(1,braki[i]);
                statement1.executeUpdate();
               }  

            conn.close();       
          }
           catch (Exception e) {
           }  
    }
    
}
