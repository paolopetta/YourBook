package control.servlet;

import org.junit.jupiter.api.Test;
import org.mockito.configuration.IMockitoConfiguration;
import static org.mockito.Mockito.*;
import org.junit.jupiter.api.Assertions;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.sql.SQLException;

public class LibriOperationTest {

    @Test
    public void doGet() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("retrieveAll");
        Exception ex = Assertions.assertThrows(IllegalStateException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.IllegalStateException", ex.getClass().getName());
    }
    @Test
    public void doGet2() throws ServletException, IOException {

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
    public void retrieveIns() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("retrieveIns");
        Exception ex = Assertions.assertThrows(IllegalStateException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.IllegalStateException", ex.getClass().getName());
    }

    @Test
    public void insert() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("Insert");
        Exception ex = Assertions.assertThrows(NumberFormatException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NumberFormatException", ex.getClass().getName());
    }

    @Test
    public void delete() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("Delete");
        Exception ex = Assertions.assertThrows(NullPointerException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }
    @Test
    public void delete2() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            lop.doGet(hsr, hsres);
        } catch(NullPointerException e){
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void insRating() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("insRating");
        Exception ex = Assertions.assertThrows(NumberFormatException.class, () -> {
            lop.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NumberFormatException", ex.getClass().getName());
    }

    @Test
    public void insRating2() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        try {
            lop.doGet(hsr, hsres);
        } catch(NumberFormatException e){
            Assertions.assertFalse(true);
        }
    }

    @Test
    public void insRating3() throws ServletException, IOException {

        LibriOperation lop = new LibriOperation();
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("action")).thenReturn("insrating");
        try {
            lop.doGet(hsr, hsres);
        } catch(NumberFormatException e){
            Assertions.assertFalse(true);
        }
    }
}

