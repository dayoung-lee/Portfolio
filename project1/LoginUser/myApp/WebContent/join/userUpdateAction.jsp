<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import UserDAO -->
<%@ page import="user.UserDAO"%>
<!-- import user javaBean -->
<%@ page import="user.User"%>
<!-- PrintWriter -->
<%@ page import="java.io.PrintWriter"%>

<!-- javaBeans -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Updating...</title>
</head>
<body>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}	

		UserDAO userDAO = new UserDAO(); //new instance
		int result = userDAO.updateUser(userID, request.getParameter("password"), request.getParameter("email"),
				request.getParameter("phoneNumber"), request.getParameter("address"));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Failed to update.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // update success.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Updated!')");
			script.println("location.href='joinpro.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>