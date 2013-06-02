<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="menu.css" />
        <title>Menu</title>
    </head>
    <body>
        <div class="hello"> 
            Witaj <%= zalogowany.getLogin() %>, Wirtualna restauracja - zaprasza!  
        </div>
        <div class="main">
            <div class="wiersz">
                <div class="kolumna">
                    <form name="B1" action="menu.jsp">
                            <input type="submit" value="Przeglądaj dania i zamawiaj" name="przegladaj" /> 
                    </form></div>
                <div class="kolumna">
                    <form name="B2" action="menu.jsp">
                            <input type="submit" value="Wyszukaj danie po nazwie" name="przegladaj" /> 
                    </form></div>
                <div class="kolumna">
                    <form name="B3" action="wyszukiwanie_skladniki.jsp">
                            <input type="submit" value="Wyszukaj danie po składnikach" name="przegladaj" /> 
                    </form></div>
            </div>
            <div class="wiersz">
                <div class="kolumna">
                    <form name="B4" action="dodajdanie.jsp">
                            <input type="submit" value="Dodaj danie" name="przegladaj" /> 
                    </form></div>
                <div class="kolumna">
                    <form name="B5" action="menu.jsp">
                            <input type="submit" value="Wyloguj" name="przegladaj" /> 
                    </form></div>
                <div class="kolumna">
                    <form name="B6" action="menu.jsp">
                            <input ID="I6" type="submit" value="" name="przegladaj" /> 
                    </form></div>  
            </div> 
        </div>
    </body>
</html>
