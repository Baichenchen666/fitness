<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
</head>
<body>
	<%@ include file="../commom/userhead.jsp"%>
	<section class="testimonial py-lg-4 py-md-3 py-sm-3 py-3">
		<div class="container py-lg-5 py-md-5 py-sm-4 py-3">
			<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">线上训练营</h3>
			<c:forEach items="${datalist}" var="coach">
			<div class="row blog-top-grids my-lg-5 my-md-4 my-3">
				<div class="col-lg-5 blog-w3l-right ">
					<img src="/graduate/coach/uploadImg?id=${coach.id }" class="img-fluid" alt="" style="width:350px;  height:450px">
				</div>
				<div class="col-lg-7 left-side-agile p-lg-4 p-md-4 p-3">

					<h2 style="margin-bottom: 20px;">${coach.name }</h2>
					<div class="row mt-2">
						<div class="col-md-2 col-sm-2 col-2 event-w3ls-date text-center">
							<h5>${coach.gender }</h5><span>${coach.gender == '男'?'male':'female' }</span>
						</div>
						<div class="col-md-4 col-sm-4 col-4 event-w3ls-sub-txt text-left">
							<h4 class="mb-2">${coach.type }教练</h4>
							<ul>
								<li><span class="fas fa-phone" aria-hidden="true"></span>${coach.phone }</li>
							</ul>
						</div>
						<div class="col-md-6 col-sm-6 col-6 text-left">
							<img src="/graduate/coach/uploadImg?id=${coach.id }&&flag=1" class="img-fluid" alt="" style="width:80px;  height:80px">
						</div>
					</div>
					<p class="groom-right">${coach.info }</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</section>
	<footer>
		<p>欢迎来到健身管理中心</p>
	</footer>
</body>
</html>
