

<%@page import="org.mypackage.hello.Listadan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Listadan listadan = new Listadan();
listadan.wyswietl("lista_dostawca");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="form1" onsubmit="checkBoxValidation()" action="dostawcadaniadowykonaniazaaktualizuj.jsp">
                             <ul>
                                 <%!    int i = 0; %>
                                 <% for( i=0; i<listadan.dania.size(); i=i+4) { %>
                                 <li>
                                     <input id="check<%=i%>" type="checkbox" name="wykonanedania" value="<%=listadan.dania.get(i+3)%>" />
                                     <label class="css-label" for="check<%=i %>" ><%=listadan.dania.get(i)%></label> 
                                     <label class="css-label" for="check<%=i %>"><%=listadan.dania.get(i+2)%></label> dla 
                                     <label class="css-label" for="check<%=i %>"><%=listadan.dania.get(i+1)%></label>
                                 </li>
                                 <% } %>
                                 <li>
                                    <input type="submit" value="Dalej"/>  
                                 </li>
                            </ul>
                         </form>      
    </body>
</html>
