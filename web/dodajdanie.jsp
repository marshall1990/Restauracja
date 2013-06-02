<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css" />
        <title>Dodawanie dania</title>
    </head>
    <body>      
        <div class="menulogreg">  
            <div class="naglowek"></div> 
            <div class="logreg">Podaj nazwę i przepis dania</div>
            <form name="Login Form" action="dodajdanie2.jsp" method="post">
                <div class="lewa">Nazwa dania:</div><div class="prawa"><input type="text" name="nazwadania"/></div>
                <div class="lewa">Przepis:</div><div class="prawa"><input type="text" name="przepis"/></div>
                <div class="srodek"><input type="submit" value="OK"/></div>
            </form>       
        </div>
    </body>
</html>
