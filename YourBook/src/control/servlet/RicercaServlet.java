package control.servlet;


import manager.LibroDao;
import model.LibriBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/RicercaServlet")
public class RicercaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static LibroDao model = new LibroDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try{
            LibriBean find = (LibriBean) request.getSession().getAttribute("find");
        }catch(NullPointerException e) {
            e.printStackTrace();
         }

        String action = request.getParameter("action");
        System.out.println(action);

        if (action != null) {
            if (action.equals("findBook")) {
                try {
                    String titolo = request.getParameter("titolo");
                    request.setAttribute("ricerca", model.doRetriveByAllFragment(titolo));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/findbook.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println();
            }
        } else {
            System.out.println();
        }
    }
}

