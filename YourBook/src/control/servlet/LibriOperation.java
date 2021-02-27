package control.servlet;

import manager.LibroDao;
import model.LibriBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Libri")
public class LibriOperation extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static LibroDao model = new LibroDao();

    public LibriOperation() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Mostrare tutti i libri
        try {
            request.setAttribute("libri", model.doRetriveAll());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        //System.out.println("Dentro UserOperation");

        if (action != null && action.equals("Insert")) {
            String isbn = request.getParameter("isbn");
            String titolo = request.getParameter("titolo");
            String autore = request.getParameter("autore");
            String casaEdit = request.getParameter("casaEditrice");
            String img = request.getParameter("immagine");
            String genere = request.getParameter("genere");
            Integer annoPub = Integer.valueOf(request.getParameter("anno_pub"));

            LibriBean bean = new LibriBean();
            bean.setIsbn(isbn);
            bean.setAutore(autore);
            bean.setTitolo(titolo);
            bean.setCasaEditrice(casaEdit);
            bean.setImmagine(img);
            bean.setGenere(genere);
            bean.setAnno_pubb(annoPub);

            try {
                model.doSave(bean);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            request.setAttribute("message", "Libro " + bean.getTitolo() + " aggiunto");
            response.sendRedirect(request.getContextPath() + "/libri.jsp");
        }

        if (action != null && action.equals("Delete")) {
            String isbn = request.getParameter("isbn");
            LibriBean libri = null;

            try {
                libri = model.doRetrieveByKey(isbn);
                model.doDelete(libri);
                throw new SQLException();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("message", "Prodotto " + libri.getTitolo() + " eliminato");
            response.sendRedirect(request.getContextPath() + "/libri.jsp");
        }
    }
}
