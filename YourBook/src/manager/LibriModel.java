package manager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface LibriModel<T> {

    public T doRetriveByKey(String isbn) throws SQLException;

    public Collection<T> doRetriveAll() throws SQLException;

    public void doSave(T libro) throws SQLException;

    public void doUpdate(T libro) throws SQLException;

    public void doDelete(T libro) throws SQLException;

}
