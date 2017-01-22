<%-- 
    Document   : Instructions
    Created on : Mar 14, 2013, 11:56:31 PM
    Author     : bhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructions</title>
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
                    <li> <a href="Conatct_Us.jsp"> Contact Us </a> </li>
                    <li> <a href="login.html"> Log In </a> </li> </ul> </center>
            <% } 
            else
            {%>
                <center> <ul> 
        <li> <a href="homepage.jsp"> Home </a> </li>
	<li> <a href="Contact_Us.jsp"> Contact Us </a> </li>
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
        <p align=left><b>
	1)The game starts on a first come first serve basis
 <br> 
 <br> 
2) If the die rolled is six, the player will get another chance to roll the die. 
<br>
<br> 
3)There could be only one winner. Once a player wins (reaches the 100th mark), the game is over.
<br>
<br> 
4) The first player creates the game and pass phrase.
<br>
<br> 
5) Others joining the game should know the pass phrase to join the game.</b></p>
        </div>
        </div>
    </body>
</html>
