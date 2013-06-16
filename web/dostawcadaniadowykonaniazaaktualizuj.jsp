<%@page import="org.mypackage.hello.Dostawcaprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<!DOCTYPE html>
<%
Dostawcaprzeniesieniedan przenies = new Dostawcaprzeniesieniedan();
przenies.przenies(request.getParameterValues("wykonanedania"));
if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
else response.sendRedirect("dostawcadaniadowykonania.jsp");
%>
