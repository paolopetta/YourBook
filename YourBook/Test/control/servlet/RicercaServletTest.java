package control.servlet;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class RicercaServletTest {

    @Test
    public void doGet() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            lop.doGet(hsr, hsres);
        } catch(IllegalStateException e){
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void findbook() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("findbook");
        Exception ex = Assertions.assertThrows(NullPointerException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }
}