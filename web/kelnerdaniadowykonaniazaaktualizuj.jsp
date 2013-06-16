<%@page import="org.mypackage.hello.Kelnerprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<!DOCTYPE html>
<%
Kelnerprzeniesieniedan przenies = new Kelnerprzeniesieniedan();
przenies.przenies(request.getParameterValues("wykonanedania"));
if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
else { response.sendRedirect("kelnerdaniadowykonania.jsp");}
%>
