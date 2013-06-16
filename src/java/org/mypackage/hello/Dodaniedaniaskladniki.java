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

public class Dodaniedaniaskladniki {
    
    
    public String dodaj(String skladniki[], String nazwa) throws SQLException {
    
        Connection conn = null;
        ResultSet rst=null;
        

        try {
            Bazadanych baza = new Bazadanych(); 
            Class.forName(baza.getDriver1()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());

            String sql="SELECT ID_Dania FROM danie where nazwa='"+nazwa+"'";
            Statement statement=conn.createStatement();
            rst=statement.executeQuery(sql);
            rst.next();

            sql="insert into `daniaskladniki` values (?,?,?)";
            PreparedStatement statement1=conn.prepareStatement(sql);

            for(int i=0; i<skladniki.length; i++) {      
                statement1.setInt(1,rst.getInt(1));
                statement1.setInt(2,Integer.parseInt(skladniki[i]));
                statement1.setInt(3,100);
                statement1.executeUpdate();
               }  

     
          }
           catch (Exception e) {   }  
           finally { conn.close(); }
        return nazwa;

    
    }
}
