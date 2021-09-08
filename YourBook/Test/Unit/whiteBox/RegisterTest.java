package Unit.whiteBox;

import control.servlet.Register;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class RegisterTest {

    @Test
    void doGet() throws ServletException, IOException {

            Register reg = new Register();
            HttpSession ses = mock(HttpSession.class);
            HttpServletRequest hsr = mock(HttpServletRequest.class);
            HttpServletResponse hsres = mock(HttpServletResponse.class);
            when(hsr.getParameter("nome")).thenReturn("Riccardo");
            when(hsr.getParameter("eta")).thenReturn("21");
            when(hsr.getParameter("nazionalita")).thenReturn("Italia");
            Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
                reg.doGet(hsr, hsres);
            });
            Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
        }

    @Test
    void doGet2() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Ri");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet3() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("1Ri");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet4() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet5() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet6() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("riccardo");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet7() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("RICCARDO");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet8() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("ricc");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet9() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet10() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        when(hsr.getParameter("pwdConf")).thenReturn("Riccardo1");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet11() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        when(hsr.getParameter("pwdConf")).thenReturn("Riccardo");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet12() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        when(hsr.getParameter("pwdConf")).thenReturn("Riccardo1");
        when(hsr.getParameter("email")).thenReturn("riccardoamaro@gmail.com");
        Exception ex = Assertions.assertThrows(java.lang.NullPointerException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("java.lang.NullPointerException", ex.getClass().getName());
    }

    @Test
    void doGet13() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        when(hsr.getParameter("pwdConf")).thenReturn("Riccardo1");
        when(hsr.getParameter("email")).thenReturn("riccardoamaro.gmail.com");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }

    @Test
    void doGet14() throws ServletException, IOException {

        Register reg = new Register();
        HttpSession ses = mock(HttpSession.class);
        HttpServletRequest hsr = mock(HttpServletRequest.class);
        HttpServletResponse hsres = mock(HttpServletResponse.class);
        when(hsr.getParameter("nome")).thenReturn("Riccardo");
        when(hsr.getParameter("eta")).thenReturn("21");
        when(hsr.getParameter("nazionalita")).thenReturn("Italia");
        when(hsr.getParameter("pwd")).thenReturn("Riccardo1");
        when(hsr.getParameter("pwdConf")).thenReturn("Riccardo1");
        Exception ex = Assertions.assertThrows(exception.IllegalArgumentException.class, () -> {
            reg.doGet(hsr, hsres);
        });
        Assertions.assertEquals("exception.IllegalArgumentException", ex.getClass().getName());
    }
    }