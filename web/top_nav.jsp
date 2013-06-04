<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<nav>
    <ul>
        <li>
            <p>Witaj <%= zalogowany.getLogin() %>, Wirtualna restauracja - zaprasza!</p>
        </li>
        <li>
            <a href="podanie_menu.jsp">Home</a>
        </li>
        <li>
            <a href="#">Szukaj</a>
        </li>
        <li>
            <a href="kontakt.jsp">Kontakt</a>
        </li>
        <li>
            <a class="btn_submit" href="index.jsp">Wyloguj</a>
        </li>
    </ul>
</nav>
