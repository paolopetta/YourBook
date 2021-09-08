package Unit.blackBox;

import control.servlet.DriverManagerConnectionPool;
import manager.LibroDao;
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
        UtenteLibro utenteLibro = new UtenteLibro("195153448", '1', '2');

        assertTrue(libroDao.doRetriveAllRating().size() == 1);
    }
}
