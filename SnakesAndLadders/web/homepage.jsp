<%-- 
    Document   : homepage
    Created on : Mar 15, 2013, 9:44:07 AM
    Author     : bhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <center> <ul> <li> <a href="Instructions.jsp"> Instructions </a> </li>
                    <li> <a href="Registration.jsp"> Registration </a>  </li> 
                    <li> <a href="Contact_Us.jsp"> Contact Us </a> </li>
                    <li> <a href="login.html"> Log In </a> </li> </ul> </center>
            <% } 
            else
            {%>
                <center> <ul> 
        <li> <a href="Instructions.jsp"> Instructions </a> </li>
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
	<p> <b> Snakes and Ladders is an ancient Indian board game regarded today as a worldwide 
                classic.It is played between two or more players on a gameboard having numbered, 
                gridded squares. A number of "ladders" and "snakes" are pictured on the board, 
                each connecting two specific board squares. The object of the game is to navigate 
                one's game piece, according to die rolls, from the start (bottom square) to the finish ,
                helped or hindered by ladders and snakes, respectively. The historic version had root in 
                morality lessons, where a player's progression up the board represented a life journey 
                complicated by virtues and vices.The game is a simple race contest lacking a skill component, 
                and is popular with young children. </b> </p>
	<br> <br>
	<center> <img src="goal.jpg" height=400px width=400px/> </center>
  
  </div>

  
  </div>
    </body>
</html>
