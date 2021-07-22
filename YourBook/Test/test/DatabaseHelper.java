package test;

import control.servlet.DriverManagerConnectionPool;
import org.apache.ibatis.jdbc.ScriptRunner;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;


public class DatabaseHelper {
    private static Connection connection;

    public static void createDb() throws SQLException, FileNotFoundException {
        DriverManagerConnectionPool.setTest(true);
        connection = DriverManagerConnectionPool.getConnection();
        ScriptRunner scriptRunner = new ScriptRunner(connection);
        scriptRunner.runScript(new BufferedReader(new FileReader("./db/testbook.sql")));

        connection.close();
    }
}
