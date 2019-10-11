<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import UserDAO -->
<%@ page import = "user.UserDAO" %>
<!-- PrintWriter -->
<%@ page import = "java.io.PrintWriter" %>
  
<!-- javaBeans -->
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property = "*"/>	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP - Sign up page</title>
</head>
<body>

<%
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserFirstName() == null
	|| user.getUserLastName() == null || user.getUserEmail () == null || user.getUserPhoneNumber () == null || 
	user.getUserAddress () == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('put every information.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO(); //new instance
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('The ID is already taken.')");
			script.println("history.back()");
			script.println("</script>");
		}else{ //join success.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Welcome.')");
			script.println("location.href = '../main.jsp'");			
			script.println("</script>");
		}
	}
%>
</body>
</html>