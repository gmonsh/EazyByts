<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Room</title>
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
.userName{
 font-family:"Times New Roman", Times, serif;
  font-size:16px;
  color:blue;
}
.sendMessage{
width:80%;
position:absolute;
left:30px;
bottom:20px;
}
input{
width:100%;
height:30px;
}
form{
display:flex;
}
#userprofile{
color:white;
}
.profile{
border:1px solid white;
border-radius:30px;
background-color:gray;
position:absolute;
right:30px;
top:20px;
display:inline-block;
}
.dropdown {
    display: none;
    position: absolute;
    top:70px;
    right: 0;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.profile-container:hover .dropdown {
    display: block;
}
.dropdown a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
}
.timestamp{
color:green;
}
a:link {
  color: red;
  background-color: transparent;
  text-decoration: none;
}
</style>
</head>
<%@page import="java.util.Vector" %>
<%@page import="logics.Messages" %>
<body>
<%
HttpSession s=request.getSession();
String user =(String) s.getAttribute("username");
int user_id =(int)s.getAttribute("user_id"); 
%>
<div class="profile-container">
<div class="profile"><p id="userprofile"><%=user %></p></div>
<div id="dropdownMenu" class="dropdown">
        <a href="Login.jsp">Log Out</a>
    </div>
</div>
<div class="messageContainer">
<div class = "displayMessages">
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<% Vector<Messages> msgs=db.display(); %>
<% for(Messages m:msgs){ %>
<div class="msgdetails">
<p><strong><span class="userName"><%= m.getUsername() %>:</strong></span>&nbsp &nbsp<span class="message"><%= m.getMessage() %></span><br><span class="timestamp"><%=m.getFormattedTimestamp() %></span>&nbsp &nbsp<span class="delete"><a href="DeleteMessage.jsp?mId=<%=m.getMsgId()%>">Delete</a></span></p>
</div>
<% } %>
</div>
<div class="sendMessage">
 <form action="SendMessage.jsp" method="post">
            <input type="text" name="message" placeholder="Type your message here...">
            <button type="submit">Send</button>
        </form>
</div>
</div>
</body>
</html>