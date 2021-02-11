package control.servlet;


import model.WishlistBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@WebServlet("/WishlistServlet")
public class WishlistServlet {
    private static final long serialVersionUID = 1L;

    static ProductModelDM model = new ProductModelDM();

    public WishlistServlet{ super();}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        @SuppressWarnings("unchecked")
        HttpSession session = request.getSession();
        WishlistBean wishlist = (WishlistBean) request.getSession().getAttribute("wishlist");

        if(wishlist == null){
            wishlist= new WishlistBean();
            request.getSession().setAttribute("wishlist", wishlist);
        }

        try {
            if(action != null) {
                if(action.equals("addBook")) {
                    String id = request.getParameter("id");
                    ProductBean bean = model.doRetrieveByKey(id);
                    if(bean != null && !bean.isEmpty()) {
                        if(cart.alReadyIn(bean)) {
                            cart.incrementItem(bean);
                        }
                        else
                            cart.addItem(bean);
                        request.setAttribute("message", "Product "+ bean.getNome()+" added to cart");
                    }
                } else if(action.equals("clearWishlist")) {
                    cart.deleteItems();
                    request.setAttribute("message", "Cart cleaned");
                } else if(action.equals("deleteWishlist")) {
                    String id = request.getParameter("id");
                    ProductBean bean = model.doRetrieveByKey(id);
                    if(bean != null && !bean.isEmpty()) {
                        cart.deleteItem(bean);
                        request.setAttribute("message", "Product "+ bean.getNome()+" deleted from cart");
                    }
                }
            }
        } catch(NumberFormatException | SQLException e) {
            System.out.println("Error: "+ e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        session.setAttribute("cart", cart);

    }
}
