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
			<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">${coach.name }详细信息</h3>
			<div class="row blog-top-grids my-lg-5 my-md-4 my-3">
				<div class="col-lg-5 blog-w3l-right ">
					<img src="/graduate/coach/uploadImg?id=${coach.id }" class="img-fluid" alt="" style="width:350px;  height:450px">
				</div>
				<div class="col-lg-7 left-side-agile p-lg-4 p-md-4 p-3">

					<h4>${coach.name }</h4>
					<div class="row mt-2">
						<div class="col-md-2 col-sm-2 col-3 event-w3ls-date text-center">
							<h5>${coach.gender }</h5>
						</div>
						<div
							class="col-md-10 col-sm-10 col-9 event-w3ls-sub-txt text-left">
							<h4 class="mb-2">${coach.type }教练</h4>
						</div>
					</div>
					<p class="groom-right">${coach.info }</p>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<p>欢迎来到健身管理中心</p>
	</footer>
</body>
</html>
