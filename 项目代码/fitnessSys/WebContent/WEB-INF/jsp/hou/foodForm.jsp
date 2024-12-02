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
            	<h1 class="page-header">食物三大元素对照表</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						食物${not empty food.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/food/save" method="post">
                            		<input class="form-control" type="hidden" name="id" value="${food.id}">
									<div class="form-group">
										<label for="inputname">名称</label>
										<input name="name" type="text" id="inputname" class="form-control" required="required" value="${food.name}" placeholder="名称"/>
									</div>
									<div class="form-group">
										<label for="inputtype">类型</label>
										<select name="type" type="text" id="inputtype" class="form-control" required="required" value="${food.type}" placeholder="类型">
											<c:forEach items="${foodtypelist}" var="entry">
												<option value="${entry }" ${entry == food.type?'selected':''}>${entry }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="inputenergy">总能量（kcal）</label>
										<input name="energy" type="text" id="inputenergy" class="form-control" required="required" value="${food.energy}" placeholder="总能量（kcal）"/>
									</div>
									<div class="form-group">
										<label for="inputprotein">蛋白质（g）</label>
										<input name="protein" type="text" id="inputprotein" class="form-control" required="required" value="${food.protein}" placeholder="蛋白质（g）"/>
									</div>
									<div class="form-group">
										<label for="inputfat">脂肪（g）</label>
										<input name="fat" type="text" id="inputfat" class="form-control" required="required" value="${food.fat}" placeholder="脂肪（g）"/>
									</div>
									<div class="form-group">
										<label for="inputcarbohydrate">碳水化合物（g）</label>
										<input name="carbohydrate" type="text" id="inputcarbohydrate" class="form-control" required="required" value="${food.carbohydrate}" placeholder="碳水化合物（g）"/>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/food/list" class="btn btn-default">返回</a>
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