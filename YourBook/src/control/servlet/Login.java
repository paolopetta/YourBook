package control.servlet;

import model.UserBean;
import manager.UtenteDao;
import model.WishlistBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserBean userBean = (UserBean) session.getAttribute("utente");
        WishlistBean wishlist = (WishlistBean) session.getAttribute("wishlist");

        if (action.equals("login")) {
            if (userBean == null) { // non c'é nessun utente loggato
                String email = request.getParameter("email");
                String password = request.getParameter("pwd");

                UserBean userRequested = null; //creo un nuovo userBean

                try {
                    userRequested = UtenteDao.doRetrieveByEmail(email);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                //assegno al nuovo bean tutti i campi
                if (userRequested != null) {
                    MessageDigest digest = null;

                    try {
                        digest = MessageDigest.getInstance("SHA-1");
                    } catch (NoSuchAlgorithmException e) {
                        e.printStackTrace();
                    }

                    digest.reset();
                    digest.update(password.getBytes(StandardCharsets.UTF_8));
                    String passHash = String.format("%040x", new BigInteger(1, digest.digest()));

                    if (userRequested.getPassword().equals(passHash)) {
                        userBean = new UserBean();
                        userBean.setAuth(userRequested.isAdmin());
                        userBean.setNome(userRequested.getNome());
                        userBean.setId_utente(userRequested.getId_utente());
                        userBean.setEta(userRequested.getId_utente());
                        userBean.setEmail(userRequested.getEmail());
                        userBean.setPasswordhash(userRequested.getPassword());

                        //assegno l'user alla sessione
                        session.setAttribute("utente", userBean);

                    } else { //passw sbagliata
                        RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
                        request.setAttribute("error", "password");
                        requestDispatcher.forward(request, response);
                    }

                } else { // utente non esiste
                    RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
                    request.setAttribute("error", "notfound");
                    requestDispatcher.forward(request, response);
                }
            }

            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index.jsp"));

        } else if (action.equals("logout")) {
            if (userBean != null) {
                session.removeAttribute("utente");
            }
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index.jsp"));
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserBean userBean = (UserBean) session.getAttribute("utente");

        if (action.equals("logout")) {

            if (userBean != null) {
                session.removeAttribute("utente");
            }

            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index.jsp"));
        }
    }
}
