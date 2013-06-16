
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Brakujaceskladniki {
       
    public ArrayList<String> wypisz() {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn;
        ResultSet rst;

                    try {
                        Bazadanych baza= new Bazadanych();
                        Class.forName(baza.getDriver2()).newInstance();
                        conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());    

                        String sql="SELECT skladnik FROM braki ORDER BY skladnik";

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

