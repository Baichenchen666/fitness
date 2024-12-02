<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="../commom/userhead.jsp"%>
<section class="testimonial py-lg-4 py-md-3 py-sm-3 py-3">
	<div class="container py-lg-5 py-md-5 py-sm-4 py-3">
		<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">健身团队</h3>
		<div class="row">
			<c:forEach items="${datalist}" var="coach">
			<!-- team-block -->
			<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 mb30 team-four-grids-w3layouts" style="margin-bottom: 20px;">
				<div data-aos="fade-up" class="team-block active">
					<div class="team-img">
						<a href="/graduate/coach/view?id=${coach.id }">
						<img class="img-fluid" src="/graduate/coach/uploadImg?id=${coach.id }" style="width:255px;  height:328px">
						</a>
					</div>
					<div class="team-content text-center">
						<h4 style="color:#111">${coach.name }</h4>
						<span class="pt-2" style="color: #111">${coach.type }教练</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>
<footer>
	<p>欢迎来到健身管理中心</p>
</footer>
</body>
</html>
