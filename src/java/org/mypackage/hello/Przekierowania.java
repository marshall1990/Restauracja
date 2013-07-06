package org.mypackage.hello;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.*;
import org.apache.commons.beanutils.BeanUtils;

public class Przekierowania  {
    
    
    
    public String dodajdanie2(Zalogowany zalogowany, HttpServletResponse response, HttpSession session, HttpServletRequest request ) throws IOException, IllegalAccessException, InvocationTargetException, SQLException {
        
        
        Dodaniedaniadanie walidator = new Dodaniedaniadanie();
        BeanUtils.populate(walidator, request.getParameterMap());
        walidator.weryfikuj(zalogowany.getLogin());
        if (walidator.getBlad().equals("Nie")) {
            response.sendRedirect("dodajdanieskladniki2.jsp");
            session.setAttribute("dodawanedanie",request.getParameter("nazwadania"));
           }  
        return walidator.getBlad();
    }
    
    public ArrayList<String> dodajdanieskladniki2(HttpServletResponse response) throws IOException, SQLException {
    
        ArrayList<String> listaskladnikow;
        Skladniki skladniki = new Skladniki();
        listaskladnikow=skladniki.wypisz();
        if (skladniki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp");}
        return listaskladnikow;
         
    }
    
    public void dodajdanieskladniki3 (HttpServletResponse response, HttpSession session, HttpServletRequest request) throws IOException, SQLException {
    
        Dodaniedaniaskladniki dodanie = new Dodaniedaniaskladniki();
        dodanie.dodaj(request.getParameterValues("skladnik"),(String)session.getAttribute("dodawanedanie"));
        if (dodanie.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp");} 
    }
    
    
    public String dodajskladnik2 (HttpServletResponse response,HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, IOException {
    
                Skladnikidodaj skladniki = new Skladnikidodaj();
                skladniki.wypisz(request.getParameter("nazwa"), request.getParameter("ilosc"), request.getParameter("opis"));
                if (skladniki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
                return skladniki.getBlad();
    
    }
    
    public ArrayList<String> dostawcadaniadowykonania (HttpServletResponse response) throws SQLException, IOException {
        
        Listadan listadan = new Listadan();
        ArrayList<String> spisdan;
        spisdan = listadan.wyswietl("lista_dostawca");
        if (listadan.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        return spisdan;
       
    }
    
    public void dostawcadaniadowykonaniazaktualizuj (HttpServletResponse response,HttpServletRequest request) throws SQLException, IOException {
    
        Dostawcaprzeniesieniedan przenies = new Dostawcaprzeniesieniedan();
        przenies.przenies(request.getParameterValues("wykonanedania"));
        if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        else { response.sendRedirect("dostawcadaniadowykonania.jsp"); }
    
    }
    
    
    public ArrayList<String> kelnerdaniadowykonania (HttpServletResponse response) throws SQLException, IOException {
    
    
            Listadan listadan = new Listadan();
            ArrayList<String> spisdan;
            spisdan = listadan.wyswietl("lista_kelner");
            if (listadan.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
            return spisdan;    
    
    }
    
    
    public void kelnerdaniadowykonaniazaktualizuj (HttpServletResponse response,HttpServletRequest request) throws SQLException, IOException {
    
    
            Kelnerprzeniesieniedan przenies = new Kelnerprzeniesieniedan();
            przenies.przenies(request.getParameterValues("wykonanedania"));
            if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
            else { response.sendRedirect("kelnerdaniadowykonania.jsp");}
   
    }
    
    public ArrayList<String> kucharzdaniadowykonania1 (HttpServletResponse response) throws IOException, SQLException {
        
        Listadan listadan = new Listadan();
        ArrayList<String> spisdan;
        spisdan=listadan.wyswietl("lista_zamowien");
        if (listadan.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
       
        return spisdan;
    
    }
    
    public ArrayList<String> kucharzdaniadowykonania2 (HttpServletResponse response) throws IOException, SQLException {
        
        Brakujaceskladniki braki = new Brakujaceskladniki();
        ArrayList<String> listaskladnikow;
        listaskladnikow=braki.wypisz();
        if (braki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
             
        return listaskladnikow;
    
    }
    
    
    
    public void kucharzdaniadowykonaniazaktualizuj (HttpServletResponse response,HttpServletRequest request) throws SQLException, IOException {
    
        Kucharzprzeniesieniedan przenies = new Kucharzprzeniesieniedan();
        przenies.przenies(request.getParameterValues("wykonanedania"));
        if (przenies.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        else { response.sendRedirect("kucharzdaniadowykonania.jsp");}
    
    } 
    
    public ArrayList<String> kucharzuzupelnijskladniki (HttpServletResponse response) throws IOException, SQLException {
        
        Skladniki skladniki = new Skladniki();
        ArrayList<String> listaskladnikow;
        listaskladnikow=skladniki.wypisz();
        if (skladniki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
             
        return listaskladnikow;
    
    }
    
    
    public void kucharzuzupelnijskladnikibrakujace (HttpServletResponse response,HttpServletRequest request) throws IOException, SQLException {
        
        Brakujacedodaj braki = new Brakujacedodaj();
        braki.dodaj(request.getParameterValues("skladnik"));
        if (braki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        else { response.sendRedirect("kucharzdaniadowykonania.jsp"); }
             
    
    }
    
    public ArrayList<String> restauratordaniadowykonania (HttpServletResponse response) throws IOException, SQLException {
        
        Statystyka statystyka = new Statystyka();
        ArrayList<String> dania;
        dania=statystyka.policz();
        if (statystyka.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        return dania;
             
    
    }
    
    public String weryfikacjalogowania (Zalogowany zalogowany, HttpServletResponse response,HttpServletRequest request) throws IllegalAccessException, InvocationTargetException, SQLException, IOException {
       
        
        String blad;
        Logowanie walidator = new Logowanie();
        BeanUtils.populate(walidator, request.getParameterMap());
        blad=walidator.weryfikuj();
        if (walidator.weryfikuj().equals("Nie")) {
            if (zalogowany.getLogin().equals("kucharz")) { response.sendRedirect("kucharzdaniadowykonania.jsp");}
            if (zalogowany.getLogin().equals("kelner")) { response.sendRedirect("kelnerdaniadowykonania.jsp");}
            if (zalogowany.getLogin().equals("dostawca")) { response.sendRedirect("dostawcadaniadowykonania.jsp");}
            if (zalogowany.getLogin().equals("restaurator")) { response.sendRedirect("restauratordaniadowykonania.jsp");}
            if (zalogowany.getLogin().equals("zaopatrzenie")) { response.sendRedirect("zaopatrzeniemenu.jsp");}
            response.sendRedirect("podanie_menu.jsp");
        } 
        
        
        
        return blad;
    
    
    }
    
    
    public String weryfikacjarejestracji (HttpServletRequest request) throws IllegalAccessException, SQLException, InvocationTargetException {
    
    
        String blad;
        Rejestrowanie walidator = new Rejestrowanie();
        BeanUtils.populate(walidator, request.getParameterMap());
        blad=walidator.weryfikuj();   
        return blad;
    
    
    }
    
    
    
    public ArrayList<String> zamowienienazwarezultat (HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
        Danieponazwie dania = new Danieponazwie();
        ArrayList<String> listadan;
        listadan=dania.wypisz(request.getParameter("nazwa"));
        if (dania.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        return listadan;
             
    
    }
    
    public ArrayList<String> zamowienieskladniki (HttpServletResponse response) throws IOException, SQLException {
        
                    Skladniki skladniki = new Skladniki();
                    ArrayList<String> listaskladnikow;
                    listaskladnikow=skladniki.wypisz();
                    if (skladniki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
        return listaskladnikow;
             
    
    }
    
    public ArrayList<String> zamowienieskladnikidania (HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
                    Daniaposkladnikach dania = new Daniaposkladnikach();
                    ArrayList<String> listadan;
                    listadan=dania.weryfikuj(request.getParameterValues("skladnik"));
                    if (dania.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }           
        return listadan;
             
    
    }
    
    public void zamowienieskladnikiweryfikacja (Zalogowany zalogowany, HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
                Weryfikacjazamowienia dania = new Weryfikacjazamowienia();
                String wynos=request.getParameter("nawynos");
                if (wynos==null) { wynos=" w lokalu"; }
                dania.weryfikuj(request.getParameterValues("zamowionedania"),request.getParameterValues("iloscdan"),zalogowany.getLogin(),wynos);
                if (dania.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }         
             
    
    }
    
    public ArrayList<String> zamowieniewszystko (HttpServletResponse response) throws IOException, SQLException {
        
                Calemenu dania = new Calemenu();
                ArrayList<String> listadan;
                listadan=dania.wypisz();
                if (dania.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp");  }    
        return listadan;
             
    
    }
    
    public ArrayList<String> zaopatrzeniemenu (HttpServletResponse response) throws IOException, SQLException {
        
             Brakujaceskladniki braki = new Brakujaceskladniki();
             ArrayList<String> listaskladnikow;
            listaskladnikow=braki.wypisz();
            if (braki.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp");   }
        return listaskladnikow;
             
    
    }
    
    public void zaopatrzenieuzupelnij (HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
               Zaopatrzenie zaopatrzenie = new Zaopatrzenie();
               zaopatrzenie.uzupelnij(request.getParameterValues("dostarczone"));
               if (zaopatrzenie.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
               else { response.sendRedirect("zaopatrzeniemenu.jsp");}       
             
    
    }
    
    public void usundanie2 (HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
                Restauratordanieusun dania = new Restauratordanieusun();
                dania.usun(request.getParameterValues("usuwanedania"));
                if (dania.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad.jsp"); }
                    else { response.sendRedirect("usundanie.jsp");}
             
    
    }
    
    
    public void usunskladnik2 (HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
        
                Restauratorskladnikusun skladnik = new Restauratorskladnikusun();
                skladnik.usun(request.getParameterValues("usuwanyskladnik"));
                if (skladnik.getBlad().equals("Tak")) { response.sendRedirect("bazadanychblad2.jsp"); }
                    else { response.sendRedirect("usunskladnik.jsp");}
             
    
    }
}
