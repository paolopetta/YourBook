package control.servlet;

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

class UsersOperationTest {

    @Test
    void doGet() throws ServletException, IOException {

            UsersOperation usp = new UsersOperation();
            HttpSession ses = mock(HttpSession.class);
            HttpServletRequest hsr = mock(HttpServletRequest.class);
            HttpServletResponse hsres = mock(HttpServletResponse.class);
            when(hsr.getParameter("action")).thenReturn("Insert");
            Exception ex = Assertions.assertThrows(java.lang.NullPointerException.class, () -> {
                usp.doGet(hsr, hsres);
            });
            Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
        }

    @Test
    void doGet2() throws ServletException, IOException {

        UsersOperation usp = new UsersOperation();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            usp.doGet(hsr, hsres);
        } catch(NullPointerException e){
            Assertions.assertFalse(true);
        }
    }

    @Test
    void doGet3() throws ServletException, IOException {

        UsersOperation usp = new UsersOperation();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("Delete");
        Exception ex = Assertions.assertThrows(java.lang.NullPointerException.class, () -> {
            usp.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }

    @Test
    void doGet4() throws ServletException, IOException {

        UsersOperation usp = new UsersOperation();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            usp.doGet(hsr, hsres);
        } catch(NullPointerException e){
            Assertions.assertFalse(true);
        }
    }
}