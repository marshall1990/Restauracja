
<%@page import="org.mypackage.hello.Przekierowania"%>
<%@page import="org.mypackage.hello.Brakujacedodaj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Przekierowania przekierowania = new Przekierowania();
przekierowania.kucharzuzupelnijskladnikibrakujace(response, request);
%>

