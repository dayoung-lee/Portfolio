<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import bbsDAO -->
<%@ page import="board.bbsDAO"%>
<%@ page import="board.bbs"%>
<!-- PrintWriter -->
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update action</title>
</head>
<body>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		bbs Bbs = new bbsDAO().getBbs(bbsID);

		if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Fill in the blank')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			bbsDAO BbsDAO = new bbsDAO();
			int result = BbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Failed to update')");
				script.println("location.href = '../bbs.jsp'");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Updated!')");
				script.println("location.href = '../bbs.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>