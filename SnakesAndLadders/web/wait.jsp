<%-- 
    Document   : wait
    Created on : Mar 8, 2013, 12:41:27 PM
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
        <meta http-equiv="refresh" content="5">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div id=header>
            <center><img src="wood.gif" height="90px" width="800px"/></center>
        </div>
        <div id=menubar>
            <center> <ul> 
                    
                    <li> <a href="LogOut.jsp"> Log Out </a> </li> 
                     </ul> </center>
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
            <div id="middle">
                <%
                     Connection conn = null;
                     Statement stat = null;
                     Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://localhost:3306/snakes_ladders";
                     conn = (com.mysql.jdbc.Connection) DriverManager.getConnection(url, "root", "bhanu"); 
                     stat=conn.createStatement();
                     HttpSession s=request.getSession();
                     String board=(String)s.getAttribute("board");
                     String make="select status from new_game where board_name='"+board+"'";
                     ResultSet rs=stat.executeQuery(make);
                     if(rs.next())
                     {
                        if(rs.getString("status").equals("playing"))
                        {
                            response.sendRedirect("board.jsp");
                        }
                     }
                %>
                <h1> Waiting For Players </h1>
            </div>
        </div>
    </body>
</html>
