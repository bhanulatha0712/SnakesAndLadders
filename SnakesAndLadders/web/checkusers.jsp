<%-- 
    Document   : checkusers
    Created on : Mar 14, 2013, 12:36:24 AM
    Author     : bhanu
--%>

<%@page import="java.sql.ResultSet"%>
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
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/snakes_ladders";
           Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
           String user=request.getParameter("u");
           String hint=request.getParameter("h");
           Statement stat=conn.createStatement();
           if(user!=null)
           {
           ResultSet rs=stat.executeQuery("select * from registration where user_name='"+user+"'");
           String res="";
           if(rs.next())
           {
               
               res=res+"User Name already exists";
           }
           else
           {
               
               res=res+"";
           }
           rs.close();
           
           out.println("<font face='Arial' color='red'>"+res+"</font>");
           }
          else if(hint!=null)
          {
              String make="select * from registration";
            ResultSet rs=(com.mysql.jdbc.ResultSet)stat.executeQuery(make);
            String res="";
            while(rs.next())
            {
                if(rs.getString(1).contains(hint))
                {
                    res=res+rs.getString(1)+"  ";
                }
            } 
            out.println("Name Should not be <font face='Arial' color='blue'>"+res+"</font>");
            rs.close();
            
          }
           stat.close();
           conn.close();
        %>
    </body>
</html>
