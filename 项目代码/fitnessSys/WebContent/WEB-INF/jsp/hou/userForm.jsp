<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理页面</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
            	<h1 class="page-header">${user.auth==0?'管理员':(user.auth==1?'普通会员':'VIP会员')}${not empty user.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						${user.auth==0?'管理员':(user.auth==1?'普通会员':'VIP会员')}${not empty user.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/user/save" method="post" enctype="multipart/form-data">
                            		<input class="form-control" type="hidden" name="id" value="${user.id}">
									<input name="auth" type="hidden" id="inputauth" class="form-control" required="required" value="${user.auth}" placeholder=""/>
									<div class="form-group">
										<label for="inputphone">手机号</label>
										<input name="phone" type="number" id="inputphone" class="form-control" required="required" value="${user.phone}" placeholder="手机号"/>
									</div>
									<div class="form-group">
										<label for="inputname">姓名</label>
										<input name="name" type="text" id="inputname" class="form-control" required="required" value="${user.name}" placeholder="姓名"/>
									</div>
									<div class="form-group">
										<label for="inputgender">性别</label>
										<select name="gender" type="text" id="inputgender" class="form-control" required="required" value="${user.gender}" placeholder="性别">
											<option value="男" ${user.gender == '男'?'selected':''}>男</option>
											<option value="女" ${user.gender == '女'?'selected':''}>女</option>
										</select>
									</div>
									<c:if test="${user.auth != 0 }">
									<div class="form-group">
										<label for="inputautograph">签名</label>
										<textarea name="autograph" rows="4" id="inputautograph" class="form-control">${user.autograph}</textarea>
									</div>
									</c:if>
									<div class="form-group">
										<label for="inputbackground">头像</label>
										<c:if test="${!empty user.background }">
											<img src="/graduate/user/uploadImg?id=${user.id }" width="50" height="50" style="display:inline">
											<input name="uploadfile" type="file" id="inputbackground" style="width:82%;display:inline" class="form-control" value="${user.background}" placeholder="图书图片"/>
										</c:if>
										<c:if test="${empty user.background }">
											<input name="uploadfile" type="file" id="inputbackground" class="form-control" value="${user.background}" placeholder="图书图片"/>
										</c:if>
									</div>
									<div class="form-group">
										<label for="inputpassword">密码</label>
										<input name="password" type="text" id="inputpassword" class="form-control" required="required" value="${user.password}" placeholder="密码"/>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/user/list?auth=${user.auth }" class="btn btn-default">返回</a>
								</form>
							</div>
                            <!-- /.col-lg-6 (nested) -->
						</div>
                        <!-- /.row (nested) -->
					</div>
                    <!-- /.panel-body -->
				</div>
                <!-- /.panel -->
			</div>
            <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
</div>
</body>
</html>