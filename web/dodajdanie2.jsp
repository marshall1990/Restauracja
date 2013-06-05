<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="org.mypackage.hello.Rejestrator"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<%
Connection conn = null;
String sql=null;
ResultSet rst=null;
String blad=null;
String userID=null;



Rejestrator walidator = new Rejestrator();
BeanUtils.populate(walidator, request.getParameterMap());



if (walidator.weryfikujdanie().equals("Brak")) {
        
    try {
  
        Class.forName((String)session.getAttribute( "driver" )).newInstance();
        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));      
        
        session.setAttribute( "nazwadania", walidator.getNazwadania() );
        
        sql="select count(nazwa) from danie where nazwa='"+walidator.getNazwadania()+"'";
        Statement statement=conn.createStatement();
        rst=statement.executeQuery(sql);
        rst.next();
        
        if (rst.getInt(1)>0) blad="Danie o takiej nazwie już jest w menu. Podaj inną nazwę";
           else {
               sql="select ID_User from users where login='"+zalogowany.getLogin()+"' and password='"+zalogowany.getPassword()+"'";
               Statement statement0=conn.createStatement();
               rst=statement0.executeQuery(sql);
               rst.next();
               userID=rst.getString(1);
               
               sql="insert into `danie` values (?,?,?,?)";
               PreparedStatement statement1=conn.prepareStatement(sql);
               statement1.setInt(1,0);
               statement1.setString(2,walidator.getNazwadania());
               statement1.setString(3,walidator.getPrzepis());
               statement1.setString(4,userID);
               statement1.executeUpdate();
               response.sendRedirect("dodajdanieskladniki.jsp");
             }
        conn.close();    
    }
    catch (Exception e) {
         e.printStackTrace();
         blad="Błąd połączenia z bazą danych";    
       }
 }
 else blad=walidator.weryfikujdanie()+".";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/media-queries.css" />
        <title>Wirtualna Restauracja</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>WIRTUALNA RESTAURACJA</h1>
                <jsp:include page="top_nav.jsp" />
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                    <h1>Uwaga!</h1>
                    <p class="red"><%=blad %></p>
                    <a href="dodajdanie.jsp" class="btn_submit">OK</a>
                </article>
                <aside>
                    <h3>Dodaj przepis dania, które chcesz skomponować.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
