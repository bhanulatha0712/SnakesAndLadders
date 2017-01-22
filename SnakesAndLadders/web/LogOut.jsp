<%-- 
    Document   : LogOut
    Created on : Mar 15, 2013, 11:33:26 AM
    Author     : bhanu
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession s=request.getSession();
        if(s.getAttribute("board")==null)
        {
            s.invalidate();
            response.sendRedirect("homepage.jsp");
        }
        else 
         {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement stat=(com.mysql.jdbc.Statement)conn.createStatement();
            String board=(String)s.getAttribute("board");
            String make="delete from join_game where board_name='"+board+"'";
            stat.executeUpdate(make);
            stat.close();
            conn.close();
            
            s.invalidate();
            response.sendRedirect("homepage.jsp");
         }
        %>
    </body>
</html>
