package control.servlet;

import model.UserBean;
import manager.UtenteDao;
import exception.IllegalArgumentException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")

public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UtenteDao utenteDAO = new UtenteDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("utente") != null)
                throw new IllegalArgumentException("Utente loggato.");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        Integer eta = Integer.parseInt(request.getParameter("eta"));
        String nazionalita = request.getParameter("nazionalita");

        String nome = request.getParameter("nome");
        if (!(nome != null && nome.length() >= 3 && nome.matches("^[ a-zA-Z\\u00C0-\\u00ff]+$"))) {
            throw new IllegalArgumentException("Nome non valido.");
        } else {
            System.out.println();
        }

        String password = request.getParameter("pwd");
        if (!(password != null && password.length() >= 8 && !password.toUpperCase().equals(password)
                && !password.toLowerCase().equals(password))) {
            throw new IllegalArgumentException("Password non valida.");
        } else {
            System.out.println();
        }

        String passwordConferma = request.getParameter("pwdConf");
        if (!password.equals(passwordConferma)) {
            throw new IllegalArgumentException("Password e conferma differenti.");
        } else {
            System.out.println();
        }

        String email = request.getParameter("email");
        if (!(email != null && email.matches("^\\w+([\\.-]?\\w+)@\\w+([\\.-]?\\w+)(\\.\\w+)+$"))) {
            throw new IllegalArgumentException("Email non valida.");
        } else {
            System.out.println();
        }

        UserBean utente = new UserBean();
        utente.setPassword(password);
        utente.setNome(nome);
        utente.setEmail(email);
        utente.setNazionalita(nazionalita);
        utente.setEta(eta);

        try {
            utenteDAO.doSavePar(utente);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        request.getSession().setAttribute("utente", utente);

        request.setAttribute("message", "Registrazione effettuata con successo.");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
        requestDispatcher.forward(request, response);
    }
}
