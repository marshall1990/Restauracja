<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<nav>
    <ul>
        <li>
            <p>Witaj <%= zalogowany.getLogin() %>, Wirtualna restauracja - zaprasza!</p>
        </li>
        <li>
            <a href="#"><img src="img/icon_home.png" alt="home" /></a>
        </li>
        <li>
            <a href="#"><img src="img/icon_search.png" alt="home" /></a>
        </li>
        <li>
            <a href="mailto:marshall1990@onet.eu"><img src="img/icon_mail.png" alt="home" /></a>
        </li>
        <li>
            <a class="btn_submit" href="index.jsp">Wyloguj</a>
        </li>
    </ul>
</nav>
