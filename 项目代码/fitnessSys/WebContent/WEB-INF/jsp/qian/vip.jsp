<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
</head>
<body>
	<%@ include file="../commom/userhead.jsp"%>
	<!--contact -->
	<section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
		<div class="container py-lg-5 py-md-4 py-sm-4 py-3">
			<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">VIP会员开通</h3>
			<div class="agile-info-para">
				<div class="row contact-wls-detail">
					<div class="col-lg-4 col-md-6 col-sm-12 w3layouts-service-list text-center gap-1"  style="margin: 10px auto">
						<form action="/graduate/user/pay" id="vipForm" method="post" style="margin-top: 30px;">
							<input class="form-control" type="hidden" name="id" value="${currentUser.id}">
							<div class="white-shadow">
								<div class="text-wls-ser-bake">
									<span class="fab fa-superpowers banner-icon"></span>
								</div>
								<div class="ser-inner-info">
									<h4>99元</h4>
									<div class="form-group">
										方式： <label> <input type="radio" name="yjtype"
											class="flat-red" checked value="微信钱包"> <img
											src="/static/qian/images/wx.jpg" alt="" height="35px"
											width="35px" />
										</label> <label> <input type="radio" name="yjtype"
											class="flat-red" value="支付宝"> <img
											src="/static/qian/images/zfb.png" alt="" height="35px"
											width="35px" />
										</label> <label> <input type="radio" name="yjtype"
											class="flat-red" value="银行卡"> <img
											src="/static/qian/images/yhk.jpg" alt="" height="35px"
											width="35px" />
										</label>
									</div>
								</div>
								<div class="outs-agile-buttn mt-lg-3 mt-2">
									<a href="#" onclick="pay();">立即支付</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function pay() {
			$("#vipForm").submit();
		}
	</script>
	<footer>
		<p>欢迎来到健身管理中心</p>
	</footer>
</body>
</html>
