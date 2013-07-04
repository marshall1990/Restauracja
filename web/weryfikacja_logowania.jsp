<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Logowanie"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>

<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<jsp:setProperty name="zalogowany" property="*"/>

<%
Przekierowania przekierowania = new Przekierowania();
String blad=null;
blad=przekierowania.weryfikacjalogowania(zalogowany, response, request);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/media-queries.css" />
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
                    <form action="weryfikacja_rejestracji.jsp" method="get">
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