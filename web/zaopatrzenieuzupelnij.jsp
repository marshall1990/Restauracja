<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Zaopatrzenie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.zaopatrzenieuzupelnij(response, request);
%>

