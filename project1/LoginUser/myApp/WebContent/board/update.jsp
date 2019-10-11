<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- PrintWriter -->
 <%@ page import = "java.io.PrintWriter" %>
 <%@ page import = "board.bbsDAO" %>
 <%@ page import = "board.bbs" %>
 <!-- import userDAO -->
<%@ page import="user.UserDAO"%>

<!-- javaBeans -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">

<!-- css -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">

<title>Update Page</title>
</head>
<body>	
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}				
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}		
		bbs Bbs = new bbsDAO().getBbs(bbsID);	
		UserDAO userDAO = new UserDAO();
		user = userDAO.getUserInfo(userID);
	%>
	<!-- navigation -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="../main.jsp">JSP</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../main.jsp">Main</a></li>
				<li><a href="../bbs.jsp">Board</a></li>
			</ul>
			
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
			<li class="welcome" style="font-size: 15px; color: #F08A8A">Sign in please</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="../login.jsp">Sign in</a></li>
						<li class="active"><a href="../join.jsp">Sign up</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
			<li class="welcome" style="font-size: 15px; color: #F08A8A">User:
					"<%=user.getUserID()%>", Welcome!
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="../join/joinpro.jsp">My page</a></li>	
						<li class="active"><a href="../logoutAction.jsp">Sign out</a></li>						
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	
	<!-- board -->
	<div class = "container">
		<div class = "row">
			<form method = "post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table class = "table table-striped"
					style = "text-align:center; border: 1px solid #dddddd">
					<thead>
					<tr>
						<th colspan="2"
							style ="background-color: #eeeeee; text-align: center;"> Update </th>
					</tr>
					</thead>
					<tbody>
						<tr>
						<td><input type = "text" class = "form-control" placeholder="Title" name = "bbsTitle" 
								maxlength="50" value = "<%=Bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
						<td><textarea class="form-control" placeholder="Title" name ="bbsContent" 
								maxlength = "2048" style="height: 350px;"><%=Bbs.getBbsContent() %>
								</textarea></td></tr>
					</tbody>
					</table>
					<button type = "submit" class = "btn btn-primary pull-right">Update</button>
			</form>
		</div>
	</div>
	<!-- JQUERY animation -->
	<script src="../js/jquery-3.4.1.min.js"></script>
	<!-- JS bootstrap  -->
	<script src="../js/bootstrap.js"></script>
</body>
</html>
