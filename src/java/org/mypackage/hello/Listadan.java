/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Listadan {
   
    public ArrayList<String> dania = new ArrayList<String>();
    
    /**
     *
     * @param bazadan
     */
    public void wyswietl(String bazadan) {    
        
        String blad = "Nie";
        Connection conn;
        ResultSet rst;
        String sql;
        
        try {
            Bazadanych baza= new Bazadanych();
            Class.forName(baza.getDriver2()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());
            
            sql="select * from "+bazadan;
            Statement statement=conn.createStatement();
            rst=statement.executeQuery(sql);
            
                while (rst.next()) {
                   dania.add(rst.getString(1));
                   dania.add(rst.getString(2));
                   dania.add(rst.getString(3));
                   dania.add(Integer.toString(rst.getInt(4)));
                 }
                conn.close();
        }
        catch(Exception e) {}
    }    
    
    
}
