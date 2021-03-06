package control.admin;

import manager.UtenteDao;
import model.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserManagement")
public class UserOperationAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static UtenteDao model = new UtenteDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action != null && action.equals("insertUser")) {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String nazionalita = request.getParameter("nazionalita");
            int anni = Integer.parseInt(request.getParameter("eta"));

            UserBean bean = new UserBean();
            bean.setEmail(email);
            bean.setNome(nome);
            bean.setNazionalita(nazionalita);
            bean.setEta(anni);

            try {
                model.doSave(bean);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/Admin/userManagement.jsp");

        }

        if (action != null && action.equals("deleteUser")) {
            //Elimina utente
        }

        if (action != null && action.equals("modifyUser")) {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String nazionalita = request.getParameter("nazionalita");
            int anni = Integer.parseInt(request.getParameter("eta"));
            int id_utente = Integer.parseInt(request.getParameter("id_utente"));

            UserBean bean = new UserBean();
            bean.setEmail(email);
            bean.setNome(nome);
            bean.setNazionalita(nazionalita);
            bean.setEta(anni);
            bean.setId_utente(id_utente);

            try {
                model.doUpdate(bean);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/Admin/userManagement.jsp");

        }

        if (action != null && action.equals("retrieveAll")) {
            try {
                request.setAttribute("utenti", model.doRetrieveAll());
            } catch (SQLException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Admin/userManagement.jsp");
            dispatcher.forward(request, response);
        }

    }
}
