<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.usundanie2(response, request);
%>

