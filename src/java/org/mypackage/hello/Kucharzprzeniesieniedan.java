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

public class Kucharzprzeniesieniedan {
    
      //public ArrayList<String> dania = new ArrayList<String>();  
    
    /**
     *
     * @param id
     */
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
                sql="select * from lista_zamowien where id in "+ids;
                //sql="select * from lista_zamowien where id in (27,28)";
                Statement statement=conn.createStatement();
                rst=statement.executeQuery(sql);

                //while (rst.next()) {
                  //     dania.add(rst.getString(1));
                    //   dania.add(rst.getString(2));
                      // dania.add(rst.getString(3));
                       //dania.add(Integer.toString(rst.getInt(4)));
                    // }
                
                sqlw="insert into lista_dostawca values (?,?,?,?)";
                PreparedStatement statementw;
                statementw=conn.prepareStatement(sqlw);
                
                sqll="insert into lista_kelner values (?,?,?,?)";
                PreparedStatement statementl;
                statementl=conn.prepareStatement(sqll);
                           
                while (rst.next()) {
                    if (rst.getString(3).equals(" na wynos")) {
                        statementw.setString(1,rst.getString(1));
                        statementw.setString(2,rst.getString(2));
                        statementw.setString(3,rst.getString(3));
                        statementw.setInt(4,rst.getInt(4));
                        statementw.executeUpdate();
                       }
                     else {
                        statementl.setString(1,rst.getString(1));
                        statementl.setString(2,rst.getString(2));
                        statementl.setString(3,rst.getString(3));
                        statementl.setInt(4,rst.getInt(4));
                        statementl.executeUpdate();
                     }
                   }
                
                sqld="delete from lista_zamowien where id in "+ids;
                Statement statementd;
                statementd=conn.createStatement();
                statementd.executeUpdate(sqld);
                conn.close();
            //}
           // catch(Exception e){}
        return ids;
    }
}
