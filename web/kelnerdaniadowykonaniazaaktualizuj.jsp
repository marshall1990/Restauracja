<%@page import="org.mypackage.hello.Kelnerprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Kelnerprzeniesieniedan przenies = new Kelnerprzeniesieniedan();
przenies.przenies(request.getParameterValues("wykonanedania"));
response.sendRedirect("kelnerdaniadowykonania.jsp");
%>
