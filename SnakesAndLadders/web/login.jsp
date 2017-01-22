<%-- 
    Document   : login
    Created on : Mar 5, 2013, 4:25:47 PM
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
            response.sendRedirect("New_Game.html");
        }
        %>
    </body>
</html>
