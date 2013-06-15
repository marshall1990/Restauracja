<%@page import="org.mypackage.hello.Dodaniedaniaskladniki"%>
<%@page import="org.mypackage.hello.Bazadanych"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String k;
Dodaniedaniaskladniki dodanie = new Dodaniedaniaskladniki();
k=dodanie.dodaj(request.getParameterValues("skladnik"),(String)session.getAttribute("dodawanedanie"));
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
                    <h1>Dodałeś danie</h1>
                    <%=k%>
                    <form  action="restauratordaniadowykonania.jsp">
                        <ul>
                            <li>
                                <input type="submit" value="Ok"/>
                            </li>
                        </ul>
                    </form>
                </article>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
