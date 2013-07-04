
<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.mypackage.hello.Dodaniedaniaskladniki2"%>
<%@page import="org.mypackage.hello.Bazadanych"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
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
                    ArrayList<String> listaskladnikow;
                    Przekierowania przekierowania = new Przekierowania();
                    listaskladnikow=przekierowania.dodajdanieskladniki2(response);
                    %>
                    <h1>Wybierz składniki dania:</h1>     
                    <form onsubmit="checkBoxValidation()" action="dodajdanieskladniki3.jsp">
                        <ul>
                            <%!    int i = 0; %>
                                 <% for( i=0; i<listaskladnikow.size(); i=i+2) { %>
                            <li>
                                <input id="check<%=i %>" type="checkbox" name="skladnik" value="<%=listaskladnikow.get(i)%>" />
                                <label class="css-label" for="check<%=i %>"><%=listaskladnikow.get(i+1)%></label>
                            </li>                                              
                            <% } %> 
                            <li>
                                <input type="submit" value="OK"/>
                            </li>
                        </ul>
                    </form>
                            
                </article>
                <aside>
                    <h3></h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>