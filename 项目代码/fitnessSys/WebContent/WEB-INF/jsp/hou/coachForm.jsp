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
            	<h1 class="page-header">健身教练${not empty coach.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						健身教练${not empty coach.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/coach/save" method="post" enctype="multipart/form-data">
                            		<input class="form-control" type="hidden" name="id" value="${coach.id}">
                            		<input class="form-control" type="hidden" name="num" value="${coach.num}">
									<div class="form-group">
										<label for="inputname">教练姓名</label>
										<input name="name" type="text" id="inputname" class="form-control" required="required" value="${coach.name}" placeholder="教练姓名"/>
									</div>
									<div class="form-group">
										<label for="inputgender">性别</label>
										<select name="gender" type="text" id="inputgender" class="form-control" required="required" value="${coach.gender}" placeholder="性别">
											<option value="男" ${coach.gender == '男'?'selected':''}>男</option>
											<option value="女" ${coach.gender == '女'?'selected':''}>女</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputphone">联系方式</label>
										<input name="phone" type="number" id="inputphone" class="form-control" required="required" value="${coach.phone}" placeholder="联系方式"/>
									</div>
									<div class="form-group">
										<label for="inputtype">教练类型</label>
										<select name="type" type="text" id="inputtype" class="form-control" required="required" value="${coach.type}" placeholder="性别">
											<option value="增肌" ${coach.type == '增肌'?'selected':''}>增肌</option>
											<option value="减脂" ${coach.type == '减脂'?'selected':''}>减脂</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputinfo">个人成就</label>
										<textarea name="info" rows="4" id="inputinfo" class="form-control" required="required" >${coach.info}</textarea>
									</div>
									<div class="form-group">
										<label for="inputbackground">头像</label>
										<c:if test="${!empty coach.background }">
											<img src="/graduate/coach/uploadImg?id=${coach.id }" width="50" height="50" style="display:inline">
											<input name="uploadfile" type="file" id="inputbackground" style="width:82%;display:inline" class="form-control" value="${coach.background}" placeholder="图书图片"/>
										</c:if>
										<c:if test="${empty coach.background }">
											<input name="uploadfile" type="file" id="inputbackground" class="form-control" value="${coach.background}" required="required" />
										</c:if>
									</div>
									<div class="form-group">
										<label for="inputqrcode">二维码</label>
										<c:if test="${!empty coach.qrcode }">
											<img src="/graduate/coach/uploadImg?id=${coach.id }&&flag=1" width="50" height="50" style="display:inline">
											<input name="uploadfile2" type="file" id="inputqrcode" style="width:82%;display:inline" class="form-control" value="${coach.qrcode}" placeholder="图书图片"/>
										</c:if>
										<c:if test="${empty coach.qrcode }">
											<input name="uploadfile2" type="file" id="inputqrcode" class="form-control" value="${coach.qrcode}" placeholder="图书图片"/>
										</c:if>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/coach/list" class="btn btn-default">返回</a>
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