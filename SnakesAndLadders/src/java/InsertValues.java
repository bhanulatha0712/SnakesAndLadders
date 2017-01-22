
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
public class InsertValues 
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
            System.out.println(" Enter the game name : ");
            String game_name=sc.next();
            System.out.println(" Enter the game password : ");
            String password=sc.next();
            System.out.println(" Enter the maximum players : ");
            int maxplayer=sc.nextInt();
            System.out.println(" Enter the player name : ");
            String playername=sc.next();
            System.out.println(" Enter the no of players : ");
            int count=sc.nextInt();
            String make="Insert into game_details values('"+game_name+"','"+password+"','"+maxplayer+"','"+playername+"','"+count+"')";
            statement.executeUpdate(make);
            System.out.println(" Inserted first row in game_details ");
            
            System.out.println(" Enter the game name : ");
            game_name=sc.next();
            System.out.println(" Enter the game password : ");
            password=sc.next();
            System.out.println(" Enter the maximum players : ");
            maxplayer=sc.nextInt();
            System.out.println(" Enter the player name : ");
            playername=sc.next();
            System.out.println(" Enter the no of players : ");
            count=sc.nextInt();
            make="Insert into game_details values('"+game_name+"','"+password+"','"+maxplayer+"','"+playername+"','"+count+"')";
            statement.executeUpdate(make);
            System.out.println(" Inserted second row in game_details ");
            
            System.out.println(" *** VALUES IN PLAYER_DETAILS *** ");
            
            System.out.println(" Enter the player name : ");
            playername=sc.next();
            System.out.println(" Enter the game name : ");
            game_name=sc.next();
            System.out.println(" Enter the player colour : ");
            String colour=sc.next();
            System.out.println(" Enter the current position : ");
            int cur_pos=sc.nextInt();
            System.out.println(" Enter the previous position : ");
            int prev_pos=sc.nextInt();
            make="Insert into player_details values('"+playername+"','"+game_name+"','"+colour+"','"+cur_pos+"','"+prev_pos+"')";
            statement.executeUpdate(make);
            System.out.println(" Inserted first row in player_details ");
            
            System.out.println(" Enter the player name : ");
            playername=sc.next();
            System.out.println(" Enter the game name : ");
            game_name=sc.next();
            System.out.println(" Enter the player colour : ");
            colour=sc.next();
            System.out.println(" Enter the current position : ");
            cur_pos=sc.nextInt();
            System.out.println(" Enter the previous position : ");
            prev_pos=sc.nextInt();
            make="Insert into player_details values('"+playername+"','"+game_name+"','"+colour+"','"+cur_pos+"','"+prev_pos+"')";
            statement.executeUpdate(make);
            System.out.println(" Inserted second row in player_details ");
            statement.close();
            
            statement = (Statement) conn.createStatement();
            System.out.println(" ** RETRIEVING FROM GAME_DETAILS *** ");
            ResultSet rs=statement.executeQuery("select * from game_details");
            while(rs.next())
            {
                System.out.println(" The game name is "+rs.getString(1)+ " with password "+rs.getString(2)
                        + " having maximum players of "+rs.getInt(3)+" and player name is "+rs.getString(4)
                        +" with no.of players as "+rs.getInt(5));
            }
            
            System.out.println(" ** RETRIEVING FROM PLAYER_DETAILS ** ");
            rs.close();
            
            rs=statement.executeQuery("select * from player_details");
            
            while(rs.next())
            {
                System.out.println(" The player "+rs.getString(1)+ " is playing the game "+rs.getString(2)
                        + " with colour "+rs.getString(3)+ " and his current position is "+rs.getInt(4)
                        + " and previous position is "+rs.getInt(5));
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
