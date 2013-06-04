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

try {
    Class.forName((String)session.getAttribute( "driver" )).newInstance();
    conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   
           
    String sql="SELECT skladnik FROM skladniki";
   
    PreparedStatement statement=conn.prepareStatement( sql );
    rst=statement.executeQuery();
 %>
 <h1>Składniki</h1>
                   
 <form name="form1" onsubmit="checkBoxValidation()" action="zamowienie_skladniki_dania.jsp">
 
 <table><%             
while (rst.next()) {
            %>
    
                                <tr>
                                    <td><input type="checkbox" name="skladnik" value="<%=rst.getString(1)%>" /></td> <td><%=rst.getString(1)%></td>
                                </tr>
                            
      <%  } %>
    </table> 
    <p><input type="submit" value="submit"/>
    </form>   
     <%
           
            conn.close();
    }
	catch (Exception e) {
  e.printStackTrace();
  out.println("Błąd połączenia z bazą danych");
    }
%>        
                      
    </body>
</html>
