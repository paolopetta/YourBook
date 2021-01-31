package control.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LibriManagement")
public class LibriOperationAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //static LibriModelDM model = new LibriModelDM();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
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

    }

}
