

<%@page import="java.util.ArrayList"%>
<%@page import="org.mypackage.hello.Skladniki"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
Skladniki skladniki = new Skladniki();
ArrayList<String> listaskladnikow;
listaskladnikow=skladniki.wypisz();
if (skladniki.getBlad().equals("Tak")) response.sendRedirect("bazadanychblad.jsp");
%>
                     <h1>Wybierz składniki:</h1>         
                     <form name="form1" onsubmit="checkBoxValidation()" action="kucharzuzupelnijskladnikibrakujace.jsp">
                         <ul>
                            <% for(int i=0;i<listaskladnikow.size();i++) {  %>
                            <li>
                                <input id="check<%=i %>" type="checkbox" name="skladnik" value="<%=listaskladnikow.get(i)%>" />
                                <label class="css-label" for="check<%=i %>"><%=listaskladnikow.get(i)%></label>
                            </li>                                              
                            <% } %> 
                            <li>
                                <input type="submit" value="Dodaj do brakujących"/>
                            </li>
                        </ul>
                     </form>
    </body>
</html>
