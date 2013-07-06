<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/>

<nav>
    <ul>
        <li>
            <p class="msg_desktop">Witaj <%= zalogowany.getLogin() %>, Wirtualna restauracja - zaprasza!</p>
            <p class="msg_tablet">Witaj <%= zalogowany.getLogin() %> w wirtualnej restauracji!</p>
        </li>
        <li>
            <a href="podanie_menu.jsp">Home</a>
        </li>
        <li>
            <a href="zamowienie_skladniki.jsp">Szukaj</a>
        </li>
        <li>
            <a href="kontakt.jsp">Kontakt</a>
        </li>
        <li>
            <a class="btn_submit" href="index.jsp">Wyloguj</a>
        </li>
    </ul>
</nav>
