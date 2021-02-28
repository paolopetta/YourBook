package control.admin;

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
            String titolo= request.getParameter("titolo");
            String isbn= request.getParameter("isbn");
            String autore= request.getParameter("autore");
            int anno= Integer.parseInt(request.getParameter("anno"));
            String pubblicazione= request.getParameter("pubblicazione");
            String immagine= request.getParameter("immagine");

            LibriBean bean= new LibriBean();
            bean.setTitolo(titolo);
            bean.setIsbn(isbn);
            bean.setAutore(autore);
            bean.setAnno_pubb(anno);
            bean.setCasaEditrice(pubblicazione);
            bean.setImmagine(immagine);

            try{
                model.doSave(bean);
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
            response.sendRedirect(request.getContextPath()+"/Admin/libriManagement.jsp");

        }

        if(action != null && action.equals("deleteBook")){
            String isbn = request.getParameter("isbn");
            LibriBean libro= null;
            try {
                libro = model.doRetrieveByKey(isbn);
                model.doDelete(libro);

            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("message", "Prodotto "+ libro.getTitolo()+" Eliminato");
            response.sendRedirect(request.getContextPath()+"/Admin/libriManagement.jsp");
        }

        if(action != null && action.equals("modifyBook")){
            String titolo= request.getParameter("titolo");
            String isbn= request.getParameter("isbn");
            String autore= request.getParameter("autore");
            int anno= Integer.parseInt(request.getParameter("anno"));
            String pubblicazione= request.getParameter("pubblicazione");
            String immagine= request.getParameter("immagine");

            LibriBean bean= new LibriBean();
            bean.setTitolo(titolo);
            bean.setIsbn(isbn);
            bean.setAutore(autore);
            bean.setAnno_pubb(anno);
            bean.setCasaEditrice(pubblicazione);
            bean.setImmagine(immagine);

            try{
                model.doUpdate(bean);
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
            response.sendRedirect(request.getContextPath()+"/Admin/libriManagement.jsp");
        }

        if(action != null && action.equals("retrieveAll")) {
            try {
                request.setAttribute("libri", model.doRetriveAll());
            } catch (SQLException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Admin/libriManagement.jsp");
            dispatcher.forward(request, response);
        }



    }

}
