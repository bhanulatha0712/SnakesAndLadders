/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function validfirstname()
{
    var first_name=document.registration.first_name;
    var first_len=first_name.value.length;
    var check=/^[a-zA-Z][a-zA-Z]*$/;
    if(first_len==0 || first_len<5 || first_len>20)
            {
                
               alert("Enter valid first name (5 to 20 characters and only alpahbets)");
               first_name.value="";
               return false;
            }
        else
            {
                if(first_name.value.match(check))
                    {
                        return true;
                    }
                else
                    {
                        alert("Enter valid first name (5 to 20 characters and only alpahbets)");
                        first_name.value="";
                        return false;
                    }
            }
}

function validlastname()
{
    var last_name=document.registration.last_name;
    var last_len=last_name.value.length;
    var check=/^[a-zA-Z][a-zA-Z]*$/;
    if(last_len==0 || last_len<5 || last_len>20)
            {
                
               alert("Enter valid last name (5 to 20 characters and only alphabets)");
               last_name.value="";
               return false;
            }
        else
            {
                if(last_name.value.match(check))
                    {
                        return true;
                    }
                else
                    {
                        alert("Enter valid last name (5 to 20 characters and only alphabets)");
                        last_name.value="";
                        return false;
                    }
            }
}

function validusername()
{
    var user_name=document.registration.user_name;
    var user_len=user_name.value.length;
    var check=/^[a-zA-Z][\S]*$/;
    if(user_len==0 || user_len<5 || user_len>10)
            {
                
               alert("Enter valid  user name (5 to 10 characters and should start with alphabet)");
               user_name.value="";
               return false;
            }
        else
            {
                if(user_name.value.match(check))
                    {
                        return true;
                    }
                else
                    {
                        alert("Enter valid  user name (5 to 10 characters and should start with alphabet)");
                        user_name.value="";
                        return false;
                    }
            }
}

function validate_email()
{
    var mail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var my_mail=document.registration.mail;
    if(my_mail.value.match(mail))
        {
            return true;
        }
    else
        {
            alert(" Enter valid email Id ");
            my_mail.value="";
            return false;
        }
}

function validate_password()
{
    var check=/^[a-zA-Z0-9]+$/;
    var password=document.registration.pwd;
    var pass_len=password.value.length;
    if(pass_len>=5 && pass_len<=10 && password.value.match(check))
        {
            return true;
        }
    else
        {
            alert("Enter valid password (5 to 10 characters and only alphanumerics)");
            password.value="";
            return false;
            
        }
}

function retype_password()
{
    var password=document.registration.pwd;
    var re_pass=document.registration.repwd;
    if(password.value==re_pass.value)
        {
            return true;
        }
    else
        {
            alert("Retyped password doesn't mach original password");
            re_pass.value="";
            return false;
        }
}

function validate_address()
{
    var user_address=document.registration.address;
    var check=/^[a-zA-Z0-9][a-zA-Z0-9\.,\/ -]+$/;
    if(user_address.value.match(check))
        {
            return true;
        }
    else
        {
            alert("Enter the valid address");
            user_address.value="";
            return false;
        }
}

function validate_alt_email()
{
    var mail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var my_mail=document.registration.altmail;
    if(my_mail.value.match(mail))
        {
            return true;
        }
    else
        {
            alert(" Enter valid alternate email Id ");
            my_mail.value="";
            return false;
        }
}


