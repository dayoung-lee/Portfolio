<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
 <!-- import UserDAO -->
 <%@ page import = "user.User" %>
 <%@ page import = "user.UserDAO" %>
 <!-- PrintWriter -->
 <%@ page import = "java.io.PrintWriter" %>
  
 <!-- javaBeans -->
 <jsp:useBean id = "user" class = "user.User" scope = "page" />
 <jsp:setProperty name = "user" property ="*" />

  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<!-- css  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<title>Find password</title>
</head>

<body>
<%
	String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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

			<a class="navbar-brand" href="main.jsp">JSP</a>
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
			<li class = "welcome" style = "font-size:15px; color:#F08A8A">Sign in please</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="../login.jsp">Sign in</a></li>
						<li class="active"><a href="join.jsp">Sign up</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">						
						<li class="active"><a href="joinpro.jsp">My page</a></li>
						<li class="active"><a href="../logoutAction.jsp">Sign out</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>			
		</div>
	</nav>
	
	
		<div class="container">
			<div class="col-lg-4"></div>
				<div class="col-lg-4">
				<!--  jumbotron -->
				<div class="jumbotron" style="padding-top: 20px;">
					<form action = "findPwAction.jsp" method = "post">
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd;">
							<tr><th>ID</th>
							<td><input type = "text" name = "userID"/></td></tr>					
						</table>
						<input type = "submit" class = "btn btn-primary pull-right" value = "Find"/>
						<input type = "button" class = "btn btn-primary pull-left" onclick = "location.href='login.jsp'"value = "Back"/>						
					</form>
				</div>
			</div>
		</div>
			
			
	<!-- JQUERY animation -->
	<script src="../js/jquery-3.4.1.min.js"></script>
	<!-- JS bootstrap -->
	<script src="../js/bootstrap.js"></script>
</body>
</html>