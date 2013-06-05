<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> --%>
<%@page contentType="text/html" pageEncoding="utf-8" errorPage="errorsite.jsp"%>
<%@ page import="org.mypackage.hello.*" %>
<%@ page import="java.sql.*" %>
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
                    String sql="";

                    try {
                        Class.forName((String)session.getAttribute( "driver" )).newInstance();
                        conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   

                        String dania_nazwy[]= request.getParameterValues("skladnik");

                        if(dania_nazwy != null) for(int i=0; i<dania_nazwy.length; i++)
                           // { 
                          //     sql=sql+"SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?)";
                         //      if (i<dania_nazwy.length-1) sql=sql+" UNION ";
                           //           }        
                            { 
                               sql=sql+"SELECT `Nazwa` FROM danie where `ID_dania` in (SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?))";
                               if (i<dania_nazwy.length-1) sql=sql+" UNION ";


                            }
                        PreparedStatement statement=conn.prepareStatement(sql);

                        for(int i=0; i<dania_nazwy.length; i++) {
                            statement.setString(i+1,dania_nazwy[i]);
                          }

                       // out.println(statement);
                                rst=statement.executeQuery();
                        %>
                         <h1>Dania zawierające podane składniki:</h1>
                         <form name="form1" onsubmit="checkBoxValidation()" action="weryfikacja_zamowienia.jsp">
                             <ul>
                                 <%while (rst.next()) {%>
                                 <li>
                                     <label><%=rst.getString(1)%></label>
                                     <div class="styled-select">
                                        <select name="nazwa">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>                                     
                                     </div>
                                 </li>
                                 <% } %>
                                 <li>
                                    <input type="submit" value="Dalej"/>  
                                 </li>
                            </ul>
                         </form>   
                             <% conn.close();
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                            out.println("błąd rejestracji użytkownika");
                        }
                    %>        

                    <%--<sql:query var="result2" dataSource="${danias}">
                                   SELECT nazwa from danie where danie.ID_dania in (SELECT ID_dania FROM daniaskladniki where ID_skladnika in dania_nazwy[])
                                </sql:query>       

                            <c:forEach var="row" items="${result2.rowsByIndex}">

                                            <c:forEach var="column" items="${row}">
                                                <%--  <td><c:out value="${column}"/></td>               (SELECT ID_skladnika FROM skladniki)                            --%>

                                                <%--         <p><input type="text" name="nazwy_dan" value="${column}" />${column}</p>

                                            </c:forEach>

                                    </c:forEach> --%>
                </article>
                <aside>
                    <h3>Wybier dania, które chcesz zamówić.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
