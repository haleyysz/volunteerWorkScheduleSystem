<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.entity.*"%>
<%@ page import="util.*"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Admin</title>
<link rel="shortcut icon" type="image/x-icon" href="img/volunteer.ico"
	media="screen" />
<!--浏览器小图标-->
<link rel="Bookmark" href="img/volunteer.ico" />
<!--收藏夹显示图标-->
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/stylesheet.css" />
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
					<a class="navbar-text navbar-right fine" href="help.html">Help</a>
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
								<li role="presentation" class="active"><a href="#volunteer"
									data-toggle="tab"> <span
										class="glyphicon glyphicon-hand-right"></span> Manage Volunteer
								</a></li>
								<li role="presentation"><a href="#manager"
									data-toggle="tab"> <span
										class="glyphicon glyphicon-hand-right"></span> Manage Manager
								</a></li>
								<li role="presentation"><a href="#request" data-toggle="tab"> <span
										class="glyphicon glyphicon-hand-right"></span> Manage Slots
								</a></li>
								<li role="presentation"><a href="#search" data-toggle="tab"> <span
										class="glyphicon glyphicon-hand-right"></span> Search Request
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div id="myTabContent" class="tab-content col-sm-9 col-md-10 affix-content well">
				<!--
						作者：1020170158@qq.com
						时间：2017-10-12
						描述：volunteer
					-->
				<div class="container tab-pane fade in active" id="volunteer">
					<table class="table table-bordered table-striped" id="vTable">
						<colgroup>
							<col class="col-xs-1">
							<col class="col-xs-2">
							<col class="col-xs-1">
							<col class="col-xs-1">
							<col class="col-xs-2">
							<col class="col-xs-3">
							<col class="col-xs-2">
						</colgroup>
						<thead>
							<th>ID</th>
							<th>Name</th>
							<th>Sex</th>
							<th>Age</th>
							<th>Tel</th>
							<th>Email</th>
							<th>Operation</th>
							</tr>
						</thead>
						<!-- volunteer列表循环开始 -->
						<%
							volunteerList volunteerlist = new volunteerList();
							ArrayList<volunteer> list = volunteerlist.getAllVolunteers();
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									volunteer vt = list.get(i);
						%>
						<tbody>
							<tr>
								<td><%=vt.getVid()%></td>
								<td><%=vt.getVname()%></td>
								<td><%=vt.getVsex()%></td>
								<td><%=vt.getVage()%></td>
								<td><%=vt.getVtel()%></td>
								<td><%=vt.getVemail()%></td>
								<td><a class="glyphicon glyphicon-pencil cursor operate"
									title="edit" data-toggle="modal" data-target="#edit-v"></a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="deleteV"
									onclick="deleteVolunteer(<%=vt.getVid()%>)"
									class="glyphicon glyphicon-trash cursor operate" title="delete"></a>
								</td>
								<%-- href="deleteServlet.do?action=deleteV&vid=<%= vt.getVid() %>" --%>
							</tr>
						</tbody>
						<!-- volunteer列表循环结束 -->
						<%
							}
							}
						%>
					</table>
					<table class="table table-striped table-bordered">
						<tr>
							<td><a class="glyphicon glyphicon-plus cursor operate"
								title="add" data-toggle="modal" data-target="#add-v"> <strong>Creat
										a new volunteer</strong></a></td>
						</tr>
					</table>

					<!-- 模态框（add） -->
					<div class="modal fade bs-example-modal-lg" id="add-v"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">
										<strong>Creat a new volunteer</strong>
									</h4>
								</div>
								<form action="creatVolunteerDao.do" method="post">
									<div class="modal-body">
										<table class="table table-bordered table-striped">
											<colgroup>
												<col class="col-xs-2">
												<col class="col-xs-2">
												<col class="col-xs-1">
												<col class="col-xs-1">
												<col class="col-xs-2">
												<col class="col-xs-3">
											</colgroup>
											<thead>
												<th>Username</th>
												<th>Password</th>
												<th>Sex</th>
												<th>Age</th>
												<th>Tel</th>
												<th>Email</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" name="vname"
														class="form-control" id="recipient-name"
														placeholder="username" required="required" /></td>
													<td><input type="password" name="vpassword"
														class="form-control" id="recipient-name"
														placeholder="password" required="required" /></td>
													<td><input type="text" name="vsex"
														class="form-control" id="recipient-name" placeholder="sex" /></td>
													<td><input type="text" name="vage"
														class="form-control" id="recipient-name" placeholder="age" /></td>
													<td><input type="text" name="vtel"
														class="form-control" id="recipient-name" placeholder="tel" /></td>
													<td><input type="text" name="vemail"
														class="form-control" id="recipient-name"
														placeholder="email" required="required" /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<!-- 模态框（edit） -->
					<div class="modal fade" id="edit-v" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Hi</h4>
								</div>
								<div class="modal-body">XD</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Submit</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</div>

				<!--
						作者：1020170158@qq.com
						时间：2017-10-12
						描述：manager
				-->
				<div class="container tab-pane fade in" id="manager">
					<table class="table table-bordered table-striped">
						<colgroup>
							<col class="col-xs-1">
							<col class="col-xs-2">
							<col class="col-xs-1">
							<col class="col-xs-1">
							<col class="col-xs-2">
							<col class="col-xs-3">
							<col class="col-xs-2">
						</colgroup>
						<thead>
							<th>ID</th>
							<th>Name</th>
							<th>Sex</th>
							<th>Age</th>
							<th>Tel</th>
							<th>Email</th>
							<th>Operating</th>
							</tr>
						</thead>
						<!-- manager列表循环开始 -->
						<%
							managerList managerlist = new managerList();
							ArrayList<manager> listM = managerlist.getAllManagers();
							if (listM != null && listM.size() > 0) {
								for (int i = 0; i < listM.size(); i++) {
									manager mg = listM.get(i);
						%>
						<tbody>
							<tr>
								<td><%=mg.getMid()%></td>
								<td><%=mg.getMname()%></td>
								<td><%=mg.getMsex()%></td>
								<td><%=mg.getMage()%></td>
								<td><%=mg.getMtel()%></td>
								<td><%=mg.getMemail()%></td>
								<td><a class="glyphicon glyphicon-pencil cursor operate"
									title="edit" data-toggle="modal" data-target="#edit-m"></a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<a onclick="deleteManager(<%=mg.getMid()%>)"
									class="glyphicon glyphicon-trash cursor operate" title="delete"></a>
								</td>
							</tr>
						</tbody>
						<!-- manager列表循环结束 -->
						<%
								}
							}
						%>
					</table>
					<table class="table table-striped table-bordered add-m">
						<tr>
							<td><a class="glyphicon glyphicon-plus cursor operate"
								title="add" data-toggle="modal" data-target="#add-m"><strong> Create
									a new program manager</strong></a></td>
						</tr>
					</table>

					<!-- 模态框（add1） -->
					<div class="modal fade bs-example-modal-lg" id="add-m"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel"><strong>Create
									a new program manager</strong></h4>
								</div>
								<form action="creatManagerDao.do" method="post">
									<div class="modal-body">
										<table class="table table-bordered table-striped">
											<colgroup>
												<col class="col-xs-2">
												<col class="col-xs-2">
												<col class="col-xs-1">
												<col class="col-xs-1">
												<col class="col-xs-2">
												<col class="col-xs-3">
											</colgroup>
											<thead>
												<th>Username</th>
												<th>Password</th>
												<th>Sex</th>
												<th>Age</th>
												<th>Tel</th>
												<th>Email</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" name="mname"
														class="form-control" id="recipient-name"
														placeholder="username" required="required" /></td>
													<td><input type="password" name="mpassword"
														class="form-control" id="recipient-name"
														placeholder="password" required="required" /></td>
													<td><input type="text" name="msex"
														class="form-control" id="recipient-name" placeholder="sex" /></td>
													<td><input type="text" name="mage"
														class="form-control" id="recipient-name" placeholder="age" /></td>
													<td><input type="text" name="mtel"
														class="form-control" id="recipient-name" placeholder="tel" /></td>
													<td><input type="text" name="memail"
														class="form-control" id="recipient-name"
														placeholder="email" /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<!-- 模态框（edit） -->
					<div class="modal fade" id="edit-m" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Edit-m</h4>
								</div>
								<div class="modal-body">?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Submit</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
				<!--
						作者：1020170158@qq.com
						时间：2017-11-21
						描述：request
					-->
					<div class="container tab-pane fade in" id="request">
						
						<table class="table table-bordered table-striped" id="rTable">
							<colgroup>
								<col class="col-xs-1">
								<col class="col-xs-1">
								<col class="col-xs-1">
								<col class="col-xs-1">
								<col class="col-xs-1">
								<col class="col-xs-2">
								<col class="col-xs-1">
								<col class="col-xs-2">
								<col class="col-xs-1">
								<col class="col-xs-1">
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
								<th>isPassed</th>
								<th>Operation</th>
								</tr>
							</thead>
							<!-- request 列表循环开始 -->
							<%
								String status = "";
								
								requestList requestlist = new requestList();
									ArrayList<request> listR = requestlist.getAllRequests();
									if (listR != null && listR.size() > 0) {
										for (int j = 0; j < listR.size(); j++) {
											request r = listR.get(j);
															
												volunteerList volunteerlist1 = new volunteerList();
												ArrayList<volunteer> list1 = volunteerlist1.findAllByVid(r.getVid());
													if (list1 != null && list1.size() > 0) {
														for (int i = 0; i < list1.size(); i++) {
															volunteer vvt = list1.get(i);
															
															programList programlist1 = new programList();
															ArrayList<program> list2 = programlist1.findAllByPid(r.getPid());
																if (list2 != null && list2.size() > 0){
																	for(int k=0;k < list2.size(); k++){
																		program pg = list2.get(k);
										
															if(r.getIsPass()==1){
																	status = "Passed";
																}else if(r.getIsPass()==0){
																	status = "Unpassed";
																}			
							%>
							<tbody>
								<tr>
									<td><%=r.getRid()%></td>
									<td><%=pg.getPintro()%></td>
									<td><%=pg.getPdate()%></td>
									<td><%=pg.getPstart()%></td>
									<td><%=pg.getPend()%></td>
									<td><%=pg.getPlocation()%></td>
									<td><%=vvt.getVname()%></td>
									<td><%=vvt.getVemail()%></td>
									<td><%=status%></td>
									<td><a id="deleteR"
										onclick="deleteRequest(<%=r.getRid()%>)"
										class="glyphicon glyphicon-trash cursor operate" title="delete"></a>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a id="passR"
										href="javascript:sendEmail('<%=pg.getPid()%>','<%=vvt.getVemail()%>','<%=pg.getPintro()%>','<%=pg.getPlocation()%>','<%=pg.getPdate()%>','<%=pg.getPstart()%>','<%=vvt.getVname()%>')"
										class="glyphicon glyphicon-envelope cursor operate" title="pass"></a>
									</td>
								</tr>
							</tbody>
							<!-- request 列表循环结束 -->
							<%
													}
												}
											}
										}
									}
								}
							%>
						</table>
					</div>
					
					<!--
						作者：1020170158@qq.com
						时间：2017-11-21
						描述：search
					-->
					<div class="container tab-pane fade in" id="search">
					
						<!-- search -->
						<form action="searchRequest.do" method="post">
						<div id="custom-search-input" class=" col-md-8">
							<div class="search-group">
								<input type="text" id="keyword" name="vname" class="search-query form-control" placeholder=" Search Service Request" size="50" onkeyup="getMoreContents()" onblur="keywordBlur()" onfocus="getMoreContents()"/>
								<span class="input-group-btn">
									<button class="btn btn-danger" type="submit" onclick="return searchIsNull()">
										<span class=" glyphicon glyphicon-search"></span>
									</button>
									<script>
										function searchIsNull(){
											var obj = document.getElementById("keyword").value;
											if(obj == " "||obj == null){
												window.confirm("Please enter keyword!");
												return false;
											}
										}
									</script>
								</span>
							</div>
						</div>
						</form>
						
						<div id="popDiv">
							<table id="content_table" bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="0" class="cursor">
								<tbody id="content_table_body" class="tl">
									<!-- ajax显示search -->
								</tbody>
							</table>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>

	<div class="Footer"><p>Copyright © 2017 Shizheng Yang All rights reserved</p></div>
	<script>
		function deleteVolunteer(vid) {
			var url = "deleteServlet.do";
			var data = "vid=" + vid;
			console.log("data:" + data);
			if (confirm("Confirm to Delete?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
						console.log(data);
					}
				});
				window.location.reload(true);
			}
		}
		
		function deleteManager(mid) {
			var url = "deleteServlet.do";
			var data = "mid=" + mid;
			console.log("data:" + data);
			if (confirm("Confirm to Delete?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
						console.log(data);
					}
				});
				window.location.reload(true);
			}
		}
		function deleteRequest(rid) {
			var url = "deleteServlet.do";
			var data = "rid=" + rid;
			console.log("data:" + data);
			if (confirm("Confirm to Delete?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
						console.log(data);
					}
				});
				window.location.reload(true);
			}
		}
		function sendEmail(pid,email,pname,plocation,pdate,ptime,vname) {
			var url = "SendEmail.do";
			var data = {"pid":pid,
						"email":email,
						"pname":pname,
						"plocation":plocation,
						"pdate":pdate,
						"ptime":ptime,
						"vname":vname};
						console.log(data);
			if (confirm("Confirm to Email?")) {
				$.ajax({
					type : "POST",
					url : url,
					dataType : "json",
					data : data,
					async : true,
					success : function(data) {
					}
				});
				setTimeout(function(){
					if(confirm("Send successfully!")){
						window.location.reload(true);
					}
				},8000);
			}
		}
		
		var xmlHttp;
		//search ajax
		function getMoreContents(){
			var content = document.getElementById("keyword");
			if(content.value==""){
				clearContent();
				return;
			}
			xmlHttp = createXMLHttp();
			//传服务器
				var url = "search?keyword=" + escape(content.value);
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange = callback;
				xmlHttp.send(null);
		}
		
		function createXMLHttp(){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
			
			if(window.ActiveXObject){
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				if(!xmlHttp){
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
			return xmlHttp;
		}
		
		function callback(){
			//4 is complete
			if(xmlHttp.readyState == 4){
				//200:服务器响应成功
				//404:资源未找到
				//500:服务器内部错误
				if(xmlHttp.status == 200){
					var result = xmlHttp.responseText;
					var json = eval("("+result+")");
					//html展示数据
					console.log(json);
					setContent(json);
				}
			}
		}
		
		//设置关联数据
		function setContent(contents){
			clearContent();
			setLocation();
			var size = contents.length;
			for(var i=0;i<size;i++){
				var nextNode = contents[i];//json的第i个元素
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				td.setAttribute("border", "0");
				td.setAttribute("bgcolor", "#ffffff");
				td.onmouseover = function(){
					this.className = 'mouseOver';
				};
				td.onmouseout = function(){
					this.className = 'mouseOut';
				};
				td.onmousedown=function(){
				      document.getElementById("keyword").value = this.innerHTML;
				};
				td.onclick = function(){
				};
				var text = document.createTextNode(nextNode);
				td.appendChild(text);
				tr.appendChild(td);
				document.getElementById("content_table_body").appendChild(tr);
			}
		}
		
		//清空之前的内容
		function clearContent(){
			var contentTableBody = document.getElementById("content_table_body");
			var size = contentTableBody.childNodes.length;
			for(var i=size-1;i>=0;i--){
				contentTableBody.removeChild(contentTableBody.childNodes[i]);
			}
			document.getElementById("popDiv").style.border = "none";
		}
		
		//输入框时失去焦点时清空contents
		function keywordBlur(){
			clearContent();
		}
		
		//Content Location Setting
		function setLocation(){ 
		   //关联信息的显示位置要和输入框一致 
		   var content = document.getElementById("keyword"); 
		   var width = content.offsetWidth;//输入框的长度 
		   var left = content["offsetLeft"];//到左边框的距离 
		   var top = content["offsetTop"]+content.offsetHeight;//到顶部的距离(加上输入框本身的高度) 
		   //获得显示数据的div 
		   var popDiv = document.getElementById("popDiv"); 
		   /* popDiv.style.left = left + 100 +"px"; 
		   popDiv.style.top = top+"px";  */
		   popDiv.style.width = width+"px";
		   document.getElementById("content_table").style.width = width+"px"; 
		 } 
	</script>
</body>
</c:otherwise>
</c:choose>
</html>