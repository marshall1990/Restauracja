<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Dostawcaprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.dostawcadaniadowykonaniazaktualizuj(response, request);
%>
