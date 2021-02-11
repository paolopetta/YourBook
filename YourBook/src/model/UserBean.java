package model;

import java.io.Serializable;

public class UserBean implements Serializable, Cloneable {

    private static final long serialVersionUID = 1L;

    private int id_utente;
    private String email;
    private String nome;
    private String nazionalita;
    private Boolean auth;

    public UserBean(int id_utente, String email, String nome, String nazionalita, Boolean auth) {
        this.id_utente = id_utente;
        this.email = email;
        this.nome = nome;
        this.nazionalita = nazionalita;
        this.auth = auth;
    }

    public int getId_utente() {
        return id_utente;
    }

    public void setId_utente(int id_utente) {
        this.id_utente = id_utente;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNazionalita() {
        return nazionalita;
    }

    public void setNazionalita(String nazionalita) {
        this.nazionalita = nazionalita;
    }

    public Boolean getAuth() {
        return auth;
    }

    public void setAuth(Boolean auth) {
        this.auth = auth;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "id_utente=" + id_utente +
                ", email='" + email + '\'' +
                ", nome='" + nome + '\'' +
                ", nazionalita='" + nazionalita + '\'' +
                ", auth=" + auth +
                '}';
    }

    @Override
    public boolean equals(Object otherObj){
        if(otherObj == null || otherObj.getClass() != getClass())
            return false;
        UserBean other = (UserBean) otherObj;
        return other.id_utente == id_utente;
    }
}
