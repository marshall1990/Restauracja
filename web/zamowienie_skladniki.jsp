<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> --%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<%@page language="java" import="java.sql.*" %>
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
                    Connection conn = null;
                    ResultSet rst=null;

                    try {
                        Class.forName((String)session.getAttribute( "driver" )).newInstance();
                        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   

                        String sql="SELECT skladnik FROM skladniki";

                        PreparedStatement statement=conn.prepareStatement( sql );
                        rst=statement.executeQuery();
                     %>
                     <h1>Wybier składniki:</h1>         
                     <form name="form1" onsubmit="checkBoxValidation()" action="zamowienie_skladniki_dania.jsp">
                         <ul>
                            <%! int i = 0; %>
                            <% while (rst.next()) {  %>
                            <% i++; %>
                            <li>
                                <input id="check<%=i %>" type="checkbox" name="skladnik" value="<%=rst.getString(1)%>" />
                                <label class="css-label" for="check<%=i %>"><%=rst.getString(1)%></label>
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
                    <h3>Wybier składniki dania, które chcesz zamówić.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>