package Unit.blackBox;

import control.servlet.DriverManagerConnectionPool;
import model.LibriBean;
import model.WishlistBean;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.FileNotFoundException;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class WishlistBB {

    static WishlistBean wishList = new WishlistBean();

    @BeforeEach
    public void setUpDb() throws FileNotFoundException, SQLException {
        DatabaseHelper.createDb();
    }

    @AfterEach
    public void closeDb() {
        DriverManagerConnectionPool.setTest(false);
    }

    @Test
    public void doInsertTest() throws SQLException {
        LibriBean libro = new LibriBean("978881715646523344634", "I promessi sposi", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);

        wishList.addItem(libro);
        assertTrue(wishList.getItems().size() == 1);
    }

    public void doDeleteTest() throws SQLException {
        LibriBean libro1 = new LibriBean("978881715646523344634", "I promessi sposi", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);

        LibriBean libro2 = new LibriBean("978881715646523344635", "Il", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);

        wishList.addItem(libro1);
        wishList.addItem(libro2);
        wishList.deleteItem(libro1);

        assertTrue(wishList.getItems().size() == 1);
    }


}
