package Integration;

import Unit.blackBox.DatabaseHelper;
import com.mysql.cj.Session;
import control.servlet.DriverManagerConnectionPool;
import control.servlet.LibriOperation;
import manager.LibroDao;
import model.UserBean;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class LibriOperationIntegration {

    static LibriOperation libriOperation = new LibriOperation();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void retrieveAllTest() throws ServletException, IOException {
        //devo testare se vengono prelevati tutti i libri
        //Ci aspettiamo che venga lanciata una NullPointerException per il dispatcher
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        when(hsr.getServletContext()).thenReturn(servletContext);
        libriOperation.init(servletConfig);
        when(hsr.getSession()).thenReturn(session);
        when(hsr.getParameter("action")).thenReturn("retrieveAll");
        Assertions.assertThrows(NullPointerException.class, () -> libriOperation.doGet(hsr, hsres));
    }

    @Test
    public void retrieveInsTest() throws ServletException, IOException {
        //devo testare se vengono prelevati tutti i libri
        //Ci aspettiamo che venga lanciata una NullPointerException
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        when(hsr.getServletContext()).thenReturn(servletContext);
        libriOperation.init(servletConfig);
        when(hsr.getSession()).thenReturn(session);
        when(hsr.getParameter("action")).thenReturn("retrieveIns");
        Assertions.assertThrows(NullPointerException.class, () -> libriOperation.doGet(hsr, hsres));
    }

    @Test
    public void InsertTest() throws ServletException, IOException {
        //devo testare se vengono prelevati tutti i libri
        //Ci aspettiamo che venga lanciata una NullPointerException
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        when(hsr.getServletContext()).thenReturn(servletContext);
        libriOperation.init(servletConfig);
        when(hsr.getSession()).thenReturn(session);
        when(hsr.getParameter("action")).thenReturn("Insert");
        Assertions.assertThrows(NumberFormatException.class, () -> libriOperation.doGet(hsr, hsres));
    }

    @Test
    public void DeleteTest() throws ServletException, IOException {
        //devo testare se vengono prelevati tutti i libri
        //Ci aspettiamo che venga lanciata una NullPointerException
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        when(hsr.getServletContext()).thenReturn(servletContext);
        libriOperation.init(servletConfig);
        when(hsr.getSession()).thenReturn(session);
        when(hsr.getParameter("action")).thenReturn("Delete");
        Assertions.assertDoesNotThrow(() -> libriOperation.doGet(hsr, hsres));
    }

    @Test
    public void InsRatingTest() throws ServletException, IOException {
        //devo testare se vengono prelevati tutti i libri
        //Ci aspettiamo che venga lanciata una NullPointerException
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        ServletContext servletContext = mock(ServletContext.class);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        when(hsr.getServletContext()).thenReturn(servletContext);
        libriOperation.init(servletConfig);
        when(hsr.getSession()).thenReturn(session);
        when(hsr.getParameter("action")).thenReturn("insRating");
        Assertions.assertThrows(NumberFormatException.class, () -> libriOperation.doGet(hsr, hsres));
    }


}
