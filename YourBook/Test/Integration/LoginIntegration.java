package Integration;

import Unit.blackBox.DatabaseHelper;
import control.servlet.DriverManagerConnectionPool;
import control.servlet.Login;
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

public class LoginIntegration {

    static Login login = new Login();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void loginTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        login.init(servletConfig);
        when(hsr.getParameter("action")).thenReturn("login");
        Assertions.assertDoesNotThrow(() -> login.doGet(hsr, hsres));
    }

    @Test
    public void logoutTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        login.init(servletConfig);
        when(hsr.getParameter("action")).thenReturn("logout");
        Assertions.assertDoesNotThrow(() -> login.doGet(hsr, hsres));
    }

}
