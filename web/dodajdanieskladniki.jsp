
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
                    Connection conn = null;
                    ResultSet rst=null;
                    String blad=null;

                    try {
                        Class.forName((String)session.getAttribute( "driver" )).newInstance();
                        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   

                        String sql="SELECT skladnik,ID_skladnika FROM skladniki ORDER BY skladnik";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        rst=statement.executeQuery();
                    %>
                    <h1>Wybier składniki dania, które chcesz skomponować.</h1>     
                    <form onsubmit="checkBoxValidation()" action="dodajzdjecia.jsp">
                        <ul>
                            <%! int i = 0; %>
                            <% while (rst.next()) {  %>
                            <% i++; %>
                            <li>
                                <input id="check<%=i %>" type="checkbox" name="skladnik" value="<%=rst.getString(2)%>" />
                                <label for="check<%=i %>"><%=rst.getString(1)%></label>
                            </li>                                              
                            <% } %> 
                            <li>
                                <input type="submit" value="OK"/>
                            </li>
                        </ul>
                    </form>
                    <%
                        conn.close();
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                            response.sendRedirect("errorsite.jsp");
                        }
                    %> 
                </article>
                <aside>
                    <h3>Dodaj przepis dania, które chcesz skomponować.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>