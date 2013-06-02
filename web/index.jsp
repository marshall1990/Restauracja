<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//String url = "jdbc:mysql://mysql3.ph-hos.osemka.pl:3306/";
//String url = "jdbc:mysql://localhost:3306/";
//session.setAttribute( "url", "jdbc:mysql://sql09.freemysql.net:3306/" );
//session.setAttribute( "dbName", "dania" );
//session.setAttribute( "driver", "com.mysql.jdbc.Driver" );
//session.setAttribute( "userName", "hariseldon" );
//session.setAttribute( "password", "123qwe" );


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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css" />
        <title>Witaj w Wirtualnej Restauracji</title>
    </head>
    <body>
       <div class="menulogreg">  
            <div class="naglowek">Witaj w Wirtualnej Restauracji</div> 
            <div class="logreg">Zaloguj się:</div>
            <form action="zalogowanie.jsp" method="post">
                <div class="lewa">Login:</div><div class="prawa"><input type="text" name="login"/></div>
                <div class="lewa">Hasło:</div><div class="prawa"><input type="text" name="password"/></div>
                <div class="srodek"><input type="submit" value="OK"/></div>
            </form>       
            
            <div class="logreg">Zarejestruj się:</div>
            <form action="rejestrowanie.jsp" method="get">
                <div class="lewa">Imię:</div><div class="prawa"><input type="text" name="imie"/></div>
                <div class="lewa">Nazwisko:</div><div class="prawa"><input type="text" name="nazwisko"/></div>
                <div class="lewa">Login:</div><div class="prawa"><input type="text" name="login"/></div>
                <div class="lewa">Hasło:</div><div class="prawa"><input type="text" name="password"/></div>
                <div class="srodek"><input type="submit" value="OK"/></div>
            </form>
        </div> 
    </body>
</html>

