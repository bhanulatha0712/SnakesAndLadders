<%-- 
    Document   : Join_Game
    Created on : Mar 6, 2013, 2:25:04 PM
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
        <title>JSP Page</title>
    
    <script>
        function validate_joinboard()
      {
          
          var colour=document.forms["joingame"]["board"];
          var value=false;
          for(var i=0;i<=colour.length;i++)
              {
                  if(colour[i].checked)
                      {
                          out.println("check");
                          value=true;
                          return true;
                      }
              }
          if(value==false)
              {
                  out.println("check1");
                  alert("Select the board to play");
                  return false;
              }
          
          return true;
          
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
                <li> <a href="LogOut.jsp"> Log Out </a> </li></ul> </center>
        </div>
        <div id=complete>
            <div id=left>
                <br> <br> <br>
                <center> <img src="ladder.jpg" height="600px" width="150px"/> <center>
                        </div>

                        <div id=right>
                            <br> <br> <br>
                            <center> <img src="snake.jpg" height="600px" width="150px"/> <center>
                                    </div>
                                    <div id=middle>
                                        <center>
                                            <br> <br> <br> <br> <br>
                                            <fieldset>
                                                <legend> Join A Game </legend>
                                                <table>
                                                    <form name="joingame" onsubmit="return validate_joinboard();" action="Enter_game.jsp" method="post">
                                                    <%
                                                        try 
                                                        {
                                                            Connection conn = null;
                                                            Statement stat = null;
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            String url = "jdbc:mysql://localhost:3306/snakes_ladders";
                                                            conn = (com.mysql.jdbc.Connection) DriverManager.getConnection(url, "root", "bhanu");
                                                            String st="waiting";
                                                            String make ="select board_name from new_game where status='"+st+"'";
                                                            stat=conn.createStatement();
                                                            ResultSet rs=stat.executeQuery(make);
                                                            out.println("<br> <br> <br>");
                                                            if(rs.first())
                                                            {
                                                                out.println("<tr> <td> <input type=\"radio\" name=\"board\" value="+rs.getString("board_name")+">"+rs.getString("board_name")+ "</td> </tr>");
                                                                while(rs.next())
                                                                {
                                                                out.println("<tr> <td> <input type=\"radio\" name=\"board\" value="+rs.getString("board_name")+">"+rs.getString("board_name")+ "</td> </tr>");
                                                            
                                                                }
                                                            }
                                                            else{
                                                                    out.println("<h1> There Are No Boards To Play </h1>");
                                                                    RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp");
                                                                    rd.forward(request,response);
                                                                }
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        } 
                                                        catch (Exception e) 
                                                        {
                                                            out.println(e.getMessage());
                                                        }
                                                    %>
                                                    <tr> <td> <input type="Submit" name="submit" value="submit"></td> </tr>
                                                    </form>
                                                </table>
                                            </fieldset>
                                        </center>
                                    </div>

                                    </body>
                                    </html>
