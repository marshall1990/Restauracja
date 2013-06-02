<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="org.apache.commons.beanutils.BeanUtilsBean"%>
<%@ page import="org.mypackage.hello.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection conn = null;
ResultSet rst=null;
String sql;
String blad=null;

Rejestrator walidator = new Rejestrator();
BeanUtils.populate(walidator, request.getParameterMap());
    
if (walidator.weryfikuj().equals("Brak")) {
        
    try {
 
        Class.forName((String)session.getAttribute( "driver" )).newInstance();
        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   
        
        sql="select count(login) from users where login='"+walidator.getLogin()+"'";
        Statement statement0=conn.createStatement();
        rst=statement0.executeQuery(sql);
        rst.next();
        
        if (rst.getInt(1)>0)  blad="Taki login został już zarejestrowany, musisz wybrać inny.";
                else {
                sql="insert into `dania`.`users` values (?,?,?,?,?,?)";
                PreparedStatement statement=conn.prepareStatement(sql);
                statement.setInt(1,0);
                statement.setString(2,walidator.getImie());
                statement.setString(3,walidator.getNazwisko());
                statement.setString(4,walidator.getLogin());
                statement.setString(5,walidator.getPassword());
                statement.setInt(6,0);
                statement.executeUpdate();
                blad="Dziękujemy za rejestrację. Zaloguj się.";
          }
        
        conn.close();
       }
      catch (Exception e) {
         e.printStackTrace();
         blad="Błąd połączenia z bazą danych";
       }
 }
 else blad=walidator.weryfikuj()+".";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="rejestrowanie.css" />
        <title>Rejestracja</title>
    </head>
    <body>
        <h1><%=blad %></h1>
        <form name="reg" action="index.jsp">
            <div class="srodek"> <input type="submit" value="OK" /></div>
        </form>
      
    </body>
</html>
