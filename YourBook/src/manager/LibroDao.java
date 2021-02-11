package manager;

import control.servlet.DriverManagerConnectionPool;
import model.LibriBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class LibroDao implements LibriModel<LibriBean>{
    @Override
    public LibriBean doRetriveByKey(String isbn) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        LibriBean bean= new LibriBean();

        String selectSQL="SELECT * FROM libro WHERE isbn= ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, Integer.parseInt(isbn));

            System.out.println("doRetrieveByKey:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {

                bean.setIsbn(rs.getString("isbn"));
                bean.setTitolo(rs.getString("titolo"));
                bean.setAutore(rs.getString("autore"));
                bean.setImmagine(rs.getString("immagine"));
                bean.setGenere(rs.getString("genere"));
                bean.setAnno_pubb(rs.getInt("anno_pubb"));

            }
        } finally {
            try {
                if(preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }

        return bean;
    }

    @Override
    public Collection<LibriBean> doRetriveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        Collection<LibriBean> libri = new ArrayList<LibriBean>();

        String selectSQL = "SELECT * FROM libro";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            System.out.println("doRetrieveAll:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                LibriBean bean = new LibriBean();

                bean.setIsbn(rs.getString("isbn"));
                bean.setTitolo(rs.getString("titolo"));
                bean.setAutore(rs.getString("autore"));
                bean.setImmagine(rs.getString("immagine"));
                bean.setGenere(rs.getString("genere"));
                bean.setAnno_pubb(rs.getInt("anno_pubb"));


                libri.add(bean);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(preparedStatement != null)
                    preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return libri;
    }

    @Override
    public void doSave(LibriBean libro) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO Libro" +
                "(isbn, titolo, autore, immagine, genere, anno_pubb) VALUES (?, ?, ?, ?, ?, ?);";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, libro.getIsbn());
            preparedStatement.setString(2, libro.getTitolo());
            preparedStatement.setString(3, libro.getAutore());
            preparedStatement.setString(4, libro.getImmagine());
            preparedStatement.setString(5, libro.getGenere());
            preparedStatement.setInt(6, libro.getAnno_pubb());


            System.out.println("doSave: "+ preparedStatement.toString());
            preparedStatement.executeUpdate();

            connection.commit();

        } finally {
            try {
                if(preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public void doUpdate(LibriBean libro) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String updateSQL = "UPDATE Libro SET" +
                "isbn= ?, titolo= ?, autore= ?, immagine= ?, genere= ?, anno_pubb= ?;";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(updateSQL);

            preparedStatement.setString(1, libro.getIsbn());
            preparedStatement.setString(2, libro.getTitolo());
            preparedStatement.setString(3, libro.getAutore());
            preparedStatement.setString(4, libro.getImmagine());
            preparedStatement.setString(5, libro.getGenere());
            preparedStatement.setInt(6, libro.getAnno_pubb());


            System.out.println("doUpdate: "+ preparedStatement.toString());
            preparedStatement.executeUpdate();

            connection.commit();

        } finally {
            try {
                if(preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public void doDelete(LibriBean libro, String table) throws SQLException {
        String isbn = libro.getIsbn();
        try (Connection con = DriverManagerConnectionPool.getConnection()) {
            String sql = "DELETE FROM "+ table+ " WHERE isbn=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, isbn);
            ps.executeUpdate();
            con.commit();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
