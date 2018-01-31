<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.entity.*"%>
<%@ page import="util.*"%>
<%@ page import="java.sql.*"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Search Result</title>
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
<c:choose>
	<c:when test="${empty admin}">
	<body>
		<div class="jumbotron" style="margin-top:100px;">
		  <h1>Session has been invalidated!</h1>
		  <p>Dear administrator, sorry about your session has been invalidated, you should log in again:</p>
		  <p><a class="btn btn-primary btn-lg" href="index.jsp" role="button">Log In</a></p>
		</div>
	</body>
	</c:when>
	<c:otherwise>
<body>
	<div class="Header">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp"> <img alt="Brand"
						class="img-rounded brand" src="img/brand.png">
					</a>
					<p class="navbar-text brand-text">Volunteer Work Schudule
						System</p>
				</div>
				<div class="username">
					<form action="logoutDao.do" method="post"
						class="navbar-text navbar-right">
						<input type="submit" value="log out" class="btn btn-default fine" />
					</form>
					<p class="navbar-text navbar-right fine">
						Welcome ,
						<%=session.getAttribute("admin")%></p>
				</div>
			</div>
		</nav>
	</div>

	<div class="Container">
		<div class="page-header">
			<h1>
				Administrator Management Interface <small>Welcome :)</small>
			</h1>
		</div>

		<div class="row affix-row">
			<div class="col-sm-3 col-md-2 affix-sidebar">
				<div class="sidebar-nav">
					<div class="navbar navbar-default" role="navigation">
						<div class="navbar-header"></div>
						<div class="navbar-collapse collapse sidebar-navbar-collapse menu">
							<ul id="myTab" class=" nav navbar-nav" id="sidenav01">
								<li class="active">
									<h4>Control Panel</h4>
								</li>
								<li role="presentation" class="active"><a href="result"
									data-toggle="tab"> <span
										class="glyphicon glyphicon-hand-right"></span> Search Result
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="myTabContent" class="tab-content col-sm-9 col-md-10 affix-content well">
				<!--
						作者：1020170158@qq.com
						时间：2017-11-21
						描述：search
					-->
					<div class="container tab-pane fade in" id="result">
						<table class="table table-bordered table-striped" id="rTable">
							<colgroup>
								<col class="col-xs-1">
								<col class="col-xs-2">
								<col class="col-xs-2">
								<col class="col-xs-1">
								<col class="col-xs-1">
								<col class="col-xs-2">
								<col class="col-xs-1">
								<col class="col-xs-2">
							</colgroup>
							<thead>
								<th>ID</th>
								<th>Activity</th>
								<th>Date</th>
								<th>Start</th>
								<th>End</th>
								<th>Location</th>
								<th>Name</th>
								<th>Email</th>
							</thead>
							
							<!-- request 列表循环开始 -->
							<c:forEach items="${searchList}" var="r">
							<c:set var="vid" value="${r.vid}" />
							<c:set var="pid" value="${r.pid}" />
							<%-- <c:set var="tag" value="${r.getIsPass}" /> --%>
							<%
								String status = "";
								int vid = (int)pageContext.getAttribute("vid");
								int pid = (int)pageContext.getAttribute("pid");
								/* int tag = (int)pageContext.getAttribute("tag"); */
								
								volunteerList volunteerlist1 = new volunteerList();
									ArrayList<volunteer> list1 = volunteerlist1.findAllByVid(vid);
										if (list1 != null && list1.size() > 0) {
											for (int i = 0; i < list1.size(); i++) {
												volunteer vt = list1.get(i);
												
												programList programlist1 = new programList();
													ArrayList<program> list2 = programlist1.findAllByPid(pid);
													if (list2 != null && list2.size() > 0){
														for(int k=0;k < list2.size(); k++){
															program pg = list2.get(k);	
																																					
															/* if(tag == 1){
																status = "Passed";
																}else if(tag == 0){
																	status = "Unpassed";
															}	 */						
							%>					
							<tbody>
								<tr>
									<td>1</td>
									<td><%=pg.getPintro()%></td>
									<td><%=pg.getPdate()%></td>
									<td><%=pg.getPstart()%></td>
									<td><%=pg.getPend()%></td>
									<td><%=pg.getPlocation()%></td>
									<td><%=vt.getVname()%></td>
									<td><%=vt.getVemail()%></td>
								</tr>
							</tbody>
							<!-- request 列表循环结束 -->
							<%
											}
										}
									}
								}
							%>
							</c:forEach>
						</table>
				</div>
			</div>
		</div>
	</div>
	<div class="Footer"><p>Copyright © 2017 Shizheng Yang All rights reserved</p></div>
	</body>
</c:otherwise>
</c:choose>
</html>