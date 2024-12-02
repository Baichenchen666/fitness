<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>食物三大元素对照表</title>
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
                	<div class="panel-heading" style="height: 50px;">
                    	<div class="pull-right">
	                        <a href="/graduate/food/form" role="button" class="btn btn-primary btn-sm">新增</a>
	                   	</div>
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th>名称</th>
									<th>类型</th>
									<th>总能量（kcal）</th>
									<th>蛋白质（g）</th>
									<th>脂肪（g）</th>
									<th>碳水化合物（g）</th>
				                    <th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="food">
								<tr>
									<td>
										${food.name}
									</td>
									<td>
										${food.type}
									</td>
									<td>
										${food.energy}
									</td>
									<td>
										${food.protein}
									</td>
									<td>
										${food.fat}
									</td>
									<td>
										${food.carbohydrate}
									</td>
									<td>
					    				<a href="/graduate/food/form?id=${food.id}" role="button" class="btn btn-info">修改</a>
										<a href="/graduate/food/delete?id=${food.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该食物三大元素对照表吗？', this.href)">删除</a>
									</td>
								</tr>
							</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
	            </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->