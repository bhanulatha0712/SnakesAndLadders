/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bhanu
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Scanner;

public class insert_game {
    
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
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
