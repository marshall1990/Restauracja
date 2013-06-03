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
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Witamy w Wirtualnej Restauracji</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>WIRTUALNA RESTAURACJA</h1>
                <div class="login_fault">
                    <p class="red login"><%=blad %></p>
                    <a href="index.jsp" class="btn_submit">OK</a>
                </div>  
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                    <h1>Rejestracja</h1>
                    <form action="rejestrowanie.jsp" method="get">
                        <ul>
                            <li>
                                <label for="name">Podaj imię:</label>
                                <input type="text" name="imie" id="name" />
                            </li>
                            <li>
                                <label for="surname">Podaj nazwisko:</label>
                                <input type="text" name="nazwisko" id="surname" />
                            </li>
                            <li>
                                <label for="reg_login">Podaj login:</label>
                                <input type="text" name="login" id="reg_login" />
                            </li>
                            <li>
                                <label for="reg_password">Podaj hasło:</label>
                                <input type="password" name="password" id="reg_password" />
                            </li>
                            <li>
                                <input type="submit" value="Zarejestruj się"/>
                            </li>
                        </ul>
                    </form>
                </article>
                <aside>
                    <h3>Wirtualna Restauracja pomoże Ci odkryć kulinarne bogactwa miasta.</h3>
                    <img src="img/login.jpg" alt="restauracja" />
                </aside>
            </div>
        </section>
        
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>