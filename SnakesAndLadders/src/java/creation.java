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
import java.sql.*;

public class creation {
    
    public static void main(String args[])
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement statement = (Statement) conn.createStatement();
            String make="create table game_details(game_name varchar(20),passphrase varchar(10),"
                    + "max_players int," + "player_name varchar(20),"
                    + "count int, primary key(game_name))";
            statement.executeUpdate(make);
            make="create table player_details(player_name varchar(20),"
                    + "game_name varchar(20),"
                    + "palyer_color varchar(10),"
                    + "current_position int,"
                    + "previous_position int,"
                    + "primary key(player_name),"
                    + "foreign key(game_name) references game_details(game_name))";
            statement.executeUpdate(make);
            statement.close();
            conn.close();
                   
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
