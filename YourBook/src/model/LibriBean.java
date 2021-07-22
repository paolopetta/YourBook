package model;

import java.io.Serializable;

public class LibriBean implements Serializable {

    private static final long serialVersionUID = 1L;

    String isbn;
    String titolo;
    String autore;
    String casaEditrice;
    String immagine;
    String genere;
    int anno_pubb;

    public LibriBean() {
        isbn = "";
        titolo = "";
        autore = "";
        immagine = "";
        genere = "";
        anno_pubb = -1;
    }

    public LibriBean(String isbn, String titolo, String autore, String immagine, int anno_pubb) {
        this.isbn = isbn;
        this.titolo = titolo;
        this.autore = autore;
        this.immagine = immagine;
        this.anno_pubb = anno_pubb;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    public String getCasaEditrice() {
        return casaEditrice;
    }

    public void setCasaEditrice(String casaEditrice) {
        this.casaEditrice = casaEditrice;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public String getGenere() {
        return genere;
    }

    public void setGenere(String genere) {
        this.genere = genere;
    }

    public int getAnno_pubb() {
        return anno_pubb;
    }

    public void setAnno_pubb(int anno_pubb) {
        this.anno_pubb = anno_pubb;
    }

    public boolean isEmpty() {
        return isbn.equals("-1");
    }

    @Override
    public String toString() {
        return "LibriBean{" +
                "isbn=" + isbn +
                ", titolo='" + titolo + '\'' +
                ", autore='" + autore + '\'' +
                ", immagine='" + immagine + '\'' +
                ", genere='" + genere + '\'' +
                ", anno_pubb='" + anno_pubb + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object other) {
        return (this.getIsbn() == ((LibriBean) other).getIsbn());
    }
}
