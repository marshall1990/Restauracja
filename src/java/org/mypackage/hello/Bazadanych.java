
package org.mypackage.hello;


public class Bazadanych {
  
    private String urlMySQL="jdbc:mysql://johnny.heliohost.org:3306/";
    private String dbNameMySQL="hariseld_dania";
    private String driverMySQL="com.mysql.jdbc.Driver";
    private String userNameKlientMySQL="hariseld_klient";
    private String passwordKlientMySQL="klient";
    
    private String urlPostgreSQL="jdbc:postgresql://johnny.heliohost.org:5432/";
    private String dbNamePostgreSQL="hariseld_zlecenia";
    private String driverPostgreSQL="org.postgresql.Driver";
    private String userNameAdminPostgreSQL="hariseld";
    private String passwordAdminPostgreSQL="123qwe";
    
    private String userNameAdminMySQL="hariseld_hari";
    private String passwordAdminMySQL="123qwe";
    

    /**
     * @return łańcuch zawierający adres url do bazy danych MySQL
     */
    public String getUrlMySQL() {
        return urlMySQL;
    }

    /**
     * @return  łańcuch zawierający nazwę bazy danych MySQL
     */
    public String getDbNameMySQL() {
        return dbNameMySQL;
    }

    /**
     * @return łańcuch zawierający nazwę sterownika do połączenia z bażą danych MySQL
     */
    public String getDriverMySQL() {
        return driverMySQL;
    }

    /**
     * @return łańcuch zawierający nazwę użytkownika klienta(ograniczone uprawnienia) bazy danych MySQL
     */
    public String getUserNameKlientMySQL() {
        return userNameKlientMySQL;
    }

    /**
     * @return łańcuch zawierający hasło dla klienta(ograniczone uprawnienia) do bazy danych MySQL
     */
    public String getPasswordKlientMySQL() {
        return passwordKlientMySQL;
    }

    /**
     * @return łańcuch zawierający adres url do bazy danych PostgreSQL
     */
    public String getUrlPostgreSQL() {
        return urlPostgreSQL;
    }

    /**
     * @return łańcuch zawierający nazwę bazy danych PostgreSQL
     */
    public String getDbNamePostgreSQL() {
        return dbNamePostgreSQL;
    }

    /**
     * @return łańcuch zawierający nazwę sterownika do połączenia z bażą danych PostgreSQL
     */
    public String getDriverPostgreSQL() {
        return driverPostgreSQL;
    }

    /**
     * @return łańcuch zawierający nazwę użytkownika administratora(pełne uprawnienia) bazy danych PostgreSQL
     */
    public String getUserNameAdminPostgreSQL() {
        return userNameAdminPostgreSQL;
    }

    /**
     * @return łańcuch zawierający hasło dla administratora(pełne uprawnienia) do bazy danych PostgreSQL
     */
    public String getPasswordAdminPostgreSQL() {
        return passwordAdminPostgreSQL;
    }

    

    /**
     * @return łańcuch zawierający nazwę użytkownika administratora(pełne uprawnienia) bazy danych MySQL
     */
    public String getUserNameAdminMySQL() {
        return userNameAdminMySQL;
    }

    /**
     * @return łańcuch zawierający hasło dla administratora(pełne uprawnienia) do bazy danych MySQL
     */
    public String getPasswordAdminMySQL() {
        return passwordAdminMySQL;
    }

    
    

   
}