package control.servlet;

import manager.LibroDao;
import model.LibriBean;
import model.WishlistBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static LibroDao model = new LibroDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        WishlistBean wishlist = null;
        try {
            wishlist = (WishlistBean) request.getSession().getAttribute("wishlist");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        //}}//chiusura temporanea per prova
        if (wishlist == null) {
            wishlist = new WishlistBean();
            request.getSession().setAttribute("wishlist", wishlist);
        } else {
            System.out.println();
        }

        String action = request.getParameter("action");

        try {
            if (action != null) {
                if (action.equals("addBook")) {
                    String id = request.getParameter("id");
                    LibriBean bean = model.doRetrieveByKey(id);
                    if (bean != null && !bean.isEmpty()) {
                        if (wishlist.alReadyIn(bean)) {
                        } else
                            wishlist.addItem(bean);
                        request.setAttribute("message", "Product " + bean.getTitolo() + " added to Wishlist");
                    }
                } else if (action.equals("clearWishlist")) {
                    wishlist.deleteAll();
                    System.out.println("svuota");
                    request.setAttribute("message", "wishlist cleaned");
                } else if (action.equals("deleteBook")) {
                    String id = request.getParameter("id");
                    LibriBean bean = model.doRetrieveByKey(id);
                    if (bean != null && !bean.isEmpty()) {
                        wishlist.deleteItem(bean);
                        request.setAttribute("message", "Product " + bean.getTitolo() + " deleted from Wishlist");
                    } else {
                        System.out.println();
                    }
                } else {
                    System.out.println();
                }
            } else {
                System.out.println();
            }

        } catch (NumberFormatException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        session.setAttribute("wishlistTemp", wishlist);
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myWishList.jsp"));

    }
}
