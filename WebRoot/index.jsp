<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Log In</title>
		<link rel="shortcut icon" type="image/x-icon" href="img/volunteer.ico" media="screen" />
		<!--浏览器小图标-->
		<link rel="Bookmark" href="img/volunteer.ico" />
		<!--收藏夹显示图标-->
		<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="css/stylesheet.css" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	</head>
	<body>
		<div class="Header">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp">
							<img alt="Brand" class="img-rounded brand" src="img/brand.png">
						</a>
						<p class="navbar-text brand-text">Volunteer Work Schedule System</p>
					</div>
					<div>
					<a class="navbar-text navbar-right fine" href="help.html" style="margin-right:20px">Help</a>
					</div>
				</div>
			</nav>
		</div>
		<div class="Container">
				<ul id="myPanel" class="nav nav-tabs nav-justified">
					<li role="presentation" class="active">
						<a href="#Volunteer" data-toggle="tab" class="bold">Volunteer</a>
					</li>
					<li role="presentation">
						<a href="#Admin" data-toggle="tab" class="bold">Admin</a>
					</li>
					<li role="presentation">
						<a href="#Manager" data-toggle="tab" class="bold">Manager</a>
					</li>
				</ul>
				<div class="Main">
				<div id="myPanelContent" class="tab-content">
					
					<div class="tab-pane fade in active" id="Volunteer">
						<div class="panel panel-deverse  center-block login-1">
						    <form action="loginDao.do" method="post"  class="form-signin">
								<h1 class="form-signin-heading">Sign In</h1>
								<input type="text" name="vname" class="form-control" placeholder="username" required="" autofocus="" >
								<input type="password" name="vpassword" class="form-control" placeholder="Password" required="">
								<button class="btn btn-lg btn-success btn-block login-btn center-block" type="submit">
									Sign In
								</button>
							</form>
						</div>
					</div>
					<div class="tab-pane fade" id="Admin">
						<div class="panel panel-deverse  center-block login-2">
						    <form action="loginDao.do" method="post"  class="form-signin">
								<h1 class="form-signin-heading" >Sign In</h1>
								<input type="text" name="adminUsername" class="form-control" placeholder="username" required="" autofocus="" >
								<input type="password" name="adminPassword" class="form-control" placeholder="Password" required="">
								<button class="btn btn-lg btn-danger btn-block login-btn center-block" type="submit">
									Sign In
								</button>
							</form>
						</div>
					</div>
					<div class="tab-pane fade" id="Manager">
						<div class="panel panel-deverse  center-block login-3">
						    <form action="loginDao.do" method="post" class="form-signin">
								<h1 class="form-signin-heading black" style="color: #000000;">Sign In</h1>
								<input type="text" name="mname" class="form-control" placeholder="username" required="" autofocus="" >
								<input type="password" name="mpassword" class="form-control" placeholder="Password" required="">
								<button class="btn btn-lg btn-default btn-block login-btn center-block" type="submit">
									Sign In
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="Footer"><p>Copyright © 2017 Shizheng Yang All rights reserved</p></div>
		<script>
			$('#myPanel a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
			})
		</script>
	</body>
</html>