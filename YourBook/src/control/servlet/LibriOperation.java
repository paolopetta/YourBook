package control.servlet;

import manager.LibroDao;
import model.LibriBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/Libri")
public class LibriOperation extends HttpServlet {

    private static final long serialVersionUID = 1L;

    static LibroDao model = new LibroDao();

    public LibriOperation(){super();}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("libri", model.doRetriveAll());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/libri.jsp");
        dispatcher.forward(request, response);

    }



}
