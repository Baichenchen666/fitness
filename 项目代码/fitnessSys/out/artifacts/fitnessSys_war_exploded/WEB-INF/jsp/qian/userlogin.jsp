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
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">登&nbsp;&nbsp;录</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-6 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:20px auto;">
               <div class="white-shadow">
               		<div class="text-wls-ser-bake">
                        <span class="fab fa-superpowers banner-icon" ></span>
                    </div>
               		<form action="#" method="post" id="login_form" style="margin-top: 30px;">
	                 <div class="col-lg-9" style="margin:20px auto;">
	                  <div class="row agile-wls-contact-mid mb-lg-4 mb-3">
	                     <div class="col-lg-12 col-md-12 form-group contact-forms">
	                        <input type="text" class="form-control" placeholder="手机号" name="phone">
	                     </div>
	                     <div class="col-lg-12 col-md-12 form-group contact-forms">
	                        <input type="text" class="form-control" placeholder="密码" name="password">
	                     </div>
	                  </div>
	                  </div>
	                  <div class="outs-agile-buttn mt-lg-3 mt-2">
                      	<a href="javascript:void(0)" onclick='login();'>登&nbsp;&nbsp;录</a> 
	                  	<a href="javascript:void(0)" onclick='gotoRegister();'>注&nbsp;&nbsp;册</a>
                      </div>
	               </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<script type="text/javascript">
   function login() {
       $.ajax({
           url:"/graduate/dologin",
           type:"POST",
           data:$("#login_form").serialize(),
           success:function (result) {
               if(result.code == 100){
           		window.location.href="/graduate/index";
               }else {
                   alert(result.extendInfo.login_error);
               }
           }

       });
   };
   
   function gotoRegister() {
       window.location.href= "/graduate/register";
   };
</script>
<footer>
	<p>欢迎来到健身管理中心</p>
</footer>
</body>
</html>
