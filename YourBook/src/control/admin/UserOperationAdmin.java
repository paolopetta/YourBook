package control.admin;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UserManagement")
public class UserOperationAdmin {
    private static final long serialVersionUID = 1L;
    //static User model = new User(); //Da rivedere

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if(action != null && action.equals("insertUser")){
            //Aggiungi utente
        }

        if(action != null && action.equals("deleteUser")){
            //Elimina utente
        }

        if(action != null && action.equals("modifyUser")){
            //Modifica utente
        }

    }

}
