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
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">注&nbsp;&nbsp;册</h3>
      <div class="agile-info-para">
         <div class="row contact-wls-detail">
         	<div class="col-lg-6 col-md-12 col-sm-12 w3layouts-service-list text-center" style="margin:20px auto;">
               <div class="white-shadow">
               		<div class="text-wls-ser-bake">
                        <span class="fab fa-superpowers banner-icon" ></span>
                    </div>
               		<form action="#" method="post" id="register_form" style="margin-top: 30px;">
               			<input type="hidden" name="auth" class="form-control" value="1">
	                     <div class="col-lg-11" style="margin:20px auto;">
		                     <div class="row agile-wls-contact-mid mb-lg-4 mb-3">
	                           <div class="col-lg-12 col-md-12 form-group">
	                              <input type="number" name="phone" class="form-control" placeholder="手机号">
	                           </div>
	                         </div>
		                     <div class="row agile-wls-contact-mid mb-lg-4 mb-3">
		                       <div class="col-lg-6 col-md-6 form-group">
	                              <input type="text" class="form-control" placeholder="账号" name="name">
	                           </div>
	                           <div class="col-lg-6 col-md-6 form-group">
	                           		<select name="gender" type="text" id="inputgender" class="form-control" required="required" value="${user.gender}" placeholder="性别">
										<option value="男" ${user.gender == '男'?'selected':''}>男</option>
										<option value="女" ${user.gender == '女'?'selected':''}>女</option>
									</select>
	                           </div>
	                         </div>
	                         <div class="row agile-wls-contact-mid mb-lg-4 mb-3">
	                           <div class="col-lg-6 col-md-6 form-group">
	                               <input type="text" class="form-control" placeholder="密码" name="password">
	                           </div>
	                           <div class="col-lg-6 col-md-6 form-group">
	                               <input type="text" class="form-control" placeholder="确认密码" name="newPassword">
	                           </div>
	                         </div>
                         </div>
	                  <div class="outs-agile-buttn mt-lg-3 mt-2">
	                  	<a href="javascript:void(0)" onclick='register();'>注&nbsp;&nbsp;册</a>
	                  	<a href="javascript:void(0)" onclick='gotoLogin();'>登&nbsp;&nbsp;录</a> 
                      </div>
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
<script type="text/javascript">
	function register() {
        if(!validate()) {
            return false;
        }
        $.ajax({
            url:"/graduate/doRegister",
            type:"POST",
            data:$("#register_form").serialize(),
            success:function (result) {
            	if(result.code == 100){
            		alert("注册成功");
               		window.location.href="/graduate/index";
                }else {
                    alert(result.msg);
                }
            }
        });
    };

    function validate() {
        var inputName = $("input[name='name']").val();
        var inputPassword = $("input[name='password']").val();
        var inputNewPassword = $("input[name='newPassword']").val();
         if(inputName == '' || inputName == null) {
            alert("请输入用户名！");
            return false;
        }
        if(inputPassword == '' || inputPassword == null) {
            alert("请输入密码！");
            return false;
        }
        if(inputPassword != inputNewPassword) {
            alert("输入的两次密码不同，请重新输入！");
            return false;
        }
        return true;
    }

    function gotoLogin() {
        window.location.href= "/graduate/userlogin";
    };
</script>
</body>
</html>
