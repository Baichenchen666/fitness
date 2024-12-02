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
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">身体情况</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-8 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:0px auto;">
               <div class="white-shadow">
               		<form action="/graduate/body/save" method="post" style="margin-top: 30px;">
               			<input type="hidden" name="id" class="form-control" value="${body.id }">
               			<input type="hidden" name="userid" class="form-control" value="${currentUser.id }">
	                    <div class="col-lg-11" style="margin:20px auto;">
		                    <div class="form-group">
								<input name="height" type="text" id="inputheight" class="form-control" required="required" value="${body.height}" placeholder="身高"/>
							</div>
							<div class="form-group">
								<input name="weight" type="text" id="inputweight" class="form-control" required="required" value="${body.weight}" placeholder="体重"/>
							</div>
							<div class="form-group">
								<input name="bodyfat" type="text" id="inputbodyfat" class="form-control" required="required" value="${body.bodyfat}" placeholder="体脂率"/>
							</div>
							<div class="form-group">
								<input name="bmi" type="text" id="inputbmi" class="form-control" required="required" value="${body.bmi}" placeholder="BMI指数"/>
							</div>
							<div class="form-group">
								<input name="bust" type="text" id="inputbust" class="form-control" required="required" value="${body.bust}" placeholder="胸围"/>
							</div>
							<div class="form-group">
								<input name="bigarm" type="text" id="inputbigarm" class="form-control" required="required" value="${body.bigarm}" placeholder="大臂围"/>
							</div>
							<div class="form-group">
								<input name="forearm" type="text" id="inputforearm" class="form-control" required="required" value="${body.forearm}" placeholder="小臂围"/>
							</div>
							<div class="form-group">
								<input name="waistline" type="text" id="inputwaistline" class="form-control" required="required" value="${body.waistline}" placeholder="腰围"/>
							</div>
							<div class="form-group">
								<input name="hipline" type="text" id="inputhipline" class="form-control" required="required" value="${body.hipline}" placeholder="臀围"/>
							</div>
							<div class="form-group">
								<input name="thigh" type="text" id="inputthigh" class="form-control" required="required" value="${body.thigh}" placeholder="大腿围"/>
							</div>
							<div class="form-group">
								<input name="shank" type="text" id="inputshank" class="form-control" required="required" value="${body.shank}" placeholder="小腿围"/>
							</div>
                        </div>
	                  	<button type="submit" class="btn btn-primary">提&nbsp;交</button>
						<a href="/graduate/body/index" class="btn btn-secondary" >返&nbsp;回</a>
	               </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<footer>
	<p>欢迎来到健身管理中心</p>
</footer>
</body>
</html>
