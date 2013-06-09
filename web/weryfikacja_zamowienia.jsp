<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection conn = null;
ResultSet rst=null;
String sql;
String blad=null;

String wybranedania[]= request.getParameterValues("wybranedania");
String ilosc[]= request.getParameterValues("ilosc");

String all="";
if(wybranedania != null) for(int i=0; i<wybranedania.length; i++) {
    all=all+wybranedania[i];



}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
