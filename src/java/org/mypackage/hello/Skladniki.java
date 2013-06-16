
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Skladniki {
       
    public ArrayList<String> wypisz() {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn;
        ResultSet rst;

                    try {
                        Bazadanych baza = new Bazadanych(); 
                        Class.forName(baza.getDriver1()).newInstance();
                        conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());    

                        String sql="SELECT skladnik FROM skladniki";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        rst=statement.executeQuery();
                        
                        while(rst.next()){
                           skladniki.add(rst.getString(1));
                         }
                        conn.close();
                       }
                      catch (Exception e) {
                      
                      }             
        return skladniki;
    }  
}
