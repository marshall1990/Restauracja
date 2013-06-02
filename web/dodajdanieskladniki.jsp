
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="dodajdanieskladniki.css" />
        <title>Składniki</title>
    </head>
    <body>
        
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
                  
   <div class="menulogreg">
   <div class="naglowek">Z jakich składników złożone jest danie ?</div>     
     <form onsubmit="checkBoxValidation()" action="dodajzdjecia.jsp">
        <% while (rst.next()) {  %>
          <div class="lewa"><input id="chek" type="checkbox" name="skladnik" value="<%=rst.getString(2)%>" /></div><div class="prawa"> <%=rst.getString(1)%></div>                                              
         <% } %>
          <div class="srodek"><input type="submit" value="OK"/></div>
     </form> 
   </div> 
  </body>
</html>
    <%
          conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("errorsite.jsp");
    }
 %> 
