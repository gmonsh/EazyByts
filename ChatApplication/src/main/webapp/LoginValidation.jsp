<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.warn{
width:100%;
height:5px;
position:absolute;
top:-10px;
left:-8px;
background-color:#FF204E;
}
#err{
color:white;
position:relative;
top:-25px;
left:200px;
}
</style>
</head>
<body>
<% String user = request.getParameter("userName");
String pwd = request.getParameter("password");
%>
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<%
if(db.isValid(user,pwd))
{
	 int UserId = db.getUserId(user,pwd);
	 if(UserId!=-1)
	 {
		 HttpSession sess = request.getSession();
		 sess.setAttribute("user_id", UserId);
         sess.setAttribute("username", user);
         response.sendRedirect("ChatRoom.jsp?username="+user+"&userId="+UserId);
     }
}
else{
%>
<jsp:include page="Login.jsp"/>
<div class="warn">
<p id="err">We couldn't find an account matching the username and password you entered.Please check your username and password and try again</p>
</div>
<%
}
%>
</body>
</html>