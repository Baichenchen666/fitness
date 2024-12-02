<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会员身体情况记录表</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">会员身体情况记录表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th>用户名</th>
									<th>身高</th>
									<th>体重</th>
									<th>体脂率</th>
									<th>BMI指数</th>
									<th>胸围</th>
									<th>大臂围</th>
									<th>小臂围</th>
									<th>腰围</th>
									<th>臀围</th>
									<th>大腿围</th>
									<th>小腿围</th>
									<th>记录时间</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="body">
								<tr>
									<td>
										${body.username}
									</td>
									<td>
										${body.height}
									</td>
									<td>
										${body.weight}
									</td>
									<td>
										${body.bodyfat}
									</td>
									<td>
										${body.bmi}
									</td>
									<td>
										${body.bust}
									</td>
									<td>
										${body.bigarm}
									</td>
									<td>
										${body.forearm}
									</td>
									<td>
										${body.waistline}
									</td>
									<td>
										${body.hipline}
									</td>
									<td>
										${body.thigh}
									</td>
									<td>
										${body.shank}
									</td>
									<td>
										${body.time}
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