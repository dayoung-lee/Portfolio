<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<!-- css  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<title>JSP - Sign In</title>
</head>
<body>
	<!-- navigation  -->
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
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../main.jsp">Main</a></li>				
				<li><a href="../bbs.jsp">Board</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" 
				role="button" aria-haspopup="true" aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">Sign in</a></li>
						<li class ="active"><a href="../join/join.jsp">Sign up</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>
	
	
	<!-- login form -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- jumbotron -->
			<div class="jumbotron" style="padding-top: 20px;">
			
				<!-- post method -->
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">Sign in</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Id"
							name="userID" maxlength="20">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="Password"
							name="userPassword" maxlength="20">
					</div>
					<input type="button" class="btn btn-primary pull-left" onclick="location.href='findPassword.jsp'" value="Forgot password?">
					<input type="submit" class="btn btn-primary pull-right" value="Sign in">
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
