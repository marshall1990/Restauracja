

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
                <form action="dodajskladnik2.jsp" method="get">
                        <ul>
                            <li>
                                <label for="name">Podaj nazwę skladnika:</label>
                                <input type="text" name="nazwa" />
                            </li>
                            <li>
                                <label for="name">Podaj ile składnika ma być w magazynie</label>
                                <input type="text" name="ilosc"  />
                            </li>
                            <li>
                                <label for="name">Podaj opis</label>
                                <input type="text" name="opis" value="brak"/>
                            </li>
                            <li>
                                <input type="submit" value="Dodaj"/>
                            </li>
                        </ul>
                    </form>
    </body>
</html>
