<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import userDAO -->
<%@ page import="user.UserDAO"%>

<!-- javaBeans -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP - Main</title>
</head>

<body onload="printClock();">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		UserDAO userDAO = new UserDAO();
		user = userDAO.getUserInfo(userID);
	%>
	<!-- navigation  -->
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
				<li><a href="main.jsp">Main</a></li>
				<li><a href="bbs.jsp">Board</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="welcome" style="font-size: 15px; color: #F08A8A">Sign
					in please</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login/login.jsp">Sign in</a></li>
						<li class="active"><a href="join/join.jsp">Sign up</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="welcome" style="font-size: 15px; color: #F08A8A">User:
					"<%=user.getUserID()%>", Welcome!
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="join/joinpro.jsp">My page</a></li>
						<li class="active"><a href="login/logoutAction.jsp">Sign
								out</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	<!-- main form -->
	<div class="container">
		<div class="row">
			<br>
			<br> <img src="main.jpg" class="center"><br>
			<div id="date" class="center"
				style="width: 430px; height: 60px; color: #666; font-size: 50px;"></div>
			<div id="clock" class="center"
				style="width: 460px; height: 150px; color: #666; font-size: 90px;"></div>
		</div>
	</div>

	<!-- JQUERY animation -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<!-- JS bootstrap  -->
	<script src="js/bootstrap.js"></script>
	<!-- clock&date JS -->
	<script src="js/clock.js"></script>
</body>
</html>