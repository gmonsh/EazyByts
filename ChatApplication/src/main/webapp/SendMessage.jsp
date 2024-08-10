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
String msg = request.getParameter("message");
HttpSession sn=request.getSession();
int uId = (Integer)sn.getAttribute("user_id");
String uName = (String)sn.getAttribute("username");
if (msg != null && !msg.trim().isEmpty()) {
%>
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<%
int res = db.addMessage(uId,uName,msg);
if(res>0){
	response.sendRedirect("ChatRoom.jsp");
}
else{
	out.println("<p>Error:Couldn't send message");
}
}
else{
	response.sendRedirect("ChatRoom.jsp");
}
%>

</body>
</html>