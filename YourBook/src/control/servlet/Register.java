package control.servlet;

import model.UserBean;
import exception.IllegalArgumentException;
import manager.UtenteDao;

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("utente") != null)
            throw new IllegalArgumentException("Utente loggato.");

        Integer eta = Integer.parseInt(request.getParameter("eta"));
        String nazionalita = request.getParameter("nazionalita");

        String nome = request.getParameter("nome");
        if (!(nome != null && nome.length() >= 3 && nome.matches("^[0-9a-zA-Z]+$"))) {
            throw new IllegalArgumentException("Nome non valido.");
        }

        String password = request.getParameter("pwd");
        if (!(password != null && password.length() >= 8 && !password.toUpperCase().equals(password)
                && !password.toLowerCase().equals(password) && password.matches(".*[0-9].*"))) {
            throw new IllegalArgumentException("Password non valida.");
        }

        String passwordConferma = request.getParameter("pwdConf");
        if (!password.equals(passwordConferma)) {
            throw new IllegalArgumentException("Password e conferma differenti.");
        }

        String email = request.getParameter("email");
        if (!(email != null && email.matches("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w+)+$"))) {
            throw new IllegalArgumentException("Email non valida.");
        }

        UserBean utente = new UserBean();
        utente.setPasswordhash(password);
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

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Message.jsp");
        requestDispatcher.forward(request, response);
    }
}
