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


public class Kelnerprzeniesieniedan {
    
    
    public String przenies(String id[]) throws InstantiationException, SQLException, ClassNotFoundException, IllegalAccessException{

            String ids = "(";
            Connection conn;
            ResultSet rst;
            String sql,sqlw,sqll,sqld;
            
           // try {
                Bazadanych baza= new Bazadanych();
                Class.forName(baza.getDriver2()).newInstance();
                conn = DriverManager.getConnection(baza.getUrl2()+baza.getDbName2(), baza.getUserName2(),baza.getPassword2());

                for (int i=0;i<id.length;i++) { ids=ids+id[i]+",";}

                ids=ids.substring(0,ids.length()-1);
                ids=ids+")";
                sql="select * from lista_kelner where ID in "+ids;
                Statement statement=conn.createStatement();
                rst=statement.executeQuery(sql);

                sqlw="insert into lista_dan values (?,?,?,?)";
                PreparedStatement statementw;
                statementw=conn.prepareStatement(sqlw);
                               
                while (rst.next()) {            
                        statementw.setString(1,rst.getString(1));
                        statementw.setString(2,rst.getString(2));
                        statementw.setString(3,rst.getString(3));
                        statementw.setInt(4,rst.getInt(4));
                        statementw.executeUpdate();
                   }
                
                sqld="delete from lista_kelner where ID in "+ids;
                Statement statementd;
                statementd=conn.createStatement();
                statementd.executeUpdate(sqld);
                conn.close();
            //}
           // catch(Exception e){}
        return ids;
    }
}