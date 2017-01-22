<%-- 
    Document   : Registration
    Created on : Mar 15, 2013, 12:19:06 AM
    Author     : bhanu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="main.css" rel="StyleSheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    <script src="generalscript.js"></script>
  <script type="text/javascript">
      
      function validate_registration()
      {
          var username=document.registration.user_name;
          var firstname=document.registration.first_name;
          var gender=document.forms["registration"]["sex"];
          var mail_id=document.registration.mail;
          var pass=document.registration.pwd;
          var re_pass=document.registration.repwd;
          var secret=document.registration.secret_ques;
          var secret_ans=document.registration.answer; 
          
          if(firstname.value.length==0)
              {
                  alert("FirstName cannot be empty");
                  firstname.focus();
                  return false;
              }
          if(username.value.length==0)
              {
                  alert("UserName cannot be empty");
                  username.focus();
                  return false;
              }
          var value=false;
          for(var i=0;i<gender.length;i++)
              {
                  if(gender[i].checked)
                      {
                          value=true;
                      }
              }
          if(value==false)
              {
                  alert("Select the gender");
                  return false;
              }
          if(mail_id.value.length==0)
              {
                  alert("Enter Your Email Id");
                  mail_id.focus();
                  return false;
              }
          if(pass.value.length==0)
              {
                  alert("Enter Your Password");
                  pass.focus();
                  return false;
              }
          if(re_pass.value.length==0)
              {
                  alert("Re Type the password");
                  re_pass.focus();
                  return false;
              }
          
          if(secret.value!="none")
              {
                  if(secret_ans.value.length==0)
                      {
                          alert("Enter answer for secret question");
                          secret_ans.focus();
                          return false;
                      }
              }
          
          return ValidCaptcha();
          
      }
      
      function checkuser(user)
      {
       
       var xmlhttp;

       if (user.length==0)
  { 
  document.getElementById("warn").innerHTML="";
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
        
        
                  
                document.getElementById("warn").innerHTML=xmlhttp.responseText;
                var str=xmlhttp.responseText;
                var n=str.search("User");
            
            if(n!=-1)
                {
                   
                    document.getElementById("act").disabled=true;
                    document.registration.user_name.value="";
                }
            else
                {
                    
                    document.getElementById("act").disabled=false; 
                }
            
        
        }
    }
        xmlhttp.open("GET","checkusers.jsp?u="+user,true);
        xmlhttp.send();
            
      }
      
   function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
  document.getElementById("warn").innerHTML="";
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
    document.getElementById("warn").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","checkusers.jsp?h="+str,true);
xmlhttp.send();
}
function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 10)+ '';
        var b = Math.ceil(Math.random() * 10)+ '';       
        var c = Math.ceil(Math.random() * 10)+ '';  
        var d = Math.ceil(Math.random() * 10)+ '';  
        var e = Math.ceil(Math.random() * 10)+ '';  
        var f = Math.ceil(Math.random() * 10)+ '';  
        var g = Math.ceil(Math.random() * 10)+ '';  
        var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        document.getElementById("txtCaptcha").value = code
    }

       
    function ValidCaptcha(){
        var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1==str2 && str2.length !=0)
            {
               return true;   
            }
        else
            {
               
               return false;
            }
        
        
    }

    
    function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
    
 
  </script> 
 </head>

 <body>
 <div id=header>
	<center><img src="wood.gif" height="90px" width="800px"/></center>
	</div>
  <div id=menubar>
	<center> <ul> <li> <a href="homepage.jsp"> Home </a>  </li> 
	<li> <a href="Instructions.jsp"> Instructions </a> </li>
	
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
  <legend> Registration Form </legend>

   <center>
  <table border="0" style="border-collapse:collapse;">
 
  <form name="registration" onsubmit="return validate_registration();" action="reg_insert">
<tr><td>First Name		:		</td> <td><input type="text" name="first_name" value="" onblur="validfirstname()"></td></tr>
<tr><td>Last Name		:		</td> <td><input type="text" name="last_name" value="" onblur="validlastname()"></td></tr> 
<tr><td>User Name		:		</td> <td><input type="text" name="user_name" value="" onkeyup="showHint(this.value)" onblur="validusername();checkuser(this.value);"></td><td id="warn"> </td></tr> 
<tr><td>Date of Birth	:		</td> <td><select name="Day">
<option value="1">1</option>
<option value="2">2</option>

<option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>

</select> - 

<select name="Month">
<option value="1">1</option>
<option value="2">2</option>

<option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
</select> - 

<select name="Year">
<option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option>
<option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2008</option><option value="2009">2009</option><option value="2010">2010</option></select></td></tr>

<tr><td>Gender				:		</td> <td><input type="radio" name="sex" value="male">Male   <input type="radio" name="sex" value="female">Female</td></tr>
<tr><td>E-mail Id			:		</td> <td><input type="text" name="mail" value="" onblur="validate_email()"></td></tr>
<tr><td>Password			:		</td> <td><input type="password" name="pwd" onblur="validate_password()"></td></tr>
<tr><td>Re-Type Password	:		</td> <td><input type="password" name="repwd" onblur="retype_password()"></td></tr>
<tr><td>Address				:		</td> <td><textarea value="" name="address"></textarea></td></tr>
<tr><td>Secret Question		:		</td> <td><select name="sec_ques" id="secret_ques">
                                                        <option value="none"> None </option>
							<option value="teacher">Who is your Favourite Teacher?</option>
							<option value="friend">Who is your Best Friend?</option>
							<option value="pet">What is your favourite pet name?l</option>
							<option value="dish">What is your favourite dish?</option>
					 </select></td>
			</tr>
<tr><td>Answer				:		</td> <td><input type="text" name="answer" value=""></td></tr>
<tr><td>Alternate Email		:		</td> <td><input type="altmail" name="altmail" value=""></td></tr>


<tr>
    <td>Enter Captcha :
        <input type="text" id="txtCaptcha" 
            style="background-image:url(1.jpg); text-align:center; border:none;
            font-weight:bold; font-family:Modern" onblur="DrawCapcha();" />
        <input type="button" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();" />
    </td>
</tr>
<tr>
    <td>
        <input type="text" id="txtInput"/>    
    </td>
</tr>
<tr>
    <td>
        <input id="Button1" type="button" value="Check" onclick="alert(ValidCaptcha());"/>
    </td>
</tr>

<tr><td>               </td><td><input type="submit" name="Submit" value="Submit" id="act"> </td></tr>
  </form>
 
  </table>
   </center>
  </fieldset>
	
 
  </center>
	</div>
  </div>
     
     
  
 </body>
</html>

