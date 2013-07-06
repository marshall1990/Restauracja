<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> --%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="org.mypackage.hello.*" %>
<%@ page import="java.sql.*" %>
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
                  <%            
                  Przekierowania przekierowania = new Przekierowania();  
                  ArrayList<String> listadan;
                  listadan=przekierowania.zamowieniewszystko(response);
                  %>
                         <h1>Menu</h1>
                         <form name="form1" onsubmit="checkBoxValidation()" action="usundanie2.jsp">
                             <ul>
                                 <%!    int i = 0; %>
                                 <% for( i=0; i<listadan.size(); i=i+2) { %>
                                 <li>                                
                                     <input id="check<%=i %>" type="checkbox" name="usuwanedania" value="<%=listadan.get(i)%>" />
                                     <label class="css-label" for="check<%=i %>"><%=listadan.get(i+1)%></label>
                                 </li>
                                 <% } %>                            
                                 <li>
                                    <input type="submit" value="Usun"/>  
                                 </li>                            
                            </ul>
                         </form>   
                </article>
                <aside>
                    <h3>Wybierz dania, ktore chcesz usunać.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
