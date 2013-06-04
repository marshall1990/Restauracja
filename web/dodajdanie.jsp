<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="zalogowany" scope="session" class="org.mypackage.hello.Zalogowany"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/html5reset-1.6.1.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Witamy w Wirtualnej Restauracji</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>WIRTUALNA RESTAURACJA</h1>
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
            </div>   
        </header>
            
        <section>
            <div class="container">
                <article>
                    <h1>Podaj nazwę i przepis dania</h1>
                    <form name="dish" action="dodajdanie2.jsp" method="post">
                        <ul>
                            <li>
                                <label for="name">Nazwa dania:</label>
                                <input type="text" name="nazwadania" id="name" />
                            </li>
                            <li>
                                <label for="recipe">Przepis (500 znaków):</label>
                                <textarea rows="10" cols="50" name="przepis" id="recipe" maxlength="500"></textarea>
                            </li>
                            <li>
                                <input type="submit" value="Dodaj"/>
                            </li>
                        </ul>
                    </form>
                </article>
                <aside>
                    <h3>Dodaj przepis dania, które chcesz skomponować.</h3>
                    <img src="img/image_recipe.jpg" alt="przepis" />
                </aside>
            </div>
        </section>
        <footer>
            Created by Krzysztof Pazdyk & Dawid Ślusarczyk :: All rights reserved :: Copyright @ 2013 
        </footer> 
    </body>
</html>
