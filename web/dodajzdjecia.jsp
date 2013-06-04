<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>

<%
Connection conn = null;
ResultSet rst=null;
String skladniki[]= request.getParameterValues("skladnik");

try {
    Class.forName((String)session.getAttribute( "driver" )).newInstance();
    conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));

    String sql="SELECT ID_Dania FROM danie where nazwa='"+(String)session.getAttribute("nazwadania")+"'";
    Statement statement=conn.createStatement();
    rst=statement.executeQuery(sql);
    rst.next();
    
    for(int i=0; i<skladniki.length; i++) {
        sql="insert into `dania`.`daniaskladniki` values (?,?)";
        PreparedStatement statement1=conn.prepareStatement(sql);
        statement1.setInt(1,rst.getInt(1));
        statement1.setInt(2,Integer.parseInt(skladniki[i]));
        statement1.executeUpdate();
       }        
  }
    catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("errorsite.jsp");
      }  
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                    <h1>Dodaj zdjęcia</h1>
                    
                </article>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
