
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bhanu
 */
public class meta_data 
{
    public static void main(String args[])
    {
        try
        {
            Scanner sc=new Scanner(System.in);
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/employee";
            Connection conn=(Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement statement = (Statement) conn.createStatement();
            ResultSet rs=statement.executeQuery("select * from employees");
            ResultSetMetaData data=rs.getMetaData();
            int numCols = data.getColumnCount();
for (int i=1; i<=numCols; i++)
 {
  int ct     = data.getColumnType(i);
  String cn  = data.getColumnName(i);
  String ctn = data.getColumnTypeName(i);
  System.out.println("Column #" + i + ":" + cn + " of type " + ctn + " (JDBC type: " + ct + ")");
  
  
  //System.out.println( rset.getString("cn")+"\t"+res.getString("current_position")+"\t"+res.getString("previous_position"));
}
String[] colNames = new String[data.getColumnCount()];
for (int col = 0; col < colNames.length; col++) 
{
   colNames[col] = data.getColumnName(col + 1);
}



 while(rs.next()) {
     int col=0;
     while(col < colNames.length)
     {
                    System.out.print( rs.getString( colNames[col])+"\t");
                    col++;
     }
         System.out.println();           
                }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
