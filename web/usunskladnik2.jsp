<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.usunskladnik2(response, request);
%>
