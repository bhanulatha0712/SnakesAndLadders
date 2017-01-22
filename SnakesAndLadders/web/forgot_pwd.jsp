<%-- 
    Document   : forgot_pwd
    Created on : Mar 15, 2013, 7:18:34 AM
    Author     : bhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function retrieve(ans)
            {
                var user=document.forgot.username.value;
                var ques=document.forgot.question.value;
                
          
          var xmlhttp;

       if (ans.length==0 || ques.length==0 || user.length==0)
  { 
  document.getElementById("pass").innerHTML="";
  document.getElementById("log").disabled=true;
  alert("disabled");
  return;
  }
       if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
       else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
        
            
            document.getElementById("pass").innerHTML=xmlhttp.responseText;
            
            var str=xmlhttp.responseText;
            var n=str.search("Wrong");
            
            if(n!=-1)
                {
                    
                    document.getElementById("log").disabled=true;
                    document.forgot.ansques.value="";
                }
            else
                {
                    
                    document.getElementById("log").disabled=false; 
                }
                
        }
    }
        xmlhttp.open("GET","logincheck.jsp?us="+user+"&qu="+ques+"&an="+ans,true);
        xmlhttp.send();

      }
      
     function disable()
     {
         document.getElementById("log").disabled=true;
     }
            
        </script>
    </head>
    <body onload="disable()">
        
    <div id=header>
	<center><img src="wood.gif" height="90px" width="800px"/></center>
	</div>
  <div id=menubar>
	<center> <ul> <li> <a href="homepage.jsp"> Home </a>  </li> 
	<li> <a href="Instructions.jsp"> Instructions </a> </li>
	<li> <a href="Registration.jsp"> Registration </a> </li> 
	<li> <a href="login.html"> Log In </a> </li> 
	<li> <a href="Contact_Us.jsp"> Contact Us </a> </li> </ul> </center>
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
	<center>
  <br> <br> <br> <br> <br>
  <fieldset>
  <legend> Get Your Password </legend>
 <table>
 <form name="forgot">
 
 
  
  <tr>
		<td>Username				: 		 </td> <td>  <input type="username" name="username" /></td></tr>
		<tr><td>Secret Question		:		 </td><td><select name="question">
							<option value="teacher">Who is your Favourite Teacher?</option>
							<option value="friend">Who is your Best Friend?</option>
							<option value="pet">What is your favourite pet name?l</option>
							<option value="dish">What is your favourite dish?</option>
					 </select></td></tr>

		<tr><td>Answer to Question	: 		 </td><td>  <input type="answerquestion" name="ansques" onblur="retrieve(this.value)" /></td></tr>
                <tr><td id="pass"></td><td> </td></tr>
		
	 <br>
		<br>
		<tr>
		<td>
		</td>
		<td>
		<input type="submit" value="Submit" id="log"/></td></tr>
	</form>
	</table>

	</fieldset>
  </center>
	</div>
  </div>
  
 </body>
</html>

