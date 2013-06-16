

<%@page import="org.mypackage.hello.Kucharzprzeniesieniedan"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<!DOCTYPE html>
<%
Kucharzprzeniesieniedan przenies = new Kucharzprzeniesieniedan();
przenies.przenies(request.getParameterValues("wykonanedania"));
if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
else { response.sendRedirect("kucharzdaniadowykonania.jsp");}
%>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="form1" onsubmit="checkBoxValidation()" action="daniadowykonaniazaaktualizuj.jsp">
                             <ul>
                                 <//%!    int i = 0; %>
                                 <//% for( i=0; i<przenies.dania.size(); i=i+4) { %>
                                 <li>
                                     <input type="checkbox" name="wykonanedania" value="<//%=przenies.dania.get(i+3)%>" />
                                     <label class="css-label" ><//%=przenies.dania.get(i)%></label> 
                                     <label class="css-label" ><//%=przenies.dania.get(i+2)%></label> dla zamówienia nr  
                                     <label class="css-label" ><//%=przenies.dania.get(i+1)%></label>
                                 </li>
                                 <//% } %>
                                 <li>
                                    <input type="submit" value="Dalej"/>  
                                 </li>
                                 <//%=k%>
                            </ul>
                         </form>
        
        
    </body>
</html>-->
