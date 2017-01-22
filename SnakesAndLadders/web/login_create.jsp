<%-- 
    Document   : login_create
    Created on : Mar 6, 2013, 10:12:42 AM
    Author     : bhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% HttpSession s=request.getSession();
        if(s.isNew()==true)
        {
            s.invalidate();
            response.sendRedirect("login.html");
            
        }
        else
                       {
            response.sendRedirect("Join_Game.jsp");
        }
        %>
    </body>
</html>
