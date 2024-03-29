package control.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DriverManagerConnectionPool {

    private static boolean isTest = false;

    private static List<Connection> freeDbConnections;

    static {
        freeDbConnections = new LinkedList<Connection>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("DB driver not found:" + e.getMessage());
        }
    }

    public static synchronized Connection createDBConnection() throws SQLException {
        Connection newConnection = null;
        String db = "";
        String ip = "localhost";
        String port = "3306";

        if (isTest)
            db = "TestBook";
        else
            db = "YourBook";
        String username = "root";
        String password = "Admin"; //da cambiare in Admin

        newConnection = DriverManager.getConnection("jdbc:mysql://" + ip + ":" +
                port + "/" + db + "?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", username, password);

        System.out.println("Create a new DB connection"); //set Transaction
        newConnection.setAutoCommit(false);
        return newConnection;
    }

    public static synchronized Connection getConnection() throws SQLException {
        Connection connection;

        if (!freeDbConnections.isEmpty()) {
            connection = (Connection) freeDbConnections.get(0);
            freeDbConnections.remove(0);

            try {
                if (connection.isClosed())
                    connection = getConnection();
            } catch (SQLException e) {
                connection.close();
                connection = getConnection();
            }
        } else {
            connection = createDBConnection();
        }

        return connection;
    }

    public static synchronized void releaseConnection(Connection connection) throws SQLException {
        if (connection != null) freeDbConnections.add(connection);
    }

    public void destroyPool() throws SQLException {
        for (Connection c : freeDbConnections)
            if (c != null && c.isClosed())
                c.close();
    }

    public synchronized static void setTest(boolean bool) {
        DriverManagerConnectionPool.isTest = bool;
    }

    public static boolean isTest() {
        return isTest;
    }

}
