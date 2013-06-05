/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;


public class Bazadanych {
    private String url1="jdbc:mysql://johnny.heliohost.org:3306/";
    private String dbName1="hariseld_dania";
    private String driver1="com.mysql.jdbc.Driver";
    private String userName1="hariseld_hari";
    private String password1="123qwe";

//session.setAttribute( "url2", "jdbc:mysql://johnny.heliohost.org:3306/" );
//session.setAttribute( "dbName2", "hariseld_zlecenia" );
//session.setAttribute( "driver2", "com.mysql.jdbc.Driver" );
//session.setAttribute( "userName2", "hariseld_hari" );
//session.setAttribute( "password2", "123qwe" );

    /**
     * @return the url1
     */
    public String getUrl1() {
        return url1;
    }

    /**
     * @param url1 the url1 to set
     */
    public void setUrl1(String url1) {
        this.url1 = url1;
    }

    /**
     * @return the dbName1
     */
    public String getDbName1() {
        return dbName1;
    }

    /**
     * @param dbName1 the dbName1 to set
     */
    public void setDbName1(String dbName1) {
        this.dbName1 = dbName1;
    }

    /**
     * @return the driver1
     */
    public String getDriver1() {
        return driver1;
    }

    /**
     * @param driver1 the driver1 to set
     */
    public void setDriver1(String driver1) {
        this.driver1 = driver1;
    }

    /**
     * @return the userName1
     */
    public String getUserName1() {
        return userName1;
    }

    /**
     * @param userName1 the userName1 to set
     */
    public void setUserName1(String userName1) {
        this.userName1 = userName1;
    }

    /**
     * @return the password1
     */
    public String getPassword1() {
        return password1;
    }

    /**
     * @param password1 the password1 to set
     */
    public void setPassword1(String password1) {
        this.password1 = password1;
    }

   
}
