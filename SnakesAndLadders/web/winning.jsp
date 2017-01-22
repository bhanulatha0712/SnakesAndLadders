<%-- 
    Document   : winning
    Created on : Mar 12, 2013, 2:02:34 AM
    Author     : bhanu
--%>

<%@page import="com.sun.jndi.cosnaming.CNCtx"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
             String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement stat=conn.createStatement();
            HttpSession s=request.getSession();
            String board=(String)s.getAttribute("board");
            ResultSet rs=null;
            String make="select * from join_game where board_name='"+board+"' and cur_pos=100";
            rs=stat.executeQuery(make);
            
        %>
        <div id=header>
            <center><img src="wood.gif" height="90px" width="800px"/></center>
        </div>
        <div id=menubar>
            <center> <ul> <li> <a href="homepage.html"> Home </a>  </li> 
                    <li> <a href="Instructions.html"> Instructions </a> </li>
                    
                    <li> <a href="logout.jsp"> Log Out </a> </li> 
                    <li> <a href="Contact_Us.html"> Contact Us </a> </li> </ul> </center>
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
                
                <% if(rs.next())
                  {
                      String color=rs.getString(4)+".jpg";%>
                  <center> <h1> CONGRATULATIONS </h1> </center>
                  <br> <br>
                    <center> <h1> <%=rs.getString(3)%> Won The Game </h1> </center>
                    <br> <br> <br>
                    <center> <img src="<%=color%>" alt="Winner" height="150px" width="150px"> </center>
                <% 
                    rs.close();
                    stat.close();
                } %>
                    
                    <%
                    stat=conn.createStatement();
                    make="update new_game set status=\"completed\" where board_name='"+board+"'";
                    stat.executeUpdate(make);
                    stat.close();
                    conn.close();
                    %>
                
            </div>
        </div>
    </body>
</html>
