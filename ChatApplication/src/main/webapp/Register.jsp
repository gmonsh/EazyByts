<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<style>
body{
  background: linear-gradient(to right, #f0f8ff, #e6e6fa);
    background-size: cover;
background-attachment : fixed;
}

input {
 margin : 10px;
 background-color:transparent;
 padding : 5px;
}
div{
width : 400px;
border : solid #0E0E0E 1px;
box-shadow:1px 2px 3px black;
margin : 10px;
padding : 20px;
position : absolute;
left : 450px;
top : 100px;
}
h1{
position : relative;
left : 100px;
top : 10px;
color:#180A42;
}
form{
position : relative;
left : 100px;
top : 10px;
}
.sub{
position:relative;
top:-10px;
}
p{
position:relative;
top:-30px;
left:100px;
}
span{
color:red;
}
</style>
</head>
<body>
<div>
<h1>User Registration</h1>
<form onsubmit = "return valid()" action="AddUser.jsp">
<input type = "text" placeholder = "User Name" name = "user" id="inp1">
<span></span>
<input type = "password" placeholder = "Password" name="pass" id="pwd1">
<span></span>
<input type = "text" placeholder = "ConfirmPassword" id="pwd2">
<span></span><br>
<input type = "submit" value = "Register">
</form><br><br>
<p>Already have an account?<a href="Login.jsp">Login</a></p>
<p>Are you a Visitor?<a href="Dashboard.jsp">Click here</a></p>
</div>
<script>
function valid()
{
var name = document.getElementById("inp1");
var p1 = document.getElementById("pwd1");
var p2 = document.getElementById("pwd2");
var sp = document.getElementsByTagName("span");
if(name.value.trim() == "")
{
sp[0].innerHTML = "Enter User Name";
name.focus();
return false;
}
else{
sp[0].innerHTML = "";
}
if(p1.value == "")
{
sp[1].innerHTML = "Enter your password";
p1.focus();
return false;
}
else
{
sp[1].innerHTML = "";
}
if(p1.value != p2.value)
{
sp[2].innerHTML = "Password does not match";
p2.focus();
return false;
}
else{
sp[2].innerHTML = "";
}
}
</script>
</body>
</html>