package control.servlet;

import model.UserBean;
import model.WishlistBean;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class LoginTest {

    @Test
    void doPost() throws ServletException, IOException {

        Login log = new Login();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("login");
        when(ses.getAttribute("wishlist")).thenReturn(new WishlistBean());
        Exception ex = Assertions.assertThrows(NullPointerException.class, () -> {
            log.doPost(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }

    @Test
    void doPost2() throws ServletException, IOException {

        Login log = new Login();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("logout");
        when(ses.getAttribute("utente")).thenReturn(new UserBean());
        try {
            log.doPost(hsr, hsres);
        } catch (NullPointerException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    void doPost3() throws ServletException, IOException {

        Login log = new Login();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("login");
        when(ses.getAttribute("utente")).thenReturn(new UserBean());
        Exception ex = Assertions.assertThrows(NullPointerException.class, () -> {
            log.doPost(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }

    @Test
    void doGet() throws ServletException, IOException {

        Login log = new Login();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("logout");
        when(ses.getAttribute("wishlist")).thenReturn(new WishlistBean());
        try {
            log.doGet(hsr, hsres);
        } catch (NullPointerException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    void doGet2() throws ServletException, IOException {

        Login log = new Login();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("error");
        when(ses.getAttribute("wishlist")).thenReturn(new WishlistBean());
        try {
            log.doGet(hsr, hsres);
        } catch (NullPointerException e) {
            Assertions.assertFalse(false);
        }
    }
}
