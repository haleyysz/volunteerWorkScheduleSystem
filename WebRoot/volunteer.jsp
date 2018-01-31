<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.entity.*"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Volunteer</title>
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
			@import "https://fonts.googleapis.com/css?family=Open+Sans:300,400";
			.badgescard,
			.firstinfo {
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.navbar{
				margin-bottom: 0px;
			}
			.Container{
				width: 100%;
			}
			.Main {
				font-family: 'Open Sans', sans-serif;
				width: 100%;
				min-height: 1000px;
				/* background: #009688; */
				background-image:url(http://cleancanvas.herokuapp.com/img/backgrounds/silver.jpg);
				background-size:100% 100%;
				background-repeat:no-repeat;
				font-size: 16px;
				overflow: hidden;
			}
			
			.content {
				position: relative;
				animation: animatop 0.9s cubic-bezier(0.425, 1.14, 0.47, 1.125) forwards;
			}
			
			.card {
				margin: 20px auto 20px auto;
				width: 500px;
				min-height: 200px;
				padding: 20px;
				border-radius: 3px;
				background-color: white;
				box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
				position: relative;
				overflow: hidden;
			}
			
			.card:after {
				content: '';
				display: block;
				width: 190px;
				height: 300px;
				background: cadetblue;
				position: absolute;
				animation: rotatemagic 0.75s cubic-bezier(0.425, 1.04, 0.47, 1.105) 1s both;
			}
			
			.badgescard {
				padding: 10px 20px;
				border-radius: 3px;
				background-color: #ECECEC;
				width: 480px;
				box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
				position: absolute;
				z-index: -1;
				left: 10px;
				bottom: 10px;
				animation: animainfos 0.5s cubic-bezier(0.425, 1.04, 0.47, 1.105) 0.75s forwards;
			}
			
			.badgescard span {
				font-size: 1.6em;
				margin: 0px 6px;
				opacity: 0.6;
			}
			
			.firstinfo {
				flex-direction: row;
				z-index: 2;
				position: relative;
			}
			
			.firstinfo img {
				border-radius: 50%;
				width: 120px;
				height: 120px;
			}
			
			.firstinfo .profileinfo {
				margin-top:-10px;
			}
			
			.firstinfo .profileinfo h1 {
				width:340px;
				height:30px;
				font-size: 1.8em;
				margin: 0px 0px 10px 0px;
			}
			
			.firstinfo .profileinfo h4 {
				width:280px;
				text-align:left;
				margin-left: 20px;
				font-size: 1.2em;
				color: #009688;
			}
			
			.firstinfo .profileinfo .bio1 {
				width:260px;
				height:20px;
				margin: 10px;
				text-align:left;
				color: #5A5A5A;
				line-height: 1.2;
				font-style: initial;
			}
			
			.firstinfo .profileinfo .bio2 {
				width:260px;
				height:20px;
				text-align:left;
				color: #5A5A5A;
				line-height: 1.2;
				font-style: initial;
			}
			
			.firstinfo .profileinfo .bio3 {
				width:200px;
				height:20px;
				text-align:left;
				margin-left: 26px;
				color: #5A5A5A;
				line-height: 1.2;
				font-style: initial;
			}
			
			.firstinfo .profileinfo span {
				color: #009688;
				font-size: 1.2em;
			}
			.firstinfo .profileinfo a {
				width: 70px;
				height: 30px;
				padding: 2px;
				color: #000000;
				border-radius:0;
				font-weight: bold;
				text-align: center;
				background: #FFFFFF;
				margin-bottom: -10px;
				vertical-align: middle;
				border: 2px solid #009688;
			}
			.firstinfo .profileinfo a:hover,
			.firstinfo .profileinfo a:focus {
				color: #FFFFFF !important;
				background: #009688 !important;
			}
			
			@keyframes animatop {
				0% {
					opacity: 0;
					bottom: -500px;
				}
				100% {
					opacity: 1;
					bottom: 0px;
				}
			}
			
			@keyframes animainfos {
				0% {
					bottom: 10px;
				}
				100% {
					bottom: -42px;
				}
			}
			
			@keyframes rotatemagic {
				0% {
					opacity: 0;
					transform: rotate(0deg);
					top: -24px;
					left: -253px;
				}
				100% {
					transform: rotate(-30deg);
					top: -24px;
					left: -78px;
				}
			}
		</style>
	</head>
	
	<c:choose>
	<c:when test="${empty volunteer}">
	<body>
		<div class="jumbotron">
		  <h1>Session has been invalidated!</h1>
		  <p>Dear volunteer, sorry about your session has been invalidated, you should log in again:</p>
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
					<div class="navbar username">
						<form action="logoutDao.do" method="post" class="navbar-text navbar-right">
							<input type="submit" value="log out" class="btn btn-default fine"/>
						</form>
						<p class="navbar-text navbar-right fine"> Welcome , <%=session.getAttribute("volunteer") %></p>
						<a class="navbar-text navbar-right fine" href="help.html">Help</a>
					</div>
				</div>
			</nav>
		</div>

		<div class="Container">
			<div class="Main">
			
			<div class="slider">
			  <!-- slides -->
			  <div class="slider__slides">
			    <div class="slide s--active">
			      <div class="slide__inner">
			        <div class="slide__content">
			          <h2 class="slide__heading">Welocme to Volunteer Work Schudule System</h2>
			          <p class="slide__text">Come and Join us!</p>
			        </div>
			      </div>
			    </div>
			    
			    <div class="slide">
			      <div class="slide__inner">
			        <div class="slide__content">
			          <h2 class="slide__heading">Canteen Services</h2>
			          <p class="slide__text">volunteer just signed it!</p>
			        </div>
			      </div>
			    </div>
			    <div class="slide">
			      <div class="slide__inner">
			        <div class="slide__content">
			          <h2 class="slide__heading">Referees</h2>
			          <p class="slide__text">Jane Doe just signed it!</p>
			        </div>
			      </div>
			    </div>
			    <div class="slide">
			      <div class="slide__inner">
			        <div class="slide__content">
			          <h2 class="slide__heading">Ticket Selling</h2>
			          <p class="slide__text">Anni Anderson just signed it!</p>
			        </div>
			      </div>
			    </div>
			    <div class="slide s--prev">
			      <div class="slide__inner">
			        <div class="slide__content">
			          <h2 class="slide__heading">Join Us</h2>
			          <p class="slide__text">Become an honorable volunteer now!</p>
			        </div>
			      </div>
			    </div>
			  </div>
			  <!-- slides end -->
			  <div class="slider__control">
			    <div class="slider__control-line"></div>
			    <div class="slider__control-line"></div>
			  </div>
			  <div class="slider__control slider__control--right m--right">
			    <div class="slider__control-line"></div>
			    <div class="slider__control-line"></div>
			  </div>
			</div>
			<script>
			    (function() {
			  var $slides = document.querySelectorAll('.slide');
			  var $controls = document.querySelectorAll('.slider__control');
			  var numOfSlides = $slides.length;
			  var slidingAT = 1300; // sync this with scss variable
			  var slidingBlocked = false;
			
			  [].slice.call($slides).forEach(function($el, index) {
			    var i = index + 1;
			    $el.classList.add('slide-' + i);
			    $el.dataset.slide = i;
			  });
			
			  [].slice.call($controls).forEach(function($el) {
			    $el.addEventListener('click', controlClickHandler);
			  });
			
			  function controlClickHandler() {
			    if (slidingBlocked) return;
			    slidingBlocked = true;
			
			    var $control = this;
			    var isRight = $control.classList.contains('m--right');
			    var $curActive = document.querySelector('.slide.s--active');
			    var index = +$curActive.dataset.slide;
			    (isRight) ? index++ : index--;
			    if (index < 1) index = numOfSlides;
			    if (index > numOfSlides) index = 1;
			    var $newActive = document.querySelector('.slide-' + index);
			
			    $control.classList.add('a--rotation');
			    $curActive.classList.remove('s--active', 's--active-prev');
			    document.querySelector('.slide.s--prev').classList.remove('s--prev');
			    
			    $newActive.classList.add('s--active');
			    if (!isRight) $newActive.classList.add('s--active-prev');
			    
			
			    var prevIndex = index - 1;
			    if (prevIndex < 1) prevIndex = numOfSlides;
			
			    document.querySelector('.slide-' + prevIndex).classList.add('s--prev');
			
			    setTimeout(function() {
			      $control.classList.remove('a--rotation');
			      slidingBlocked = false;
			    }, slidingAT*0.75);
			  };
			}());
			</script>
			<!-- program列表循环开始 -->
					<%
					if(request.getSession().getAttribute("volunteer") != null){
					
						programList programlist = new programList();
						ArrayList<program> list = programlist.getAllPrograms();
						if(list!=null&&list.size()>0){
							for(int i=0;i<list.size();i++){
							program pg = list.get(i);
										/* requestList requestlist = new requestList();
										ArrayList<request> listR = requestlist.findAllByPid(pg.getPid());
										if (listR != null && listR.size() > 0) {
											for (int j = 0; j < listR.size(); j++) {
												request r = listR.get(j); */
						%>
				<div class="content" style="z-index:1000;">
					<div class="card center-block">
						<div class="firstinfo"><img src="img/brand.jpg" />
							<div class="profileinfo">
								<h1><strong><%=pg.getPintro()%></strong></h1>
								<h4 class="glyphicon glyphicon-map-marker"> <%=pg.getPlocation()%></h4>
								<p class="bio1 glyphicon glyphicon-play"> <%=pg.getPdate()%> <%=pg.getPstart()%></p>
								<p class="bio2 glyphicon glyphicon-stop"> <%=pg.getPdate()%> <%=pg.getPend()%></p>
								<p class="bio3 glyphicon glyphicon-user"> <span><%=pg.getPnum()%></span> volunteers</p>
								<a class="bio4 btn"
								onclick="confirmRequest(<%=pg.getPid()%>,<%=session.getAttribute("vid") %>)" 
								data-toggle="modal" data-target="">Sign up</a>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 模态框（edit） -->
					<div class="modal fade" id="confirm-r" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Confirm Signing up</h4>
								</div>
								<div class="modal-body">Are you sure to sign up ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
									<button type="button" class="btn btn-primary">Yes</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					
				<!-- program列表循环结束 -->
					<%
								}
							}
						}
					%>	
			</div>
		</div>
		<div class="Footer"><p>Copyright © 2017 Shizheng Yang All rights reserved</p></div>
		<script>
			function confirmRequest(pid,vid) {
				var url = "addServlet.do";
				var data = {"pid": pid, "vid": vid}
				console.log(data);
				if (confirm("Confirm to sign up?")) {
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
				setTimeout(function(){
					if(confirm("Sign up successfully!")){
						window.location.reload(true);
					}
				},1000);
			}
/* 			window.location.reload(true);
 */		}
		</script>
	</body>
	</c:otherwise>
	</c:choose>

</html>