package control.servlet;


import manager.LibroDao;
import model.LibriBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/RicercaServlet")
public class RicercaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static LibroDao model = new LibroDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        LibriBean find = (LibriBean) request.getSession().getAttribute("find");

        String action = request.getParameter("action");
    }
    {
        if(action != null){
            if(action.equals("findBook")){
                String titolo = request.getParameter("titolo");
                request.setAttribute("libriaction", model.doRetriveByAllFragment(titolo));
            } catch (SQLException e) {
                e.printStackTrace();
        }
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/findbook.jsp");
            dispatcher.forward(request, response);
     }

    }
