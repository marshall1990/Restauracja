
<%@page import="org.mypackage.hello.Brakujacedodaj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Brakujacedodaj braki = new Brakujacedodaj();
braki.dodaj(request.getParameterValues("skladnik"));
if (braki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
else { response.sendRedirect("kucharzdaniadowykonania.jsp"); }
%>

