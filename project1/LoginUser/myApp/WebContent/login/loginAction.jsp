<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!-- import UserDAO -->
 <%@ page import = "user.UserDAO" %>
 <!-- PrintWriter -->
 <%@ page import = "java.io.PrintWriter" %>
 
 <!-- javaBeans -->
 <jsp:useBean id = "user" class = "user.User" scope = "page" />
 <jsp:setProperty name = "user" property ="userID" />
 <jsp:setProperty name = "user" property ="userPassword" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP - Login Action</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO(); // instance
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		// login ok
		if(result == 1){
			PrintWriter script = response.getWriter();
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
			
		} // login fail
		else if(result == 0){
		    PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong passwrod.')");
			script.println("history.back()");
			script.println("</script>");
		} // no id
		else if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('The id is not enrolled.')");
			script.println("history.back()");
			script.println("</script>");
		} // db error
		else if(result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('db error')");
			script.println("history.back()");
			script.println("</script>");
		}		
	%>
</body>
</html>