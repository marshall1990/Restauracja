<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Dodaniedaniadanie"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<%
String blad;
Przekierowania przekierowania = new Przekierowania();
blad=przekierowania.dodajdanie2(zalogowany,response,session,request);       
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
                    <p class="red"><%=blad%></p>
                    <a href="dodajdanie.jsp" class="btn_submit">OK</a>
                </article>
                <aside>
                    <h3>Dodaj przepis dania, ktore chcesz skomponować.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
                              
                    
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
