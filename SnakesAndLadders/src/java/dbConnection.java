
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bhanu
 */
public class dbConnection 
{
    private Connection conn=null;
    
    
    public Connection getConnection()
    {
        try
        {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/snakes_ladders";
        conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
        return conn;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
}
