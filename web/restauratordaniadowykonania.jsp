<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> --%>
<%@page import="org.mypackage.hello.Statystyka"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<% 
Statystyka statystyka = new Statystyka();
statystyka.policz();
%>
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
            <div class="container restaurator">
                <article>
                        <h1>Podsumowanie:</h1>
                        <table>
                            <thead>
                                <tr>
                                    <td>Nazwa dania</td>
                                    <td>Ilość</td>
                                </tr>
                            </thead>
                            <%!    int i = 0; %>
                            <% for( i=0; i<statystyka.dania.size(); i=i+2) { %>
                            <tr>
                                <td><%=statystyka.dania.get(i)%></td>
                                <td><%=statystyka.dania.get(i+1)%></td>
                            </tr>
                            <% } %>
                        </table>  
                        <form name="form1" onsubmit="checkBoxValidation()" action="dodajdanie.jsp">
                         <ul>
                            <li>
                                <input type="submit" value="Dodaj danie"/>  
                            </li>
                        </ul>
                        </form>     
                </article>
                <aside>
                    <h3>Wybierz zamówienia, które chcesz dostarczyć.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>