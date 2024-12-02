<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身教练团体</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">健身教练团队</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
                	<div class="panel-heading" style="height: 50px;">
                    	<div class="pull-right">
	                        <a href="/graduate/coach/form" role="button" class="btn btn-primary btn-sm">新增</a>
	                   	</div>
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th>教练姓名</th>
									<th>性别</th>
									<th>联系方式</th>
									<th>教练类型</th>
									<th>头像</th>
									<th>二维码</th>
									<th>受欢迎度</th>
				                    <th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="coach">
								<tr>
									<td>
										${coach.name}
									</td>
									<td>
										${coach.gender}
									</td>
									<td>
										${coach.phone}
									</td>
									<td>
										${coach.type}
									</td>
									<td>
										<c:if test="${!empty coach.background }">
											<img src="/graduate/coach/uploadImg?id=${coach.id }" width="50" height="50" style="display:inline">
										</c:if>
									</td>
									<td>
										<c:if test="${!empty coach.qrcode }">
											<img src="/graduate/coach/uploadImg?id=${coach.id }&&flag=1" width="50" height="50" style="display:inline">
										</c:if>
									</td>
									<td>
										${coach.num}
									</td>
									<td>
					    				<a href="/graduate/coach/form?id=${coach.id}" role="button" class="btn btn-info">修改</a>
										<a href="/graduate/coach/delete?id=${coach.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该健身教练团体吗？', this.href)">删除</a>
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