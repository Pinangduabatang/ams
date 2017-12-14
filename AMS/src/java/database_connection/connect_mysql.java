/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database_connection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Azam
 */
@WebServlet(name = "connect_mysql", urlPatterns = {"/connect_mysql"})
public class connect_mysql extends HttpServlet {

 
    // Connect to SQLServer
    // (Using JDBC Driver of JTDS library)
    public static Connection getSQLServerConnection() //
            throws SQLException, ClassNotFoundException {
 
        // Note: Change the connection parameters accordingly.
        String hostName = "localhost";
        String database = "ams";
        String userName = "root";
        String password = "1234";
 
        return getSQLServerConnection(hostName, database, userName, password);

    }
 
    // Connect to SQLServer, using JTDS library
    private static Connection getSQLServerConnection(String hostName, //
            String database, String userName, String password)
            throws ClassNotFoundException, SQLException {
 
        Class.forName("com.mysql.jdbc.Driver");
 
        // Example:
        // jdbc:jtds:sqlserver://localhost:1433/simplehr;instance=SQLEXPRESS
        String connectionURL = "jdbc:mysql://"+ hostName +":3306/" + database;
 
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
//        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/world","root","");
        return conn;
    }
 
}