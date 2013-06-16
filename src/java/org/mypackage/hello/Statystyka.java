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
import java.util.ArrayList;


public class Statystyka {
    
    public ArrayList<String> dania = new ArrayList<String>();
    
    /**
     *
     * @return
     * @throws InstantiationException
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IllegalAccessException
     */
    public int policz() throws SQLException {
     
     Connection conn2,conn1,conn = null;
     ResultSet rst;
     String sqls,sql;
     int ile=0;
            
            try {
                Bazadanych baza = new Bazadanych(); 
                Class.forName(baza.getDriver2()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2()); 
                
                sql= "SELECT \"danie\", count(*) AS \"Ile\" FROM \"lista_dan\" GROUP BY \"danie\" ORDER BY \"danie\"";
                Statement statement = conn.createStatement();
                rst=statement.executeQuery(sql);
                
                while (rst.next()){   
                    if(rst.getInt(2)!=0) {
                        dania.add(rst.getString(1));
                        dania.add(Integer.toString(rst.getInt(2)));
                    }
                }
             }
            catch(Exception e){}
            finally { conn.close(); }
        return ile;
    }
}
