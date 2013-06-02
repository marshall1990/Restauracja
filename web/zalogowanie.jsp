<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="org.mypackage.hello.Rejestrator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<jsp:setProperty name="zalogowany" property="*"/>

<%
Connection conn = null;
ResultSet rst=null;
String sql;
String blad=null;

Rejestrator walidator = new Rejestrator();
BeanUtils.populate(walidator, request.getParameterMap());

if (walidator.weryfikuj2().equals("Brak")) {
        
    try {
  
        Class.forName((String)session.getAttribute( "driver" )).newInstance();
        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));      
        
        sql="select count(login) from users where login='"+walidator.getLogin()+"' and password='"+walidator.getPassword()+"'";
        Statement statement0=conn.createStatement();
        rst=statement0.executeQuery(sql);
        rst.next();
        
        
        if (rst.getInt(1)>0) response.sendRedirect("menu.jsp");
           else {
              blad="Użytkownik o podanej nazwie lub podanym haśle nie istnieje.";
             }
        conn.close();    
    }
    catch (Exception e) {
         e.printStackTrace();
         blad="Błąd połączenia z bazą danych";    
       }
 }
 else blad=walidator.weryfikuj2()+".";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="rejestrowanie.css" />
        <title>Logowanie</title>
    </head>
    <body>
        <h1><%=blad %></h1>
        <form name="reg" action="index.jsp">
            <div class="srodek"> <input type="submit" value="OK" /></div>
        </form>
      
    </body>
</html>