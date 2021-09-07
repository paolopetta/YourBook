package control.servlet;

import model.WishlistBean;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class WishlistServletTest {

    @Test
    public void doGet() throws ServletException, IOException {

        WishlistServlet lop = new WishlistServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession ses = mock(HttpSession.class);
        WishlistBean bean = new WishlistBean();
        ses.setAttribute("wishlist", bean);
        when(hsr.getSession()).thenReturn(ses);
        try {
            lop.doGet(hsr, hsres);
        } catch (IllegalStateException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void doGetAction() throws ServletException, IOException {

        WishlistServlet lop = new WishlistServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("action");
        HttpSession ses = mock(HttpSession.class);
        WishlistBean bean = new WishlistBean();
        ses.setAttribute("wishlist", bean);
        when(hsr.getSession()).thenReturn(ses);
        try {
            lop.doGet(hsr, hsres);
        } catch (IllegalStateException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void doGetAddBook() throws ServletException, IOException {

        WishlistServlet lop = new WishlistServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("addBook");
        HttpSession ses = mock(HttpSession.class);
        WishlistBean bean = new WishlistBean();
        ses.setAttribute("wishlist", bean);
        when(hsr.getSession()).thenReturn(ses);
        try {
            lop.doGet(hsr, hsres);
        } catch (IllegalStateException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void doGetAddBook2() throws ServletException, IOException {

        WishlistServlet lop = new WishlistServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("clearWishlist");
        HttpSession ses = mock(HttpSession.class);
        WishlistBean bean = new WishlistBean();
        ses.setAttribute("wishlist", bean);
        when(hsr.getSession()).thenReturn(ses);
        try {
            lop.doGet(hsr, hsres);
        } catch (IllegalStateException e) {
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void doGetDelete() throws ServletException, IOException {

        WishlistServlet lop = new WishlistServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("deleteBook");
        HttpSession ses = mock(HttpSession.class);
        WishlistBean bean = new WishlistBean();
        ses.setAttribute("wishlist", bean);
        when(hsr.getSession()).thenReturn(ses);
        try {
            lop.doGet(hsr, hsres);
        } catch (IllegalStateException e) {
            Assertions.assertFalse(true);
        }
    }
}