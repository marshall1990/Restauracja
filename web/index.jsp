<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/media-queries.css" />
        <title>Witamy w Wirtualnej Restauracji</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>WIRTUALNA RESTAURACJA</h1>
                <form action="weryfikacja_logowania.jsp" method="post">
                    <ul>
                        <li>
                            <label for="login">Podaj login:</label>
                            <input type="text" name="login" id="login" />
                        </li>
                        <li>
                            <label for="password">Podaj hasło:</label>
                            <input type="password" name="password" id="password" />
                        </li>
                        <li>
                            <input type="submit" value="Zaloguj się" />
                        </li>
                    </ul>
                </form> 
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                    <h1>Rejestracja</h1>
                    <form action="weryfikacja_rejestracji.jsp" method="get">
                        <ul>
                            <li>
                                <label for="name">Podaj imię:</label>
                                <input type="text" name="imie" id="name" />
                            </li>
                            <li>
                                <label for="surname">Podaj nazwisko:</label>
                                <input type="text" name="nazwisko" id="surname" />
                            </li>
                            <li>
                                <label for="reg_login">Podaj login:</label>
                                <input type="text" name="login" id="reg_login" />
                            </li>
                            <li>
                                <label for="reg_password">Podaj hasło:</label>
                                <input type="password" name="password" id="reg_password" />
                            </li>
                            <li>
                                <input type="submit" value="Zarejestruj się"/>
                            </li>
                        </ul>
                    </form>
                </article>
                <aside>
                    <h3>Wirtualna Restauracja pomoże Ci odkryć kulinarne bogactwa miasta.</h3>
                    <img src="img/login.jpg" alt="restauracja" />
                </aside>
            </div>
        </section>
        
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>