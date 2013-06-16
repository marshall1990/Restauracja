<%@page import="org.mypackage.hello.Dostawcaprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<!DOCTYPE html>
<%
Dostawcaprzeniesieniedan przenies = new Dostawcaprzeniesieniedan();
przenies.przenies(request.getParameterValues("wykonanedania"));
response.sendRedirect("dostawcadaniadowykonania.jsp");
%>
