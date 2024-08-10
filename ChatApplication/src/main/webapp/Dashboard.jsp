<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
body{
background-image:url("https://i.pinimg.com/originals/dd/60/cf/dd60cf77f6bc651b94e04a9fa53de17f.jpg");
background-size:cover;
}
.message{
background-color:black;
color:white;
 font-family: "Times New Roman", Times, serif;
 font-size:16px;
}
.Note{
color:red;
font-size:17px;
}
.userName{
 font-family:"Times New Roman", Times, serif;
  font-size:16px;
  color:blue;
}
</style>
</head>
<%@page import="java.util.Vector" %>
<%@page import="logics.Messages" %>
<body>
<div class="messageContainer">
<div class = "displayMessages">
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<div class="Note"><p>Only Registered Users can send message.Click here to <a href="Login.jsp">Login</a> or <a href="Register.jsp">Register</a></p></div>
<% Vector<Messages> msgs=db.display(); %>
<% for(Messages m:msgs){ %>
<div class="msgdetails">
<p><strong><span class="userName"><%= m.getUsername() %>:</strong></span>&nbsp &nbsp<span class="message"><%= m.getMessage() %></span><br><span class="timestamp"><%=m.getFormattedTimestamp() %></span></p>
</div>
<% } %>
</div>
</div>
</body>
</html>