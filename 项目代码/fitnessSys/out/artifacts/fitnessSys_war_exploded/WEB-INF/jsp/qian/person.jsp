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
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">个人信息</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-8 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:0px auto;">
               <div class="white-shadow">
               		<form action="/graduate/user/save" method="post" style="margin-top: 30px;" enctype="multipart/form-data">
                      <div class="row agile-wls-contact-mid mb-lg-4 mb-3">
	                     <div class="col-lg-3" style="margin:20px auto;">
	                     	<c:if test="${empty currentUser.background }">
	                     	<img src="/static/qian/images/moren.jpeg" width="100%" style="display:inline">
	                     	</c:if>
	                     	<c:if test="${!empty currentUser.background }">
	                     	<img src="/graduate/user/uploadImg?id=${currentUser.id }" width="100%" style="display:inline">
							</c:if>
							<c:if test="${currentUser.auth == 1 }">
							<p style="margin-top: 20px;color: red; font-size: 18px;">您还不是VIP会员</p>
							</c:if>
							<c:if test="${currentUser.auth == 2 }">
							<p style="margin-top: 20px;color: blue; font-size: 18px;">您已是VIP会员</p>
							</c:if>
	                     </div>
	                     <div class="col-lg-8" style="margin:20px auto;">
		                    <input class="form-control" type="hidden" name="id" value="${currentUser.id}">
                        	<input class="form-control" type="hidden" name="flag" value="1">
							<input name="auth" type="hidden" id="inputauth" class="form-control" required="required" value="${currentUser.auth}" placeholder=""/>
							<div class="form-group">
								<input name="phone" type="number" id="inputphone" class="form-control" required="required" value="${currentUser.phone}" placeholder="手机号"/>
							</div>
							<div class="form-group">
								<input name="name" type="text" id="inputname" class="form-control" required="required" value="${currentUser.name}" placeholder="姓名"/>
							</div>
							<div class="form-group">
								<select name="gender" type="text" id="inputgender" class="form-control" required="required" value="${currentUser.gender}" placeholder="性别">
									<option value="男" ${currentUser.gender == '男'?'selected':''}>男</option>
									<option value="女" ${currentUser.gender == '女'?'selected':''}>女</option>
								</select>
							</div>
							<c:if test="${currentUser.auth != 0 }">
							<div class="form-group">
								<textarea name="autograph" rows="4" id="inputautograph" class="form-control">${currentUser.autograph}</textarea>
							</div>
							</c:if>
							<div class="form-group">
								<input name="uploadfile" type="file" id="inputbackground" class="form-control" value="${currentUser.background}"/>
							</div>
							<div class="form-group">
								<input name="password" type="text" id="inputpassword" class="form-control" required="required" value="${currentUser.password}" placeholder="密码"/>
							</div>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary">提&nbsp;&nbsp;交</button>
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
