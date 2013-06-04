<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
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
                <nav>
                    <ul>
                        <li>
                            <p>Witaj <%= zalogowany.getLogin() %>, Wirtualna restauracja - zaprasza!</p>
                        </li>
                        <li>
                            <a href="#"><img src="img/icon_home.png" alt="home" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="img/icon_search.png" alt="home" /></a>
                        </li>
                        <li>
                            <a href="mailto:marshall1990@onet.eu"><img src="img/icon_mail.png" alt="home" /></a>
                        </li>
                        <li>
                            <a class="btn_submit" href="index.jsp">Wyloguj</a>
                        </li>
                    </ul>
                </nav>               
            </div>   
        </header>
            
        <section id="image">
            <img src="img/image_below_header.jpg" alt="pizza" />
        </section>
        
        <section class="windows">
            <div class="container">
                <article>
                    <h3 class="brown">Restauracje</h3>
                    <img src="img/menu_img1.jpg" alt="restauracje" />
                    <p>Zawiera wszystkie lokale restauratora. Restaurator może dodawać oraz modyfikować lokale.</p>
                    <a class="btn_submit" href="#" >Więcej</a>
                </article>
                <article>
                    <h3 class="orange">Menu</h3>
                    <img src="img/menu_img2.jpg" alt="menu" />
                    <p>Wszystkie dania oferowane przez restauratora. Restaurator może dodawać oraz modyfikować swoje pozycje w menu.</p>
                    <a class="btn_submit" href="#" >Więcej</a>
                </article>
                <article>
                    <h3 class="rose">Zamówienia</h3>
                    <img src="img/menu_img3.jpg" alt="zamówienia" />
                    <p>Lista aktualnych zamówień. Restaurator może przeglądać statystyki zamówień.</p>
                    <a class="btn_submit" href="#" >Więcej</a>
                </article>               
            </div>
        </section>
        
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>