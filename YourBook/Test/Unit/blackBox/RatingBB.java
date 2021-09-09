package Unit.blackBox;

import control.servlet.DriverManagerConnectionPool;
import manager.LibroDao;
import model.LibriBean;
import model.UtenteLibro;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.FileNotFoundException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class RatingBB {

    static LibroDao libroDao = new LibroDao();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void addRatingTest() throws SQLException {
        //LibriBean libro = new LibriBean("345417623", 'TImeline', 'MICHAEL CRICHTON',);


        UtenteLibro utenteLibro = new UtenteLibro("345417623", 1, 2);

        libroDao.doSaveRating(utenteLibro);

        assertTrue(libroDao.doRetriveAllRating().size() == 1);
    }
}
