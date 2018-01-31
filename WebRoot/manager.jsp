<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
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
		<title>Manager</title>
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
		<style type="text/css">
			#program th,#program td{vertical-align: middle;}
			#request td{vertical-align: middle;}
		</style>
	</head>
	<c:choose>
	<c:when test="${empty manager}">
	<body>
		<div class="jumbotron" style="margin-top:100px;">
		  <h1>Session has been invalidated!</h1>
		  <p>Dear manager, sorry about your session has been invalidated, you should log in again:</p>
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
						<a class="navbar-brand" href="index.jsp">
							<img alt="Brand" class="img-rounded brand" src="img/brand.png">
						</a>
						<p class="navbar-text brand-text">Volunteer Work Schudule System</p>
					</div>
					<div class="username">
						<form action="logoutDao.do" method="post" class="navbar-text navbar-right">
							<input type="submit" value="log out" class="btn btn-default fine"/>
						</form>
						<p class="navbar-text navbar-right fine"> Welcome , <%=session.getAttribute("manager") %></p>
						<a class="navbar-text navbar-right fine" href="help.html">Help</a>
					</div>
			</nav>
		</div>

		<div class="Container">
			<div class="page-header">
				<h1>Manager Management Interface <small>Welcome :)</small></h1>
			</div>

			<div class="row affix-row">
				<div class="col-sm-3 col-md-2 affix-sidebar">
					<div class="sidebar-nav">
						<div class="navbar navbar-default" role="navigation">
							<div class="navbar-header"></div>
							<div class="navbar-collapse collapse sidebar-navbar-collapse menu">
								<ul id="myTab" class=" nav navbar-nav" id="sidenav01">
									<li role="presentation" class="active">
										<h4>Control Panel</h4>
									</li>
									<li role="presentation" class="active">
										<a href="#program" data-toggle="tab">
											<span class="glyphicon glyphicon-hand-right"></span> Manage Request
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="myTabContent" class="tab-content col-sm-9 col-md-10 affix-content well">
					<!--
						作者：1020170158@qq.com
						时间：2017-10-12
						描述：program
					-->
					<div class="container tab-pane fade in active" id="program">
					      <table class="table table-bordered table-striped">
					      <colgroup>
					        <col class="col-xs-1">
					        <col class="col-xs-2">
					        <col class="col-xs-1">
					        <col class="col-xs-2">
					        <col class="col-xs-2">
					        <col class="col-xs-2">
					        <col class="col-xs-2">
					        <col class="col-xs-2">
					      </colgroup>
					      <thead>
					      	  <th>Program ID</th>
					          <th>Program Description</th>
					          <th>Number of Volunteer Needed</th>
					          <th>Date</th>
					          <th>Start Time</th>
					          <th>End Time</th>
					          <th>Location</th>
					          <th>Operating</th>
					        </tr>
					      </thead>
					      <!-- program列表循环开始 -->
							<%
								programList programlist = new programList();
								ArrayList<program> list = programlist.getAllPrograms();
								if(list!=null&&list.size()>0){
									for(int i=0;i<list.size();i++){
									program pg = list.get(i);
							 %>
					      <tbody>
					        <tr>
					          <td><%=pg.getPid()%></td>
					          <td><%=pg.getPintro()%></td>
					          <td><%=pg.getPnum()%></td>
					          <td><%=pg.getPdate()%></td>
					          <td><%=pg.getPstart()%></td>
					          <td><%=pg.getPend()%></td>
					          <td><%=pg.getPlocation()%></td>
					          <td>
						      <div id="operate">
					          	<%-- <a onclick="cancelProgram(<%=pg.getPid()%>)" id="cancel" class="cancel<%=i%> glyphicon glyphicon-ban-circle cursor operate" title="Cancel"><%=pg.getIsCancel()%></a>
					          	&nbsp;&nbsp; --%>
					          	<a onclick="deleteProgram(<%=pg.getPid()%>)" class="glyphicon glyphicon-trash cursor operate" title="delete"></a>
					          	</div>
					          </td>
					        </tr>
					      </tbody>
					      <script>
					      	window.onload=function(){
						      		var arr = document.getElementsByClassName("cancel<%=i%>");
							      	var num = <%=pg.getIsCancel()%>;
							      	console.log(num);
							      	while(arr.length==<%=i%>){
							      	console.log(<%=i%>);
							      		if(num == 1){
											arr[<%=i%>].style.color ="#E6E6E6";
											arr[<%=i%>].style.pointerEvents ="none";
										}
						      		}
						      	}
						 </script>
					      <!-- program列表循环结束 -->
							<%
									}
								}
							 %>
					    </table>
					    <table class="table table-striped table-bordered">
						  	<tr><td>
						  		<a class="glyphicon glyphicon-plus cursor operate" title="add" data-toggle="modal" data-target="#add-v"><strong> Create a new program</strong></a>
						  	</td></tr>
						  </table>
					    
					    <!-- 模态框（add） -->
						<div class="modal fade bs-example-modal-lg" id="add-v" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						    <div class="modal-dialog modal-lg">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						                <h4 class="modal-title" id="myModalLabel"><strong>Create a new program</strong></h4>
						            </div>
						            <form action="creatProgramDao.do" method="post">
						            <div class="modal-body">
						            	<table class="table table-bordered table-striped">
									      <colgroup>
									        <col class="col-xs-2">
									        <col class="col-xs-1">
									        <col class="col-xs-2">
									        <col class="col-xs-2">
									        <col class="col-xs-2">
									        <col class="col-xs-3">
									      </colgroup>
									      <thead>
									          <th>Program Description</th>
									          <th>Volunteer Number</th>
									          <th>Date</th>
									          <th>Start Time</th>
									          <th>End Time</th>
									          <th>Location</th>
									        </tr>
									      </thead>
									      <tbody>
									        <tr>
									          <td><input type="text" name="pintro" class="form-control" id="recipient-name" placeholder="program description" required="required"/></td>
									          <td><input type="text" name="pnum" class="form-control" id="recipient-name" placeholder="num" required="required"/></td>
									          <td><input type="text" name="pdate" class="form-control" id="recipient-name" placeholder="date" required="required"/></td>
									          <td><input type="text" name="pstart" class="form-control" id="recipient-name" placeholder="start time" required="required"/></td>
									          <td><input type="text" name="pend" class="form-control" id="recipient-name" placeholder="end time" required="required"/></td>
									          <td><input type="text" name="plocation" class="form-control" id="recipient-name" placeholder="location" required="required"/></td>
									        </tr>
									      </tbody>
									    </table>
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						                <button type="submit" class="btn btn-primary">Submit</button>
						            </div>
						            </form>
						        </div><!-- /.modal-content -->
						    </div><!-- /.modal -->
						</div>
					</div>
				</div>
			</div>
			<div class="Footer"><p>Copyright © 2017 Shizheng Yang All rights reserved</p></div>
		<script>
		function cancelProgram(pid){
			var url = "cancelServlet.do";
			var data = "pid="+pid;
			console.log("data:"+data);
			if (confirm("Confirm to Cancel?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
						alert(data);
					}
				});
				window.location.reload(true);
			}
		}
			
		function deleteProgram(pid) {
			var url = "deleteServlet.do";
			var data = "pid="+pid;
			console.log("data:"+data);
			if (confirm("Confirm to Delete?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
						alert(data);
					}
				});
				window.location.reload(true);
			}
		}
		</script>
	</body>
	</c:otherwise>
	</c:choose>
</html>