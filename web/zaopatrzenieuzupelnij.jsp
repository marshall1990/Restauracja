

<%@page import="org.mypackage.hello.Zaopatrzenie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Zaopatrzenie zaopatrzenie = new Zaopatrzenie();
zaopatrzenie.uzupelnij(request.getParameterValues("dostarczone"));
response.sendRedirect("zaopatrzeniemenu.jsp");
%>

