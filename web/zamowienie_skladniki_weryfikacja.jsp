<%@page import="org.mypackage.hello.Weryfikacjazamowienia"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/media-queries.css" />
        <title>Wirtualna Restauracja</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>WIRTUALNA RESTAURACJA</h1>
                <jsp:include page="top_nav.jsp" />
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                <%
                Weryfikacjazamowienia dania = new Weryfikacjazamowienia();
                String wynos=request.getParameter("nawynos");
                if (wynos==null) wynos=" w lokalu";
                dania.weryfikuj(request.getParameterValues("zamowionedania"),request.getParameterValues("iloscdan"),zalogowany.getLogin(),wynos);
                if (dania.getBlad().equals("Tak")) response.sendRedirect("bazadanychblad.jsp");
                %>
                <h1>Zamówienie złożone, dziękujemy.</h1>          
                </article>
                <aside>
                    <h3>Wybierz dania, które chcesz zamówić.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
