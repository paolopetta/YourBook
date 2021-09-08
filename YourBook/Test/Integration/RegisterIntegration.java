package Integration;

import control.servlet.Register;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.mockito.Mockito.mock;

public class RegisterIntegration {

    static Register register = new Register();

    @Test
    public void registerTest() throws ServletException {
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        ServletConfig servletConfig = mock(ServletConfig.class);
        ServletContext servletContext = mock(ServletContext.class);
        register.init(servletConfig);
        Assertions.assertThrows(NumberFormatException.class, () -> register.doGet(hsr, hsres));
    }

}
