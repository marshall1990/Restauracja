<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>

<%
//String url = "jdbc:mysql://mysql3.ph-hos.osemka.pl:3306/";
//String url = "jdbc:mysql://localhost:3306/";
//session.setAttribute( "url", "jdbc:mysql://sql09.freemysql.net:3306/" );
//session.setAttribute( "dbName", "dania" );
//session.setAttribute( "driver", "com.mysql.jdbc.Driver" );
//session.setAttribute( "userName", "hariseldon" );
//session.setAttribute( "password", "123qwe" );
//ewtrtyt jhghjg h

session.setAttribute( "url", "jdbc:mysql://wirtres.host-ed.me:3306/" );
session.setAttribute( "dbName", "wirtresh_dania" );
session.setAttribute( "driver", "com.mysql.jdbc.Driver" );
session.setAttribute( "userName", "wirtresh_hari" );
session.setAttribute( "password", "123qwe" );

session.setAttribute( "url", "jdbc:mysql://sql2.freesqldatabase.com:3306/" );
session.setAttribute( "dbName", "sql28605" );
session.setAttribute( "driver", "com.mysql.jdbc.Driver" );
session.setAttribute( "userName", "sql28605" );
session.setAttribute( "password", "tM5!rI8*" );

session.setAttribute( "url", "jdbc:mysql://johnny.heliohost.org:3306/" );
session.setAttribute( "dbName", "hariseld_dania" );
session.setAttribute( "driver", "com.mysql.jdbc.Driver" );
session.setAttribute( "userName", "hariseld_hari" );
session.setAttribute( "password", "123qwe" );

session.setAttribute( "url2", "jdbc:mysql://johnny.heliohost.org:3306/" );
session.setAttribute( "dbName2", "hariseld_zlecenia" );
session.setAttribute( "driver2", "com.mysql.jdbc.Driver" );
session.setAttribute( "userName2", "hariseld_hari" );
session.setAttribute( "password2", "123qwe" );

request.setAttribute( "url1", "jdbc:mysql://johnny.heliohost.org:3306/" );
request.setAttribute( "dbName1", "hariseld_dania" );
request.setAttribute( "driver1", "com.mysql.jdbc.Driver" );
request.setAttribute( "userName1", "hariseld_hari" );
request.setAttribute( "password1", "123qwe" );
%>
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