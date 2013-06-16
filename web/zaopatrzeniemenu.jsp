<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.mypackage.hello.Brakujaceskladniki"%>
<%@page import="org.mypackage.hello.Listadan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<%
Brakujaceskladniki braki = new Brakujaceskladniki();
ArrayList<String> listaskladnikow;
listaskladnikow=braki.wypisz();
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
            <div class="container dostawca">
                <article>
                        <h1>Wybierz dania:</h1>
                        <form name="form1" onsubmit="checkBoxValidation()" action="zaopatrzenieuzupelnij.jsp">
                             <ul>
                                 <% for( int i=0; i<listaskladnikow.size();i++) { %>
                                 <li>
                                     <input id="check<%=i%>" type="checkbox" name="dostarczone" value="<%=listaskladnikow.get(i)%>" />
                                     <label class="css-label" for="check<%=i %>" >
                                         <%=listaskladnikow.get(i)%>
                                     </label>
                                 </li>
                                 <% } %>
                                 <li>
                                    <input type="submit" value="Aktualizuj"/>  
                                 </li>
                            </ul>
                         </form>                           
                </article>                    
                <aside>
                    <h3>Wybierz zamówienia, które chcesz wykonać.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
                   
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
