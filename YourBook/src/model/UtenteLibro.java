package model;

import java.io.Serializable;

public class UtenteLibro implements Serializable {

    String isbn;
    int id_utente;
    int valutazione;

    public UtenteLibro() {
        this.isbn = " ";
        this.id_utente = -1;
        this.valutazione = -1;
    }

    public UtenteLibro(String isbn, int id_utente, int valutazione) {
        this.isbn = isbn;
        this.id_utente = id_utente;
        this.valutazione = valutazione;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getId_utente() {
        return id_utente;
    }

    public void setId_utente(int id_utente) {
        this.id_utente = id_utente;
    }

    public int getValutazione() {
        return valutazione;
    }

    public void setValutazione(int valutazione) {
        this.valutazione = valutazione;
    }
}
