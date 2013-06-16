/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Zaopatrzenie {
    public void uzupelnij(String id[]) {

            Connection conn;
            ResultSet rst;
            String sql;
            
            try {
                Bazadanych baza= new Bazadanych();
                Class.forName(baza.getDriver2()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());
                
                sql="delete from braki where skladnik=?";
                PreparedStatement statement;
                statement=conn.prepareStatement(sql);
                
                for (int i=0;i<id.length;i++) {
                    statement.setString(1,id[i]);
                    statement.executeUpdate();
                }
                
                conn.close();
            }
            catch(Exception e){}
    }
}
