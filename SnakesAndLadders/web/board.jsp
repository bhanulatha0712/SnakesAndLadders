<%-- 
    Document   : board
    Created on : Mar 8, 2013, 2:10:30 PM
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
        <link href="board.css" rel="StyleSheet" type="text/css"/>
         <meta http-equiv="refresh" content="5">
        <title>JSP Page</title>
    
    
    <script type="text/javascript">
        
        function changeimages()
        {
            var faces=["die-anim.GIF","red-die-1.png","red-die-2.png","red-die-3.png","red-die-4.png","red-die-5.png","red-die-6.png"];
             <%
             HttpSession s=request.getSession();
             if(s.getAttribute("die_value")!=null)
             {
                 int value=(Integer)s.getAttribute("die_value");%>
                 var die=document.getElementById("dice");
                 die.src=faces[<%=value%>];
             
             <%}%>
                 
             <%
             Class.forName("com.mysql.jdbc.Driver");
             String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
             Statement stat=conn.createStatement();
             ResultSet rs=null;
             
             
             String board=(String)s.getAttribute("board");
             String colors="select * from join_game where board_name='"+board+"'";
             rs=stat.executeQuery(colors);
             while(rs.next())
             {
                     String cur_pos=rs.getInt(6)+"";
                     String coin=rs.getString(4)+".jpg";
                %>
                     document.getElementById("<%=cur_pos%>").innerHTML="<img src='<%=coin%>' height='40px' width='40px'>";
                     
             <%}
             rs.close();
             stat.close();
             %>
                 
             
                 
        }
             
             
        
        function table_chg()
        {
            document.getElementById("81").innerHTML="<img src='dice-icon.jpg' height='40px' width='40px'>";
        }
        
    </script>
    </head>
    <body>
        <div id=header>
	<center><img src="wood.gif" height="90px" width="800px"/></center>
	</div>
  <div id=menubar>
	
      <ul>
	<li> <a href="Instructions.jsp"> Instructions </a> </li>
	
	<li> <a href="LogOut.jsp"> Log Out </a> 
	 </ul> </center>
  </div>
  <div id=complete>
  <div id=left>
  <br> <br> <br>
  <center>
  <table border=1>
	<tr><td id="91"></td><td id="92"></td><td id="93"></td><td id="94"></td><td id="95"></td><td id="96"></td><td id="97"></td><td id="98"></td><td id="99"></td><td id="100"></td></tr>
	<tr><td id="81"></td><td id="82"></td><td id="83"></td><td id="84"></td><td id="85"></td><td id="86"></td><td id="87"></td><td id="88"></td><td id="89"></td><td id="90"></td></tr>
	<tr><td id="71"></td><td id="72"></td><td id="73"></td><td id="74"></td><td id="75"></td><td id="76"></td><td id="77"></td><td id="78"></td><td id="79"></td><td id="80"></td></tr>
	<tr><td id="61"></td><td id="62"></td><td id="63"></td><td id="64"></td><td id="65"></td><td id="66"></td><td id="67"></td><td id="68"></td><td id="69"></td><td id="70"></td></tr>
	<tr><td id="51"></td><td id="52"></td><td id="53"></td><td id="54"></td><td id="55"></td><td id="56"></td><td id="57"></td><td id="58"></td><td id="59"></td><td id="60"></td></tr>
	<tr><td id="41"></td><td id="42"></td><td id="43"></td><td id="44"></td><td id="45"></td><td id="46"></td><td id="47"></td><td id="48"></td><td id="49"></td><td id="50"></td></tr>
	<tr><td id="31"></td><td id="32"></td><td id="33"></td><td id="34"></td><td id="35"></td><td id="36"></td><td id="37"></td><td id="38"></td><td id="39"></td><td id="40"></td></tr>
	<tr><td id="21"></td><td id="22"></td><td id="23"></td><td id="24"></td><td id="25"></td><td id="26"></td><td id="27"></td><td id="28"></td><td id="29"></td><td id="30"></td></tr>
	<tr><td id="11"></td><td id="12"></td><td id="13"></td><td id="14"></td><td id="15"></td><td id="16"></td><td id="17"></td><td id="18"></td><td id="19"></td><td id="20"></td></tr>
	<tr><td id="1"></td><td id="2"></td><td id="3"></td><td id="4"></td><td id="5"></td><td id="6"></td><td id="7"></td><td id="8"></td><td id="9"></td><td id="10"></td></tr>
  </table>
  </center>
  </div>

  <div id=middle>
  <br> <br> <br>
	<table border=1>
            
            <%
                stat=conn.createStatement();
                
                String make="select * from join_game where board_name='"+board+"'";
                rs=stat.executeQuery(make);
                
                
            
            %>
	<tr> <th> <b> Player Name </b> </th> <th> <b> Player Colour </b> </th> <th> <b> Player Position </b> </th> </tr>
	
        <%
        while(rs.next())
        {
            out.println("<tr> <td> "+rs.getString(3)+" </td> <td> "+rs.getString(4)+" </td> <td> "+rs.getInt(6)+" </td> </tr>");
        }
                rs.close();
                stat.close();
                stat=conn.createStatement();
                make="select * from join_game where board_name='"+board+"'";
                rs=stat.executeQuery(make);
                if(!rs.first())
                {
                    response.sendRedirect("homepage.jsp");
                }
                rs.close();
                make="select status from new_game where board_name='"+board+"'";
                rs=stat.executeQuery(make);
                if(rs.next())
                {
                   String win=rs.getString(1);
                   if(win.equals("completed"))
                   {
                       response.sendRedirect("winning.jsp");
                   }
                }
                rs.close();
                
        %>
        
        
	</table>
	<br> <br> <br>
        <img src="die-anim.GIF" alt="dice" height="150px" width="150px" id="dice" onload="changeimages()"/>
	<br> <br>
        <form action="board_controller" method="get">
	&nbsp; &nbsp; &nbsp; &nbsp; 
        <%
            String user=(String)s.getAttribute("User");
            String ch="select chance from join_game where user_name='"+user+"' and board_name='"+board+"'";
            stat=conn.createStatement();
            rs=stat.executeQuery(ch);
            if(rs.next())
            {
                if(rs.getInt(1)==1)
                {
                   //out.println("<button type=\"button\" width=\"200px\" onclick=\"http://localhost:8084/SnakeAndLadders/board_controller\"> Roll Dice </button>");
                    out.println("<input type=\"Submit\" name=\"submit\" value=\"Roll Dice\">");
                    
                }
            }
            rs.close();
            stat.close();
            conn.close();
            
        %>
        </form>
	
	</div>

  </div>
    </body>
</html>
