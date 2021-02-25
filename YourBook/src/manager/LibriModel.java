package manager;

import model.LibriBean;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface LibriModel<T> {

<<<<<<< Updated upstream
    public T doRetrieveByKey(String isbn) throws SQLException;
=======
    public Collection<LibriBean> doRetriveByAllFragment(String isbn, String titolo, String autore, String immagine, String genere, String anno_pubb) throws SQLException;

    public T doRetriveByKey(String isbn) throws SQLException;
>>>>>>> Stashed changes

    public Collection<T> doRetriveAll() throws SQLException;

    public void doSave(T libro) throws SQLException;

    public void doUpdate(T libro) throws SQLException;

    public void doDelete(T libro) throws SQLException;

}
