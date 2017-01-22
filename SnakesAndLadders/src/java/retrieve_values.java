
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Scanner;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bhanu
 */
public class retrieve_values {
    
    public static void main(String args[])
    {
        try
        {
            Scanner sc=new Scanner(System.in);
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement statement = (Statement) conn.createStatement();
            System.out.println(" Enter the player name to get the details : ");
            String name=sc.next();
            ResultSet rs=statement.executeQuery("select * from game_details where player_name='"+name+"'");
            String game=null;
            if(rs.next())
            {
                game=rs.getString(1);
                System.out.println(" The game player "+name+" is playing is "+game);
            }
            else
            {
                System.out.println(" The given player is not playing the game");
                System.exit(0);
            }
            rs.close();
            rs=statement.executeQuery("select * from player_details where game_name='"+game+"'");
            while(rs.next())
            {
                System.out.println(" Player "+rs.getString(1)+" is playing game "+game+" with current position "
                        + " as "+rs.getInt(4)+ " and previous position as "+rs.getInt(5));
            }
            rs.close();
            statement.close();
            conn.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
