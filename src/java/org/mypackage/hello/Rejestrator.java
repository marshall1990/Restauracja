/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

public class Rejestrator {
  
	private String imie="Brak";
	private String nazwisko="Brak";
        private String login="Brak";
        private String password="Brak";
        private String nazwadania="Brak";
        private String przepis="Brak";

    /**
     * @return the imie
     */
    public String getImie() {
        return imie;
    }

    /**
     * @param imie the imie to set
     */
    public void setImie(String imie) {
        this.imie = imie;
    }

    /**
     * @return the nazwisko
     */
    public String getNazwisko() {
        return nazwisko;
    }

    /**
     * @param nazwisko the nazwisko to set
     */
    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    /**
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String weryfikuj() {
        String blad;
        blad = "Brak";
        
        if ((imie.equals("Brak")) || (imie.trim().equals(""))) {
            blad="Wprowadzono niepoprawne imię";
         }
        if ((nazwisko.equals("Brak")) || (nazwisko.trim().equals(""))) {
            if (blad.equals("Brak")) {
                blad="Wprowadzono niepoprawne nazwisko";
             } else {
                blad=blad+",<br />niepoprawne nazwisko";
             }
        }
        if ((login.equals("Brak")) || (login.trim().equals(""))) {
            if (blad.equals("Brak")) {
              blad="Wprowadzono niepoprawny login";
            } else {
                blad=blad+",<br />niepoprawny login";
            }
        }
  
        if ((password.equals("Brak")) || (password.trim().equals(""))) {
            if (blad.equals("Brak")) {
                  blad="Wprowadzono niepoprawne hasło";
            } else {
                blad=blad+",<br />niepoprawne hasło";
                }
        }
        return blad;
    }
    public String weryfikuj2() {
        String blad;
        blad = "Brak";
        
        if ((login.equals("Brak")) || (login.trim().equals(""))) {
             blad="Wprowadzono niepoprawny login";     
         }
  
        if ((password.equals("Brak")) || (password.trim().equals(""))) {
            if (blad.equals("Brak")) {
                  blad="Wprowadzono niepoprawne hasło";
            } else {
                blad=blad+",<br />niepoprawne hasło";
                }
        }
        return blad;
    }
    public String weryfikujdanie() {
        String blad;
        blad = "Brak";
        
        if ((getNazwadania().equals("Brak")) || (getNazwadania().trim().equals(""))) {
             blad="Wprowadzono nieprawidłowa nazwa dania";     
         }
  
        if ((getPrzepis().equals("Brak")) || (getPrzepis().trim().equals(""))) {
            if (blad.equals("Brak")) {
                  blad="Wprowadzono nieprawidłowy przepis";
            } else {
                blad=blad+",<br />nieprawidłowy przepis";
                }
        }
        return blad;
    }

    /**
     * @return the nazwadania
     */
    public String getNazwadania() {
        return nazwadania;
    }

    /**
     * @param nazwadania the nazwadania to set
     */
    public void setNazwadania(String nazwadania) {
        this.nazwadania = nazwadania;
    }

    /**
     * @return the przepis
     */
    public String getPrzepis() {
        return przepis;
    }

    /**
     * @param przepis the przepis to set
     */
    public void setPrzepis(String przepis) {
        this.przepis = przepis;
    }
}
