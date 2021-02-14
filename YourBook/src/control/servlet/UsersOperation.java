package control.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import model.UserBean;
import manager.UtenteDao;

@WebServlet("/UserOperation")
public class UsersOperation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        //System.out.println("Dentro UserOperation");

        if (action != null && action.equals("Insert")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String pwd = request.getParameter("pws");
            String naz = request.getParameter("nazionalita");

            UserBean bean = new UserBean();
            bean.setNome(nome);
            bean.setEmail(email);
            bean.setPasswordhash(pwd);
            bean.setNazionalita(naz);
//MODIFICHE DA FARE
            try {
                model.doSave(bean);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            request.setAttribute("message", "Utente " + bean.getNome() + " aggiunto");
            response.sendRedirect(request.getContextPath() + "/utente");
        }

        if (action != null && action.equals("Delete")) {
            String email = request.getParameter("email");

            UserBean user = null;

            try {
                user = model.doRetrieveByKey(email);
                if (email.contains()) {
                    model.doDelete(user, "pneumatici");
                    model.doDelete(user, "prodotto");
                } throw new SQLException();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("message", "Prodotto " + user.getNome() + " eliminato");
            response.sendRedirect(request.getContextPath() + "/utenti");
        }
    }
}
