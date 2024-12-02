<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="../commom/userhead.jsp"%>
<!--contact -->
<section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
   <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">生成健身计划</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-8 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:0px auto;">
               <div class="white-shadow">
               		<form action="/graduate/plan/choice" method="post" style="margin-top: 30px;">
	                    <div class="col-lg-11" style="margin:20px auto;">
		                    <div class="form-group">
								<select name="gender" id="inputgender" class="form-control" required="required" onclick="selectGender()">
									<option value="" >选择性别</option>
									<option value="男" >男</option>
									<option value="女" >女</option>
								</select>
							</div>
							<div class="form-group">
								<input name="age" type="text" id="inputage" class="form-control" required="required" placeholder="输入年龄"/>
							</div>
							<div class="form-group">
								<input name="height" type="text" id="inputheight" class="form-control" required="required" placeholder="输入身高（cm）"/>
							</div>
							<div class="form-group">
								<input name="weight" type="text" id="inputweight" class="form-control" required="required" placeholder="输入体重（kg）"/>
							</div>
							<div class="form-group">
								<select name="type" id="inputtype" class="form-control" required="required">
									<option value="">选择健身目的</option>
									<option value="增肌">增肌</option>
									<option value="减脂">减脂</option>
								</select>
							</div>
							<div class="form-group" id="nanDiv">
								<select name="level" id="nanSelect" class="form-control">
									<option value="">您可以连续做标准俯卧撑几个？（运动强度）</option>
									<option value="1级">没测过或者1个都做不了（1级）</option>
									<option value="2级">15个以内（2级）</option>
									<option value="3级">15个以上（3级）</option>
								</select>
							</div>
							<div class="form-group" id="nvDiv" style="display:none">
								<select name="level2" id="nvSelect" class="form-control">
									<option value="">您可以连续做标准深蹲几个？要求顿至大腿与地面平齐（运动强度）</option>
									<option value="1级">没测过或徒手深蹲10个以内（1级）</option>
									<option value="2级">10-20个（2级）</option>
									<option value="3级">20个以上（3级）</option>
								</select>
							</div>
		                    <div class="form-group">
								<select name="place" id="inputplace" class="form-control" required="required">
									<option value="">选择健身方式</option>
									<option value="健身房">健身房</option>
									<option value="家庭健身">家庭健身</option>
								</select>
							</div>
                        </div>
                        <c:choose>
                        	<c:when test="${currentUser.auth == 1 && currentUser.flag == 1 }">
	                        	<button type="button" class="btn btn-primary" onclick="alert('您已生成过一次健身计划，再次生成需充值！')">生&nbsp;成</button>
	                        </c:when>
	                        <c:otherwise>
	                        	<button type="submit" class="btn btn-primary">生&nbsp;成</button>
	                        </c:otherwise>
                        </c:choose>
	               </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<script type="text/javascript">
	function selectGender() {
		var gender = $("#inputgender").val();
		if(gender == '女') {
			$("#nvDiv").show();
			$("#nanDiv").hide();
		} else {
			$("#nvDiv").hide();
			$("#nanDiv").show();
		}
	}
	
	
	//年龄范围失去焦点校验
	$('#inputage').blur(function() {
		var vl = this.value;
		if (vl > 80 || vl < 6 ) {
			alert('年龄不得大于80岁，不得小于6岁');
			$(this).val("");
			return;
		}
	});
</script>
<footer>
	<p>欢迎来到健身管理中心</p>
</footer>
</body>
</html>
