

<%@page import="org.mypackage.hello.Statystyka"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
Statystyka statystyka = new Statystyka();
statystyka.policz();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
                             <ul>
                                 <%!    int i = 0; %>
                                 <% for( i=0; i<statystyka.dania.size(); i=i+2) { %>
                                 <li>
                                     <label class="css-label" for="check<%=i %>" ><%=statystyka.dania.get(i)%></label> 
                                     <label class="css-label" for="check<%=i %>"><%=statystyka.dania.get(i+1)%></label>
                                 </li>
                                 <% } %>
                            </ul>   
                            <form name="form1" onsubmit="checkBoxValidation()" action="dodajdanie.jsp">
                             <ul>
  
                                 <li>
                                    <input type="submit" value="Dodaj danie"/>  
                                 </li>
                            </ul>
                         </form>     
    </body>
</html>
