<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- PrintWriter -->
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import = "board.bbsDAO" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "board.bbs" %>
  
 <!-- javaBeans -->
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property ="userID" /> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<!-- css  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP - Board</title>
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
			<li class = "welcome" style = "font-size:15px; color:#F08A8A">Sign in please</li>
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
			<li class = "welcome" style = "font-size:15px; color:#F08A8A">User: "<%=user.getUserID()%>", Welcome!</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">						
						<li class="active"><a href="join/joinpro.jsp">My page</a></li>
						<li class="active"><a href="login/logoutAction.jsp">Sign out</a></li>	
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<!-- board form -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No.</th>
						<th style="background-color: #eeeeee; text-align: center;">Title</th>
						<th style="background-color: #eeeeee; text-align: center;">User</th>
						<th style="background-color: #eeeeee; text-align: center;">Date</th>
					</tr>
				</thead>
				<tbody>
					<%
						bbsDAO BbsDAO = new bbsDAO();
						ArrayList<bbs> list = BbsDAO.getList(pageNumber);
						for(int i=0; i<list.size();i++){							
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="board/view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + ":"
							+ list.get(i).getBbsDate().substring(14, 16)%></td>
					</tr>				
					<%} %>						
				</tbody>
			</table>
			
			<!-- page icon -->
			<%
				if(pageNumber != 1){
			%>
			<a href = "bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
				class = "btn btn-success btn-arrow-left">prev</a>
			<%} if(BbsDAO.nextPage(pageNumber)){ %>
			<a href = "bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
				class="btn btn-success btn-arrow-left">next</a>
			<%} %>			
			
			<%
				if(userID != null){
			%>
				<a href = "./board/write.jsp" class ="btn btn-primary pull-right">write</a>
			<% } else { %>
				<button class = "btn btn-primary pull-right"
						onclick = "location.href = 'login/login.jsp'">write</button>
			<% } %>
		</div>
	</div>
	

	<!-- JQUERY animation -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<!-- JS bootstrap  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>
