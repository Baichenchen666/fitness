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
            	<h1 class="page-header">健身计划${not empty plan.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						健身计划${not empty plan.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/plan/save" method="post">
                            		<input class="form-control" type="hidden" name="id" value="${plan.id}">
									<div class="form-group">
										<label for="inputplace">场所</label>
										<select name="place" type="text" id="inputplace" class="form-control" required="required" value="${plan.place}">
											<option value="健身房" ${plan.place == '健身房'?'selected':''}>健身房</option>
											<option value="家庭健身" ${plan.place == '家庭健身'?'selected':''}>家庭健身</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputgender">性别</label>
										<select name="gender" type="text" id="inputgender" class="form-control" required="required" value="${plan.gender}" placeholder="性别">
											<option value="男" ${plan.gender == '男'?'selected':''}>男</option>
											<option value="女" ${plan.gender == '女'?'selected':''}>女</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputtype">类型</label>
										<select name="type" type="text" id="inputtype" class="form-control" required="required" value="${plan.type}">
											<option value="增肌" ${plan.type == '增肌'?'selected':''}>增肌</option>
											<option value="减脂" ${plan.type == '减脂'?'selected':''}>减脂</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputlevel">级数</label>
										<select name="level" type="text" id="inputlevel" class="form-control" required="required" value="${plan.level}">
											<option value="1级" ${plan.level == '1级'?'selected':''}>1级</option>
											<option value="2级" ${plan.level == '2级'?'selected':''}>2级</option>
											<option value="3级" ${plan.level == '3级'?'selected':''}>3级</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputproposal">建议</label>
										<textarea name="proposal" rows="4" maxlength="100"id="inputproposal" class="form-control">${plan.proposal }</textarea>
									</div>
									<div class="form-group">
										<label for="inputrhythm">健身节奏</label>
										<textarea name="rhythm" rows="4" maxlength="100"id="inputrhythm" class="form-control" >${plan.rhythm }</textarea>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/plan/list" class="btn btn-default">返回</a>
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