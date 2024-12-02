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
			<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">健身视频</h3>
			<div class="agile-info-para">
				<div class="row contactright pb-lg-5 pb-md-4 pb-sm-3 pb-3">
                  <c:forEach items="${datalist}" var="video">
                  <div class="col-lg-4 col-md-4 contact-address-grid">
                     <div class="footer_grid_left">
                        <div class="contact_footer_grid_left text-center mb-3">
                           <h5> ${video.title}</h5>
                        </div>
                        <p>强度：${video.strength}&nbsp;&nbsp;&nbsp;器械：${video.apparatus}&nbsp;&nbsp;&nbsp;时长：${video.duration}分钟
                        <br>健身部位：${video.position }&nbsp;&nbsp;&nbsp;总消耗：${video.consume}
                        <br>简介：${video.info}</p>
                        <div class="text-center">
                        	<button type="button" class="btn btn-primary btn-sm" onclick="showUri('${video.id }','${currentUser.auth == 2?'1':'0' }')">观看视频</button>
                        </div>
                     </div>
                  </div>
                  </c:forEach>
               </div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
function showUri(id, flag) {
	if(flag == '0') {
		alert("开会员解锁全部视频");
	}
	var html = "<video src='/graduate/video/seeFile?id="+id+"&&flag="+flag+"&&viewflag=1' style='width:640px;height:480px' controls='controls'></video>"
	top.$.jBox(html,{title: null,width:'auto',buttons:false});
}
</script>
	<footer>
		<p>欢迎来到健身管理中心</p>
	</footer>
</body>
</html>
