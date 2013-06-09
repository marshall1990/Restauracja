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
import java.util.ArrayList;


public class Daniaposkladnikach {
   
   
    public ArrayList<String> dania = new ArrayList<String>();
    private String blad="Nie";

    /**
     *
     * @param skladniki
     * @throws ClassNotFoundException
     * @throws SQLException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public String weryfikuj(String skladniki[]) {
        
        Connection conn;
        ResultSet rst;
        String sql="";

        try {
            Bazadanych baza = new Bazadanych(); 
            Class.forName(baza.getDriver1()).newInstance();
            conn = DriverManager.getConnection(baza.getUrl1()+baza.getDbName1(), baza.getUserName1(),baza.getPassword1());

            if(skladniki != null) {
                for(int i=0; i<skladniki.length; i++){ 
                       sql=sql+"SELECT `Nazwa` FROM danie where `ID_dania` in (SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?))";
                       if (i<skladniki.length-1) { sql=sql+" UNION "; }
                   }

                PreparedStatement statement=conn.prepareStatement(sql);

                for(int i=0; i<skladniki.length; i++) {
                   statement.setString(i+1,skladniki[i]);
                 }

                rst=statement.executeQuery();

                int j = 0;
                while (rst.next()) {
                   dania.add(rst.getString(1));
                   j++;
                 }
                conn.close();
            }   
        }
        catch (Exception e){ blad="Tak";}
        return blad;
    }     
}
