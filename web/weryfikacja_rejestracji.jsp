<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="org.apache.commons.beanutils.BeanUtilsBean"%>
<%@page import="org.mypackage.hello.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>

<%
String blad=null;
Rejestrator walidator = new Rejestrator();
BeanUtils.populate(walidator, request.getParameterMap());
blad=walidator.weryfikuj();    
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
                <form action="weryfikacja_logowania.jsp" method="post">
                    <ul>
                        <li>
                            <label for="login">Podaj login:</label>
                            <input type="text" name="login" id="login" />
                        </li>
                        <li>
                            <label for="password">Podaj hasło:</label>
                            <input type="password" name="password" id="password" />
                        </li>
                        <li>
                            <input type="submit" value="Zaloguj się" />
                        </li>
                    </ul>
                </form> 
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                    <h1>Uwaga!</h1>
                    <p class="red"><%=blad %></p>
                    <a href="index.jsp" class="btn_submit">OK</a>
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
