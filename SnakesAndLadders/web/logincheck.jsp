<%-- 
    Document   : logincheck
    Created on : Mar 14, 2013, 12:36:11 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
           String v=request.getParameter("u");
           String p=request.getParameter("p");
           String user=request.getParameter("us");
           String ques=request.getParameter("qu");
           String ans=request.getParameter("an");
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
            Statement stat=(com.mysql.jdbc.Statement)conn.createStatement();
            String res="";
            if(v!=null && p==null)
            {
            String make="select * from registration where user_name='"+v+"'";
            
            ResultSet rs=(com.mysql.jdbc.ResultSet)stat.executeQuery(make);
            
            
            if(!rs.first())
            {
                res="<font color='red' face='Arial'>User Not Registered Yet.</font>  <a href='Registration.html'> REGISTER </a>";
            }
            
            
            rs.close();
            }
            else if(v!=null && p!=null)
            {
                //out.println(p);
                String make="select * from registration where user_pass='"+p+"' and user_name='"+v+"'";
                ResultSet rs=(com.mysql.jdbc.ResultSet)stat.executeQuery(make);
                if(!rs.first())
                {
                   res="<font color='red' face='Arial'> Wrong Password </font> <a href='forgot_pwd.jsp'> Retrieve Password </a>"; 
                }
                rs.close();
            }
            else if(user!=null && ques!=null && ans!=null)
            {
                String make="select answer from registration where user_name='"+user+"' and question='"+ques+"'";
            
                ResultSet rs=(com.mysql.jdbc.ResultSet)stat.executeQuery(make);
                if(rs.first())
                {
                    if(rs.getString(1).equalsIgnoreCase(ans))
                    {
                        res="Tne password is "+rs.getString(1);
                        
                    }
                    else
                    {
                        res="<font color='red'>Wrong answer</font>";
                    }
                }
                else
                {
                    res="<font color='red'>Wrong Question</font>";
                }
                rs.close();
            }
            out.println(res); 
            stat.close();
             conn.close();
             
        %>
        
    </body>
</html>
