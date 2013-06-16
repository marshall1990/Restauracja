
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Brakujaceskladniki {
       
    public ArrayList<String> wypisz() throws SQLException {
        
        ArrayList<String> skladniki;
        skladniki = new ArrayList<String>();
        
        Connection conn = null;
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
                       }
                      catch (Exception e) {
                      
                      }  
                    finally { conn.close(); }
        return skladniki;
    }  
}

