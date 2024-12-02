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
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">留言</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-8 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:0px auto;">
               <div class="white-shadow">
               		<form action="/graduate/word/save" method="post" style="margin-top: 30px;">
               			<input type="hidden" name="id" class="form-control" value="${word.id }">
	                    <div class="col-lg-11" style="margin:20px auto;">
		                    <div class="form-group">
		                     	<textarea name="content" rows="8" id="inputcontent" class="form-control" required="required" >${word.content}</textarea>
	                        </div>
                        </div>
	                  	<button type="submit" class="btn btn-primary">提&nbsp;交</button>
						<a href="/graduate/word/index" class="btn btn-secondary" >返&nbsp;回</a>
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
