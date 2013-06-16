
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="zamowienie_nazwa_rezultat.jsp" method="get">
                        <ul>
                            <li>
                                <label for="name">Podaj nazwę dania:</label>
                                <input type="text" name="nazwa" id="name" />
                            </li>
                            <li>
                                <input type="submit" value="Szukaj"/>
                            </li>
                        </ul>
                    </form>
    </body>
</html>
