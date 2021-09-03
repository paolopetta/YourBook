package BlackBox;

import control.servlet.DriverManagerConnectionPool;
import manager.LibroDao;
import model.LibriBean;
import model.UtenteLibro;
import org.junit.jupiter.api.AfterEach;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.io.FileNotFoundException;
import java.sql.*;



public class LibroDaoBB {

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
    public void doRetriveAllTest() throws SQLException {
        //nel db di test sono 29 i libri
        assertTrue(libroDao.doRetriveAll().size() == 29);
    }

    @Test
    public void doRetrieveByKeyTest() throws SQLException{
        //devo vedere se mi restituisce il libro cercato
        assertTrue(libroDao.doRetrieveByKey("1552041778").getIsbn().compareTo("1552041778") == 0);
    }

    @Test
    public void doSaveTest() throws SQLException{
        //devo vedere se salva il libro
        LibriBean libro = new LibriBean("9788817156462", "I promessi sposi", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);
        libro.setCasaEditrice("provaCasa");
        libroDao.doSave(libro);
        assertTrue(libroDao.doRetrieveByKey("9788817156462").getIsbn().compareTo("9788817156462") == 0);
    }

    @Test
    public void doSaveNomeLungo() throws SQLException{
        LibriBean libro = new LibriBean("9788817156462", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna.", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);
        libro.setCasaEditrice("provaCasa");
        assertThrows(SQLException.class, () -> libroDao.doSave(libro));
    }

    @Test
    public void doSaveIdVuoto() throws SQLException{
        LibriBean libro = new LibriBean(null, "I promessi sposi", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);
        libro.setCasaEditrice("provaCasa");
        assertThrows(SQLException.class, () -> libroDao.doSave(libro));
    }

    @Test
    public void doSaveAutoreLungo() throws SQLException{
        LibriBean libro = new LibriBean("9788817156462", "I promessi sposi", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna.", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);
        libro.setCasaEditrice("provaCasa");
        assertThrows(SQLException.class, () -> libroDao.doSave(libro));
    }

    @Test
    public void doSaveGenereLungo() throws SQLException{
        LibriBean libro = new LibriBean(null, "I promessi sposi", "Alessandro Manzoni", "https://upload.wikimedia.org/wikipedia/commons/7/72/Frontispiece_promessi_sposi.jpg", 1827);
        libro.setCasaEditrice("provaCasa");
        libro.setGenere("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna.");
        assertThrows(SQLException.class, () -> libroDao.doSave(libro));
    }

    @Test
    public void doUpdateTestNomeLungo() throws SQLException{
        LibriBean libro= libroDao.doRetrieveByKey("195153448");
        libro.setTitolo("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. vehicula magna. Phasellus ac vehicula magna.");
        assertThrows(SQLException.class, () -> libroDao.doUpdate(libro));
    }

    @Test
    public void doUpdateTestAutoreLungo() throws SQLException{
        LibriBean libro= libroDao.doRetrieveByKey("195153448");
        libro.setAutore("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. vehicula magna. Phasellus ac vehicula magna.");
        assertThrows(SQLException.class, () -> libroDao.doUpdate(libro));
    }

    @Test
    public void doUpdateTestGenereLungo() throws SQLException{
        LibriBean libro= libroDao.doRetrieveByKey("195153448");
        libro.setGenere("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In un ultricies nisl. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. Aliquam a tristique turpis. Phasellus ac vehicula magna. Phasellus ac vehicula magna. vehicula magna. Phasellus ac vehicula magna.");
        assertThrows(SQLException.class, () -> libroDao.doUpdate(libro));
    }

    @Test
    public void doUpdateTestValid() throws SQLException{
        //gli passo un libro giá presente con l'autore modificato e verifico se lo ha modificato
        LibriBean libro= libroDao.doRetrieveByKey("195153448");
        libro.setAutore("Prova");
        libroDao.doUpdate(libro);
        assertTrue(libroDao.doRetrieveByKey("195153448").getAutore().compareTo("Prova") == 0);
    }

    /*@Test
    public void doDeleteTestID() throws Exception{
        assertThrows(Exception.class, () -> libroDao.doDelete(libro));
    }*/

    @Test
    public void doDeleteTest() throws SQLException{
        //Prima erano 29 libri controllo che venga cancellato e ne siano 28
        LibriBean libro= libroDao.doRetrieveByKey("195153448");
        libroDao.doDelete(libro);
        assertTrue(libroDao.doRetriveAll().size() == 28);
    }

    @Test
    public void doSaveRatingTest() throws SQLException{
        //Devo verificare che salvi la recensione, inizialmente ne abbiamo 0
        UtenteLibro rating= new UtenteLibro("195153448", 1, 3);
        libroDao.doSaveRating(rating);
        assertTrue(libroDao.doRetriveAllRating().size() == 1);
    }

    @Test
    public void doRetriveAllRating() throws SQLException{
        //Devo verificare che restituisca tutte le recensioni
        UtenteLibro rating= new UtenteLibro("195153448", 1, 3);
        libroDao.doSaveRating(rating);
        assertTrue(libroDao.doRetriveAllRating().size() == 1);

    }
}
