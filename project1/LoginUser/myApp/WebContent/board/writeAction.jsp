<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import bbsDAO javaBeans -->
<%@ page import = "board.bbsDAO" %>
<!-- PrintWriter -->
<%@ page import = "java.io.PrintWriter" %>

<!-- javaBeans --> 
<jsp:useBean id = "bbs" class = "board.bbs" scope = "page" />
<jsp:setProperty name = "bbs" property = "bbsTitle"/>
<jsp:setProperty name = "bbs" property = "bbsContent"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP - Board</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		// check user log in
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Sign in please.')");
			script.println("location.href = '../login.jsp'");
			script.println("</script>");			
		}else { 
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Fill in the blank.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				bbsDAO BbsDAO = new bbsDAO();
				int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				
				if(result == -1){					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('Failed to write')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='../bbs.jsp'");					
					script.println("</script>");
				}
			}
		}
	%>	
</body>
</html>