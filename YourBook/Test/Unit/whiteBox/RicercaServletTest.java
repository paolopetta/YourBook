package Unit.whiteBox;

import control.servlet.RicercaServlet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class RicercaServletTest {

    @Test
    public void doGet() throws ServletException, IOException {

        RicercaServlet lop = new RicercaServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            lop.doGet(hsr, hsres);
        } catch(IllegalStateException e){
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void findBook() throws ServletException, IOException {

        RicercaServlet lop = new RicercaServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("findBook");
        Exception ex = Assertions.assertThrows(RuntimeException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.RuntimeException", ex.getClass().getName());
    }

    @Test
    public void findBook2() throws ServletException, IOException {

        RicercaServlet lop = new RicercaServlet();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("findbook");
        try {
            lop.doGet(hsr, hsres);
        } catch(IllegalStateException e){
            Assertions.assertFalse(true);
        }
    }
}