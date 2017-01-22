<%-- 
    Document   : Contact_Us
    Created on : Mar 14, 2013, 11:22:58 PM
    Author     : bhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
    </head>
    <body>
        <div id=header>
	<center><img src="wood.gif" height="90px" width="800px"/></center>
	</div>
        <div id=menubar>
            <%
            HttpSession s=request.getSession(true);
            if(s.isNew())
            {
                s.invalidate();%>
            <center> <ul> <li> <a href="homepage.jsp"> Home </a> </li>
                    <li> <a href="Registration.jsp"> Registration </a>  </li> 
                    <li> <a href="Instructions.jsp"> Instructions </a> </li>
                    <li> <a href="login.html"> Log In </a> </li> </ul> </center>
            <% } 
            else
            {%>
                <center> <ul> 
        <li> <a href="homepage.jsp"> Home </a> </li>
	<li> <a href="Instructions.jsp"> Instructions </a> </li>
	<li> <a href="login_create.jsp"> Join Game </a> </li> 
	<li> <a href="login.jsp"> New game </a> </li> 
	
        <li> <a href="LogOut.jsp"> Log Out </a> </li></ul>    </center>
            <%}
            %>
	
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
	<br> <br> <br>
        <center> <img src="contact.gif" height="100px" width="300px"/> </center>
        <center> 
            <p> <bold> BHANU <br>
                MSIT <br>
                IIIT <br> </bold> </p>
        </center>
        </div>
        </div>
    </body>
</html>
