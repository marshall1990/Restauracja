<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Kelnerprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.kelnerdaniadowykonaniazaktualizuj(response, request);
%>
