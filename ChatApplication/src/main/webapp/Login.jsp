<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
body{
background: linear-gradient(to right, #f0f8ff, #e6e6fa);
background-size : cover;
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
left : 130px;
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
</style>
</head>
<body>
<div>
<h1>User Login</h1>
<form action="LoginValidation.jsp" onsubmit="return validateForm()">
<input type = "text" name = "userName" placeholder = "UserName" id="user"><br>
<input type = "password" name = "password" placeholder = "Password" id="myInput"><br>
<input type="checkbox" onclick="myFunction()" id="pwd"><span id="txt">Show Password</span><br>
<input type = "image" src = "https://www.freeiconspng.com/thumbs/login-button-png/login-button-png-5.png" width = "150px" height : "50px" class = "sub">
</form>
<p>Don't have an account?<a href="Register.jsp">Sign up</a></p>
<p>Are you a Visitor?<a href="Dashboard.jsp">Click here</a></p>
</div>
<script>
function validateForm(){
	    var username = document.getElementBy("user").value;
	    var password = document.getElementById("myInput").value;

	    if (username == "" || password == "") {
	        alert("Both username and password must be filled out");
	        return false;
	    }
	    return true;
}
function myFunction(){
var p = document.getElementById("myInput");
var s = document.getElementById("txt");
if(p.type==="password")
{
p.type="text";
s.innerText ="Hide Password";
}
else{
p.type="password";
s.innerText = "Show password";
}
}
</script>
</body>
</html>