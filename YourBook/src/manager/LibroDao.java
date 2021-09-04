package manager;

import control.servlet.DriverManagerConnectionPool;
import model.LibriBean;
import model.UtenteLibro;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class LibroDao implements LibriModel<LibriBean> {
    private static final String TABLE_NAME = "Libro";

    @Override
    public Collection<LibriBean> doRetriveByAllFragment(String titolo) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        Collection<LibriBean> libri = new ArrayList<LibriBean>();

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(
                    "SELECT isbn, titolo, autore, immagine, genere, anno_pubb FROM Libro WHERE LOWER(libro.titolo) LIKE ?");

            preparedStatement.setString(1, titolo + "%");

            System.out.println("doRetrieveByAllFragment:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                LibriBean bean = new LibriBean();

                bean.setIsbn(rs.getString("isbn"));
                bean.setTitolo(rs.getString("titolo"));
                bean.setAutore(rs.getString("autore"));
                bean.setImmagine(rs.getString("immagine"));
                bean.setGenere(rs.getString("genere"));
                bean.setAnno_pubb(rs.getInt("anno_pubb"));

                libri.add(bean);
            }
        } catch (SQLException e) {
            throw new
                    RuntimeException(e);
        }
        return libri;
    }

    @Override
    public LibriBean doRetrieveByKey(String isbn) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        LibriBean bean = new LibriBean();

        String selectSQL = "SELECT * FROM Libro WHERE isbn=?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, isbn);

            System.out.println("doRetrieveByKey:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                bean.setIsbn(rs.getString("isbn"));
                bean.setTitolo(rs.getString("titolo"));
                bean.setAutore(rs.getString("autore"));
                bean.setCasaEditrice(rs.getString("casaEditrice"));
                bean.setImmagine(rs.getString("immagine"));
                bean.setGenere(rs.getString("genere"));
                bean.setAnno_pubb(rs.getInt("anno_pubb"));

            }
        } finally {
            try {
                if (preparedStatement != null)
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

        String selectSQL = "SELECT * FROM Libro";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            System.out.println("doRetrieveAll:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                LibriBean bean = new LibriBean();

                bean.setIsbn(rs.getString("isbn"));
                bean.setTitolo(rs.getString("titolo"));
                bean.setAutore(rs.getString("autore"));
                bean.setCasaEditrice(rs.getString("casaEditrice"));
                bean.setImmagine(rs.getString("immagine"));
                bean.setGenere(rs.getString("genere"));
                bean.setAnno_pubb(rs.getInt("anno_pubb"));


                libri.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException e) {
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
                "(isbn, titolo, autore, casaEditrice, immagine, anno_pubb) VALUES (?, ?, ?, ?, ?, ?);";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, libro.getIsbn());
            preparedStatement.setString(2, libro.getTitolo());
            preparedStatement.setString(3, libro.getAutore());
            preparedStatement.setString(4, libro.getCasaEditrice());
            preparedStatement.setString(5, libro.getImmagine());
            preparedStatement.setInt(6, libro.getAnno_pubb());


            System.out.println("doSave: " + preparedStatement.toString());
            preparedStatement.executeUpdate();

            connection.commit();

        } finally {
            try {
                if (preparedStatement != null)
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

        String updateSQL = "UPDATE Libro SET titolo= ?, autore= ?, immagine= ?, genere= ?, anno_pubb= ? WHERE isbn= ?;";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(updateSQL);

            preparedStatement.setString(1, libro.getTitolo());
            preparedStatement.setString(2, libro.getAutore());
            preparedStatement.setString(3, libro.getImmagine());
            preparedStatement.setString(4, libro.getGenere());
            preparedStatement.setInt(5, libro.getAnno_pubb());
            preparedStatement.setString(6, libro.getIsbn());


            System.out.println("doUpdate: " + preparedStatement.toString());
            preparedStatement.executeUpdate();

            connection.commit();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public void doDelete(LibriBean libro) throws SQLException {
        String isbn = libro.getIsbn();
        try (Connection con = DriverManagerConnectionPool.getConnection()) {
            String sql = "DELETE FROM Libro WHERE isbn=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, isbn);

            if (ps.executeUpdate() == 0) {
                System.out.println("Nessun libro trovato");
                throw new Exception("errore");
            }
            con.commit();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doSaveRating(UtenteLibro utenteLibro) throws SQLException {
        String isbn = utenteLibro.getIsbn();
        int id_utente = utenteLibro.getId_utente();
        int rating = utenteLibro.getValutazione();
        try (Connection con = DriverManagerConnectionPool.getConnection()) {
            String sql = "INSERT INTO UtenteLibro (id_utente, isbn, valutazione) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_utente);
            ps.setString(2, isbn);
            ps.setInt(3, rating);
            ps.executeUpdate();
            con.commit();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Collection<UtenteLibro> doRetriveAllRating() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        Collection<UtenteLibro> rating = new ArrayList<UtenteLibro>();

        String selectSQL = "SELECT * FROM UtenteLibro";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            System.out.println("doRetrieveAllRating:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                UtenteLibro bean = new UtenteLibro();

                bean.setIsbn(rs.getString("isbn"));
                bean.setId_utente(rs.getInt("id_utente"));
                bean.setValutazione(rs.getInt("valutazione"));

                rating.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                DriverManagerConnectionPool.releaseConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rating;
    }
}
