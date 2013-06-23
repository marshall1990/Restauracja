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
            <div class="container">
                <article>
                    <form action="dodajskladnik2.jsp" method="get">
                        <ul>
                            <li>
                                <label for="name">Podaj nazwę skladnika:</label>
                                <input type="text" name="nazwa" id="name" />
                            </li>
                            <li>
                                <label for="quantity">Podaj ilość:</label>
                                <input type="text" name="ilosc" id="quantity" />
                            </li>
                            <li>
                                <label for="description">Podaj opis:</label>
                                <input type="text" name="opis" value="brak" id="description" />
                            </li>
                            <li>
                                <input type="submit" value="Dodaj"/>
                            </li>
                        </ul>
                    </form>
                </article>
                <aside>
                    <h3>Dodaj składnik do bazy składników.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>