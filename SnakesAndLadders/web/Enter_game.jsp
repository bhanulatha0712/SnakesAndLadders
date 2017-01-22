<%-- 
    Document   : Enter_game
    Created on : Mar 6, 2013, 4:43:03 PM
    Author     : bhanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Game</title>
        <script>
        function validate_enterboard()
      {
          
          var colour=document.forms["enter_board"]["color"];
          
          var pass=document.enter_board.game_password;
          var player=document.enter_board.player_name;
          
          
          var value=false;
          for(var i=0;i<colour.length;i++)
              {
                  if(colour[i].checked)
                      {
                          value=true;
                      }
              }
          if(value==false)
              {
                  alert("Select the die colour");
                  return false;
              }
          
          if(pass.value.length==0)
              {
                  alert("Enter the board Password");
                  pass.focus();
                  return false;
              }
              
           if(player.value.length==0)
              {
                  alert("Enter the Player Name");
                  player.focus();
                  return false;
              }
          
          
          return true;
          
      }    
            
function validate_password()
{
    var check=/^[a-zA-Z0-9]+$/;
    var password=document.enter_board.game_password;
    var pass_len=password.value.length;
    if(pass_len>=5 && pass_len<=10 && password.value.match(check))
        {
            return true;
        }
    else
        {
            alert("Enter valid password (5 to 10 characters and only alphanumerics)");
            password.value="";
            return false;
            
        }
}

function validusername()
{
    var user_name=document.enter_board.player_name;
    var user_len=user_name.value.length;
    var check=/^[a-zA-Z][\S]*$/;
    if(user_len==0 || user_len<5 || user_len>10)
            {
                
               alert("Enter valid  player name (5 to 10 characters and should start with alphabet)");
               user_name.value="";
               return false;
            }
        else
            {
                if(user_name.value.match(check))
                    {
                        return true;
                    }
                else
                    {
                        alert("Enter valid  player name (5 to 10 characters and should start with alphabet)");
                        user_name.value="";
                        return false;
                    }
            }
}
        </script>
    </head>
    <body>
        
        <div id=header>
            <center><img src="wood.gif" height="90px" width="800px"/></center>
        </div>
        <div id=menubar>
            <center> <ul> <li> <a href="homepage.jsp"> Home </a>  </li> 
                    <li> <a href="Instructions.jsp"> Instructions </a> </li>
                    
                    <li> <a href="login.jsp"> New game </a> </li> 
                    <li> <a href="Contact_Us.jsp"> Contact Us </a> </li> 
                    <li> <a href="LogOut.jsp"> Log Out </a> </li> </ul> </center>
        </div>
        
        <div id=complete>
            
            <div id=left>
                <br> <br> <br>
                <center> <img src="ladder.jpg" height="600px" width="150px"/> <center>
            </div>

            <div id=right>
                <br> <br> <br>
                <center> <img src="snake.jpg" height="600px" width="150px"/> </center>
                
            </div>
            
            <div id=middle>
                <center>
                <br> <br> <br> <br> <br>
                <fieldset>
                <legend> Join A Game </legend>
                <table>
                    <form name="enter_board" onsubmit="return validate_enterboard();" action="join_details" method="post">
                        <tr> <td>Player Name			:		</td> <td> <input type="text" name="player_name" onblur="validusername()"></td></tr>
                        <tr> <td>Game Password			:		</td> <td> <input type="password" name="game_password" onblur="validate_password()"></td></tr>
                        <% 
                            try 
                                                        {
                                                            Connection conn = null;
                                                            Statement stat = null;
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            String url = "jdbc:mysql://localhost:3306/snakes_ladders";
                                                            conn = (com.mysql.jdbc.Connection) DriverManager.getConnection(url, "root", "bhanu");
                                                            String name=request.getParameter("board");
                                                            HttpSession s=request.getSession();
                                                            s.setAttribute("board",new String(name));
                                                            String make ="select color from diecolor where color not in(select die_color from join_game where board_name='"+name+"')";
                                                            stat=conn.createStatement();
                                                            ResultSet rs=stat.executeQuery(make);
                                                            out.println("<br> <br> <br>");
                                                            while(rs.next())
                                                            {
                                                            out.println("<tr> <td> <input type=\"radio\" name=\"color\" value="+rs.getString("color")+">"+rs.getString("color")+ "</td> </tr>");
                                                            
                                                            }
                                                            rs.close();
                                                            stat.close();
                                                            conn.close();
                                                            
                                                            
                                                            
                                                        } 
                                                        catch (Exception e) 
                                                        {
                                                            
                                                            
                                                            out.println(e.getMessage());
                                                        }
                                                        finally
                                                        {
                                                            //out.close();
                                                        }
                        %>
                        <tr> <td> <input type="Submit" name="submit" value="Start Game"</td> </tr>
                    </form>   
                </table>
                </fieldset>
            </div>
                        
        
    </body>
</html>
