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
                    Daniaposkladnikach dania = new Daniaposkladnikach();
                    if (dania.weryfikuj(request.getParameterValues("skladnik")).equals("Tak")) response.sendRedirect("errorsite.jsp");
                  %>
                         <h1>Dania zawierające podane składniki:</h1>
                         <form name="form1" onsubmit="checkBoxValidation()" action="zamowienie_skladniki_potwierdzenie.jsp">
                             <ul>
                                 <%!    int i = 0; %>
                                 <% for( i=0; i<dania.dania.size(); i++) { %>
                                 <li>
                                     <input type="hidden" name="zamowionedania" value="<%=dania.dania.get(i)%>" />
                                     <label class="css-label" ><%=dania.dania.get(i)%></label>
                                     <div class="styled-select">
                                        <select name="iloscdan">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>                                     
                                     </div>
                                 </li>
                                 <% } %>                            
                                 <li>
                                    <input id="w" type="checkbox" name="nawynos" value=" na wynos" />
                                    <label class="css-label" for="w">Zaznacz dla dań na wynos</label>
                                 </li>
                                 <li>
                                    <input type="submit" value="Dalej"/>  
                                 </li>                            
                            </ul>
                         </form>   
                </article>
                <aside>
                    <h3>Wybierz dania, które chcesz zamówić.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
