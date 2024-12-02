<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
<!--//meta tags ends here-->
<!--booststrap-->
<link href="/static/qian/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all">
<!--//booststrap end-->
<!-- font-awesome icons -->
<link href="/static/qian/css/fontawesome-all.min.css" rel="stylesheet"
	type="text/css" media="all">
<!-- //font-awesome icons -->
<link href="/static/qian/css/style.css" rel='stylesheet' type='text/css'
	media="all">
<!--//stylesheets-->
<link
	href="http://fonts.googleapis.com/css?family=Arimo:400,400i,700,700i"
	rel="stylesheet">
</head>
<body>
	<!--headder-->
	<div class="header-outs" id="home">
		<div class="header-w3layouts">
			<!--//navigation section -->
			<div class="headr-title">
				<div class="hedder-up">
					<h1>
						<a class="navbar-brand" href="#">SIX-GYM</a>
					</h1>
				</div>
				<c:if test="${!empty currentUser }">
				<div class="header-call">
					<c:if test="${currentUser.auth == 1 }">
						<img src="/static/qian/images/yh.png" width="100%" style="width: 20px">
					</c:if>
					<c:if test="${currentUser.auth == 2 }">
						<img src="/static/qian/images/hy.png" width="100%" style="width: 20px">
					</c:if>
		   			<h4>${currentUser.name }</h4>
		   		</div>
		   		</c:if>
				<div class="clearfix"></div>
			</div>
			<nav class="navbar navbar-expand-lg navbar-light">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse  nav-fill "
					id="navbarSupportedContent">
					<ul class="navbar-nav nav-pills nav-fill">
						<li class="nav-item"><a class="nav-link" href="/graduate/index">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a href="/graduate/coach/index"
							class="nav-link ">健身团队</a></li>
						<li class="nav-item"><a href="/graduate/video/index"
							class="nav-link ">健身视频</a></li>
						<c:if test="${!empty currentUser }">
						<li class="nav-item"><a href="/graduate/plan/index"
							class="nav-link ">健身方案</a></li>
						<c:if test="${currentUser.auth == '1' }">
						<li class="nav-item"><a href="#" onclick="alert('此模块是付费模块，必须VIP会员才能进入！')"
							class="nav-link ">线上训练营</a></li>
						</c:if>
						<c:if test="${currentUser.auth == '0' || currentUser.auth == '2' }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 线上训练营</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/graduate/coach/vip?type=增肌">增肌</a> 
								<a class="dropdown-item" href="/graduate/coach/vip?type=减脂">减脂</a>
							</div>
						</li>
						</c:if>
						<li class="nav-item"><a href="/graduate/food/index"
							class="nav-link ">食物元素对照</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 个人信息管理</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/graduate/user/person">个人信息</a> 
								<a class="dropdown-item" href="/graduate/body/index">会员身体情况</a>
								<c:if test="${currentUser.auth == '1' }">
								<a class="dropdown-item" href="/graduate/user/vip">VIP会员开通</a>
								</c:if>
							</div>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 留言板</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/graduate/word/form">留言</a> <a
									class="dropdown-item" href="/graduate/word/index">我的留言</a>
							</div>
						</li>
						</c:if>
						<c:if test="${empty currentUser }">
						<li class="nav-item"><a href="/graduate/userlogin"
							class="nav-link">登录</a></li>
						</c:if>
						<c:if test="${!empty currentUser }">
						<li class="nav-item"><a href="/graduate/userlogout"
							class="nav-link">退出</a></li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
	<!-- //Navigation-->
	<!--//headder-->
	<div class="inner_page-banner"></div>
	<!--//banner -->
	<!-- //Footer -->
	<!--js working-->
	<script src='/static/qian/js/jquery-2.2.3.min.js'></script>
	<!--//js working-->
	<!-- start-smoth-scrolling -->
	<script src="/static/qian/js/move-top.js"></script>
	<script src="/static/qian/js/easing.js"></script>
	
	<script src ="/static/hou/js/jquery-1.10.2.js"> </script>
    <script src ="/static/hou/js/jquery-migrate-1.2.1.js"> </script>
	<script src="/static/hou/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script>
         jQuery(document).ready(function ($) {
         	$(".scroll").click(function (event) {
         		event.preventDefault();
         		$('html,body').animate({
         			scrollTop: $(this.hash).offset().top
         		}, 900);
         	});
         });
 	    
 		//删除方法
 	    function confirmx(message, href) {
 	        if (confirm(message)){
 	        	window.location.href = href;
 	        }
 	        return false;
 	    }; 
      </script>
	<!-- start-smoth-scrolling -->
	<!-- here stars scrolling icon -->
	<!-- //here ends scrolling icon -->
	<!--bootstrap working-->
	<script src="/static/qian/js/bootstrap.min.js"></script>
	<!-- //bootstrap working-->
</body>
</html>