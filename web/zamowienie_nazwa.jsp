<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorsite.jsp"%>
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
            <div class="container dostawca">
                <article>
                    <h1>Zamow danie:</h1>
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
                </article>              
                <aside>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>                   
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>