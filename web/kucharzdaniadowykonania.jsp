<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.mypackage.hello.Brakujaceskladniki"%>
<%@page import="org.mypackage.hello.Listadan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<%
Listadan listadan = new Listadan();
ArrayList<String> spisdan;
spisdan=listadan.wyswietl("lista_zamowien");
if (listadan.getBlad().equals("Tak")) response.sendRedirect("bazadanychblad.jsp");
Brakujaceskladniki braki = new Brakujaceskladniki();
ArrayList<String> listaskladnikow;
listaskladnikow=braki.wypisz();
if (braki.getBlad().equals("Tak")) response.sendRedirect("bazadanychblad.jsp");
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
                        <h1>Zaznacz wykonane dania:</h1>
                        <form name="form1" onsubmit="checkBoxValidation()" action="kucharzdaniadowykonaniazaaktualizuj.jsp">
                             <ul>
                                 <% for(int i=0; i<spisdan.size(); i=i+4) { %>
                                 <li>
                                     <input id="check<%=i%>" type="checkbox" name="wykonanedania" value="<%=spisdan.get(i+3)%>" />
                                     <label class="css-label" for="check<%=i %>" >
                                         <%=spisdan.get(i)%>
                                         <%=spisdan.get(i+2)%> dla zamówienia nr 
                                         <%=spisdan.get(i+1)%>
                                     </label>
                                 </li>
                                 <% } %>
                                 <li>
                                    <input type="submit" value="Dalej"/>  
                                 </li>
                            </ul>
                         </form>
                         <h1>Brakujące składniki:</h1>        
                         <form name="form1" onsubmit="checkBoxValidation()" action="kucharzuzupelnijskladniki.jsp">
                          <ul>
                             <% for( int i=0; i<listaskladnikow.size();i++) { %>
                             <li>
                                <p> <%=listaskladnikow.get(i)%></p>
                             </li>
                             <% } %> 
                             <li>
                                 <input type="submit" value="Złóż zamówienie na składnki"/>
                             </li>
                         </ul>
                         </form>     
                </article>              
                <aside>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>                   
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
