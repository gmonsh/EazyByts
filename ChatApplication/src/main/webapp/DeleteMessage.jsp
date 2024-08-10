<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.SQLException" %>
<body>
<jsp:useBean id="db" class="logics.DBcode"></jsp:useBean>
<%
String mIdParam = request.getParameter("mId");
if (mIdParam != null && !mIdParam.trim().isEmpty()) {
    try {
        int MsgId = Integer.parseInt(mIdParam);
        int res = db.deleteMessage(MsgId);
        if (res > 0) {
            response.sendRedirect("ChatRoom.jsp");
        } else {
            out.println("Unable to delete the message.");
        }
    } catch (NumberFormatException e) {
        out.println("Invalid message ID format.");
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    }
} else {
    out.println("Message ID is missing.");
}
%>
</body>
</html>