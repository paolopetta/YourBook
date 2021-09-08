package Integration;

import Unit.blackBox.DatabaseHelper;
import control.servlet.DriverManagerConnectionPool;
import control.servlet.WishlistServlet;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileNotFoundException;
import java.sql.SQLException;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class WishlistServletIntegration {

    static WishlistServlet wishlistServlet = new WishlistServlet();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void addBookTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(hsr.getParameter("action")).thenReturn("addBook");
        wishlistServlet.init(servletConfig);
        Assertions.assertThrows(NullPointerException.class, () -> wishlistServlet.doGet(hsr, hsres));
    }

    @Test
    public void clearWishlistTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(hsr.getParameter("action")).thenReturn("clearWishlist");
        wishlistServlet.init(servletConfig);
        Assertions.assertThrows(NullPointerException.class, () -> wishlistServlet.doGet(hsr, hsres));
    }

    @Test
    public void deleteBookTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(hsr.getParameter("action")).thenReturn("deleteBook");
        wishlistServlet.init(servletConfig);
        Assertions.assertThrows(NullPointerException.class, () -> wishlistServlet.doGet(hsr, hsres));
    }

}
