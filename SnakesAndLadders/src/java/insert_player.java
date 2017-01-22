
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.util.Scanner;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bhanu
 */
public class insert_player 
{
    public static void main(String args[])
    {
        try
        {
            Scanner sc=new Scanner(System.in);
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement statement = (Statement) conn.createStatement();
            
            System.out.println(" *** VALUES IN PLAYER_DETAILS *** ");
            
            System.out.println(" Enter the player name : ");
            String playername=sc.next();
            System.out.println(" Enter the game name : ");
            String game_name=sc.next();
            System.out.println(" Enter the player colour : ");
            String colour=sc.next();
            System.out.println(" Enter the current position : ");
            int cur_pos=sc.nextInt();
            System.out.println(" Enter the previous position : ");
            int prev_pos=sc.nextInt();
            String make="Insert into player_details values('"+playername+"','"+game_name+"','"+colour+"','"+cur_pos+"','"+prev_pos+"')";
            statement.executeUpdate(make);
            System.out.println(" Inserted first row in player_details ");
        }
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
