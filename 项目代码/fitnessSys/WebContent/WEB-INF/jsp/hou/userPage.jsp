<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">${user.auth == 0?'管理员':(user.auth == 1?'普通会员':'vip会员') }信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
	            	<div class="panel panel-default">
	                	<div class="panel-heading" style="height: 50px;">
	                    	<div class="pull-right">
		                        <a href="/graduate/user/form?auth=${param.auth }" role="button" class="btn btn-primary btn-sm">新增</a>
		                   	</div>
	                	</div>
						<!-- /.panel-heading -->
	                    <div class="panel-body">
	                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                            <thead>
									<tr>
										<th>头像</th>
										<th>姓名</th>
										<th>手机号</th>
										<th>性别</th>
										<c:if test="${param.auth == 2 }">
										<th>vip会员支付方式</th>
										</c:if>
										<c:if test="${param.auth != 0 }">
										<th>签名</th>
										</c:if>
										<th>密码</th>
										<c:if test="${param.auth != 0 }">
										<th>身体情况</th>
										</c:if>
					                    <th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${datalist}" var="user">
									<tr>
										<td>
											<c:if test="${!empty user.background }">
												<img src="/graduate/user/uploadImg?id=${user.id }" width="50" height="50" style="display:inline">
											</c:if>
										</td>
										<td>
											${user.name}
										</td>
										<td>
											${user.phone}
										</td>
										<td>
											${user.gender}
										</td>
										<c:if test="${param.auth == 2 }">
										<td>
											${user.paytype}
										</td>
										</c:if>
										<c:if test="${param.auth != 0 }">
										<td>
											${user.autograph}
										</td>
										</c:if>
										<td>
											${user.password}
										</td>
										<c:if test="${param.auth != 0 }">
										<td>
											<a href="/graduate/body/list?userid=${user.id}" role="button" class="btn btn-warning">记录表</a>
										</td>
										</c:if>
										<td>
											<a href="/graduate/user/reset?id=${user.id}&auth=${param.auth }" role="button" class="btn btn-success">重置密码</a>
						    				<a href="/graduate/user/form?id=${user.id}&auth=${param.auth }" role="button" class="btn btn-info">修改</a>
											<a href="/graduate/user/delete?id=${user.id}&auth=${param.auth }" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
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