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
<link rel="stylesheet" type="text/css"
	href="/static/qian/css/uncover.css" />
<!--stylesheets-->
<link href="/static/qian/css/style.css" rel='stylesheet' type='text/css'
	media="all">
<!--//stylesheets-->
<link href="/static/qian/css/css.css" rel="stylesheet">

</head>
<body>
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
			<!--//navigation section -->
		</div>
		<!--banner-->
		<div class="slides">
			<div class="slide slide--current two-img">
				<div class="slider-up">
					<h4>
						打造完美的身体
					</h4>
					<p>Create a perfect body</p>
				</div>
				<div class="slide__img"></div>
			</div>
				<div class="slide one-img">
					<div class="slider-up">
					<h4>
						淡泊名利，动静相济，劳逸适度。
					</h4>
					<p>Indifferent to fame and wealth, harmony between movement and quiet, moderate work and leisure.</p>
				</div>
				<div class="slide__img"></div>
			</div>
			<div class="slide three-img">
				<div class="slider-up">
					<h4>
						生命无止境，健身无极限。
					</h4>
					<p>Life is endless and fitness is unlimited.</p>
				</div>
				<div class="slide__img "></div>

			</div>
			<div class="clearfix"></div>
		</div>
		<ul class="pagination">
			<li><span class="pagination__item"> </span></li>
			<li><span class="pagination__item"> </span></li>
			<li><span class="pagination__item"> </span></li>
		</ul>
		<div class="clearfix"></div>
	</div>
	<section class="testimonial py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Our Clients</h3>
            <div id="carouselExampleControls" class="carousel slider" data-ride="carousel">
               <div class="carousel-inner text-center">
                  <div class="carousel-item active client-img py-lg-4 py-md-3 py-sm-3 py-2">
                     <div class="img-move">
                        <img class="img-fluid" src="/static/qian/images/t1.jpg" alt="">
                     </div>
                     <div class="client-matter pt-lg-4 pt-md-3 pt-3">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,delectus reiciendis maiores alias consequatur aut.maiores alias</p>
                        <h6 class="pt-lg-3 pt-2">Kelly West</h6>
                     </div>
                  </div>
                  <div class="carousel-item client-img py-lg-4 py-md-3 py-sm-3 py-2">
                     <div class="img-move">
                        <img class="img-fluid" src="/static/qian/images/t2.jpg" alt="">
                     </div>
                     <div class="client-matter pt-lg-4 pt-md-3 pt-3">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,delectus reiciendis maiores alias consequatur aut.maiores alias</p>
                        <h6 class="pt-lg-3 pt-2">Sunny Jack</h6>
                     </div>
                  </div>
                  <div class="carousel-item client-img py-lg-4 py-md-3 py-sm-3 py-2">
                     <div class="img-move">
                        <img class="img-fluid" src="/static/qian/images/t3.jpg" alt="">
                     </div>
                     <div class="client-matter pt-lg-4 pt-md-3 pt-3">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,delectus reiciendis maiores alias consequatur aut.maiores alias</p>
                        <h6 class="pt-lg-3 pt-2">jolly Deo</h6>
                     </div>
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
               </a>
               <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
      </section>
	<!--//banner-->
	<!--about -->
	<section class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
		<div class="container py-lg-5 py-md-5 py-sm-4 py-4">
			<div class="row agile-abt-info text-left">
				<div class="col-lg-6 agile-abt-info ">
					<h2>SIX-GYM您的健身管理专家</h2>
					<div class="info-sub-w3 pb-lg-4 pb-md-3 pb-sm-3 pb-3">
						<p>最专业的健身动作库：超过3000+动作</p>
						<p>最全面的健身计划库：超过500+计划</p>
					</div>
					<div class="info-sub-w3">
						<p>实现健康生活方式的第一步，是让更多的人先动起来，这是SIX-GYM创立的意义，帮助中国乃至全球更多的人更好的运动，是SIX-GYM 的使命
						SIX-GYM 作为一家全球化的运动科技公司，我们相信科技的力量，以数据为基础，不断钻研和专注前沿科技，持续为用户提供优质的运动解决方案，最终实现我们的愿景：</p>
					</div>
				</div>
				<div class="col-lg-6 abut-middle-grid">
					<div
						class="row text-center about-top-right mb-lg-4 mb-md-3 mb-sm-3">
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fab fa-slideshare banner-icon" aria-hidden="true"></span>
								</div>
								<div class="white-right">
									<h4>Weight left</h4>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fas fa-users banner-icon" aria-hidden="true"></span>
								</div>
								<div class="white-right">
									<h4>Build muscle</h4>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fas fa-bullhorn banner-icon"></span>
								</div>
								<div class="white-right">
									<h4>Level Up</h4>
								</div>
							</div>
						</div>
					</div>
					<div
						class="row text-center about-mid-right mb-lg-4 mb-md-3 mb-sm-3">
						<div class="col-lg-6 col-md-6 col-sm-6 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fab fa-superpowers banner-icon"></span>
								</div>
								<div class="white-right">
									<h4>Body improve</h4>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fas fa-bicycle banner-icon"></span>
								</div>
								<div class="white-right">
									<h4>Cardio fitness</h4>
								</div>
							</div>
						</div>
					</div>

					<div class="row text-center about-down-right">
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fab fa-cloudversify banner-icon"></span>
								</div>
								<div class="white-right">
									<h4>Protein plan</h4>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fab fa-whmcs banner-icon" aria-hidden="true"></span>
								</div>
								<div class="white-right">
									<h4>Stay fit</h4>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 fit-about-agile-grid">
							<div class="white-shadow rounded">
								<div class="white-left">
									<span class="fas fa-fire banner-icon" aria-hidden="true"></span>
								</div>
								<div class="white-right">
									<h4>Stretching</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //about -->
	<!--services -->
	<section class="statement py-lg-4 py-md-3 py-sm-3 py-3" id="statement">
		<div class="container py-lg-5 py-md-5 py-sm-4 py-4">
			<div class="w3ls-statement-list text-center">
				<h4>
					BECOME YOUR STRONGEST SELF<br> KEEP CALM AND WORK HARD
				</h4>
			</div>
		</div>
	</section>
	<!--//statement-->
	<footer>
         <p>欢迎来到健身教学管理系统</p>
      </footer>

	<script src='/static/qian/js/jquery-2.2.3.min.js'></script>
	<!--//js working-->
	<!-- For-Banner -->
	<script src="/static/qian/js/imagesloaded.pkgd.min.js"></script>
	<script src="/static/qian/js/anime.min.js"></script>
	<script src="/static/qian/js/uncover.js"></script>
	<script src="/static/qian/js/demo1.js"></script>
	<!-- //For-Banner -->
	<!--About OnScroll-Number-Increase-JavaScript -->
	<script src="/static/qian/js/jquery.waypoints.min.js"></script>
	<script src="/static/qian/js/jquery.countup.js"></script>
	<script>
         $('.counter').countUp();
     </script>
	<!-- //OnScroll-Number-Increase-JavaScript -->

	<!-- start-smoth-scrolling -->
	<script src="/static/qian/js/move-top.js"></script>
	<script src="/static/qian/js/easing.js"></script>
	<script>
         jQuery(document).ready(function ($) {
         	$(".scroll").click(function (event) {
         		event.preventDefault();
         		$('html,body').animate({
         			scrollTop: $(this.hash).offset().top
         		}, 900);
         	});
         });
    </script>
	<!-- start-smoth-scrolling -->
	<!--bootstrap working-->
	<script src="/static/qian/js/bootstrap.min.js"></script>
	<!-- //bootstrap working-->
</body>
</html>