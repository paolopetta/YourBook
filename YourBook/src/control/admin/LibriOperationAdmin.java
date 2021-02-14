package control.admin;

import manager.LibroDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LibriManagement")
public class LibriOperationAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static LibroDao model = new LibroDao();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if(action != null && action.equals("insertBook")){
            //Assegna i campi dei libri
        }

        if(action != null && action.equals("deleteBook")){
            //elimina il libro
        }

        if(action != null && action.equals("modifyBook")){
            //modifica il libro
        }

        try {
            request.setAttribute("libri", model.doRetriveAll());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Admin/libriManagement.jsp");
        dispatcher.forward(request, response);

    }

}
