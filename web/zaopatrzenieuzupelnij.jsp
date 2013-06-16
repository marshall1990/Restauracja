

<%@page import="org.mypackage.hello.Zaopatrzenie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Zaopatrzenie zaopatrzenie = new Zaopatrzenie();
zaopatrzenie.uzupelnij(request.getParameterValues("dostarczone"));
if (zaopatrzenie.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
else { response.sendRedirect("zaopatrzeniemenu.jsp");}
%>

