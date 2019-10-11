<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<!-- css  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<title>JSP - Sign Up</title>
</head>
<body>
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
				<li><a href="main.jsp">Main</a></li>
				<li><a href="bbs.jsp">Board</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="../login/login.jsp">Sign in</a></li>
						<li class ="active"><a href="join.jsp">Sign up</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<!-- sign up form -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!--  jumbotron -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- post method -->
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">Sign up</h3>
					<div class="text-center">
						<div class="form-group">
							<input type="text" class="form-contol" placeholder="ID"
								name="userID" maxlength="20" style="width: 100%;">
						</div>
						<div class="form-group">
							<input type="password" class="form-contol" placeholder="Password"
								name="userPassword" maxlength="20" style="width: 100%;">
						</div>
						<div class="form-group">
							<input type="text" class="form-contol" placeholder="First Name"
								name="userFirstName" maxlength="20" style="width: 100%;">
						</div>
						<div class="form-group">
							<input type="text" class="form-contol" placeholder="Last Name"
								name="userLastName" maxlength="20" style="width: 100%;">
						</div>
						<div class="form-group">
							<input type="text" class="form-contol" placeholder="year"
								name="userbirthyy" maxlength="4" style="width: 28%; text-align:center;"> 
								<select name="userbirthmm">
								<option value="">month</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> 
							<input type="text" class="form-contol" placeholder="day"
								name="userbirthdd" maxlength="4" style="width: 30%; text-align:center;">
						</div>
						<div class="form-group">
							<input type="text" class="form-contol" placeholder="Email"
								name="userEmail" maxlength="45" style="width: 100%;">
						</div>
							<div class="form-group">
							<input type="text" class="form-contol" placeholder="Phone Number"
								name="userPhoneNumber" maxlength="45" style="width: 100%;">
						</div>
							<div class="form-group">
							<input type="text" class="form-contol" placeholder="Address"
								name="userAddress" maxlength="45" style="width: 100%;">
						</div>
						<input type="submit" class="btn btn-primary" value="Sign up">
					</div>
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