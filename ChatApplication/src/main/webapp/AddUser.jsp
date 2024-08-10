<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("user");
String pwd = request.getParameter("pass");
%>
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<%
int res = db.addUser(username,pwd);
if(res>0)
{
response.sendRedirect("Login.jsp");
out.println("User added successfully");
}
else
{
out.println("Unable to add");
}
%>
</body>
</html>