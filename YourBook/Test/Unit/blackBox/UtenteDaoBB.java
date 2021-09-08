package Unit.blackBox;

import control.servlet.DriverManagerConnectionPool;
import manager.UtenteDao;
import model.UserBean;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.io.FileNotFoundException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class UtenteDaoBB {

    static UtenteDao utenteDao = new UtenteDao();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void doRetrieveByEmailTest() throws SQLException{
        //devo vedere se mi restituisce l'utente cercato
        assertTrue(utenteDao.doRetrieveByEmail("Franco@gmail.com").getEmail().compareTo("Franco@gmail.com") == 0);
    }



    @Test
    public void doSaveTest() throws SQLException{
        //devo vedere se salva l'utente
        UserBean utente = new UserBean(1, "prova@prova.it", "prova", 18, "Italia", false);
        utente.setPassword("prova"); //obbligatoria
        utenteDao.doSave(utente);
        assertTrue(utenteDao.doRetrieveByEmail("prova@prova.it").getEmail().compareTo("prova@prova.it") == 0);
    }

    @Test
    public void doDeleteTest() throws SQLException{
        //Prima erano 30 utenti e controllo che venga cancellato per poi diventarne 29
        UserBean utente= utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utenteDao.doDelete(utente);
        assertTrue(utenteDao.doRetrieveAll().size() == 29);
    }

    @Test
    public void doUpdateTestEmailVuota() throws SQLException{
        UserBean utente = utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utente.setEmail(null);
        assertThrows(SQLException.class, () -> utenteDao.doUpdate(utente));
    }

    @Test
    public void doUpdateTestPswVuota() throws SQLException{
        UserBean utente = utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utente.setPassword(null);
        assertThrows(SQLException.class, () -> utenteDao.doUpdate(utente));
    }

    @Test
    public void doUpdateTestPswNoFormat() throws SQLException{
        UserBean utente = utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utente.setPassword("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. vehicula magna. Phasellus ac vehicula magna.");
        assertThrows(SQLException.class, () -> utenteDao.doUpdate(utente));
    }

    @Test
    public void doUpdateTestNomeVuoto() throws SQLException{
        UserBean utente = utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utente.setNome(null);
        assertThrows(SQLException.class, () -> utenteDao.doUpdate(utente));
    }

    @Test
    public void doUpdateTest() throws SQLException{
        //gli passo un utente giá presente con il nome modificato e verifico se lo ha modificato
        UserBean utente= utenteDao.doRetrieveByEmail("Franco@gmail.com");
        utente.setNome("Prova");
        utenteDao.doUpdate(utente);
        assertTrue(utenteDao.doRetrieveByEmail("Franco@gmail.com").getNome().compareTo("Prova") == 0);
    }

    @Test
    public void doRetriveAllTest() throws SQLException{
        //nel db di test sono 30 gli utenti
        assertTrue(utenteDao.doRetrieveAll().size() == 30);
    }

}
