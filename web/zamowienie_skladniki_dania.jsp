<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.mypackage.hello.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="wyszukiwanie_skladniki1.css" />
        <title>Dania</title>
    </head>
    <body>
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
    rst=statement.executeQuery();
              
while (rst.next()) {
            out.println(rst.getString(1)+",");
        }
           
            conn.close();
    }
	catch (Exception e) {
  e.printStackTrace();
  out.println("Błąd połączenia z bazą danych");
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
    </body>
</html>
