<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>每项健身计划</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">详细健身计划</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
                	<div class="panel-heading" style="height: 50px;">
                	<span style="color: #999; ">RM：20kg的重量进行杠铃卧推，最多只能连续推8次就完全力竭，那么这20kg的重量对于该训练者的胸肌练习而言，就是8RM。</span>
                    	<div class="pull-right">
	                        <a href="/graduate/planday/form?planid=${param.planid }" role="button" class="btn btn-primary btn-sm">新增</a>
	                        <a href="/graduate/plan/list" role="button" class="btn btn-primary btn-sm">返回</a>
	                   	</div>
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th>第几天</th>
									<th>动作</th>
									<th>组数</th>
									<th>次数RM</th>
									<th>组间休息秒数</th>
				                    <th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="planday">
								<tr>
									<td>
										${planday.day}
									</td>
									<td>
										${planday.act}
									</td>
									<td>
										${planday.groups}
									</td>
									<td>
										${planday.number}
									</td>
									<td>
										${planday.secs}
									</td>
									<td>
					    				<a href="/graduate/planday/form?id=${planday.id}" role="button" class="btn btn-info">修改</a>
										<a href="/graduate/planday/delete?id=${planday.id}&&planid=${param.planid }" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该每项健身计划吗？', this.href)">删除</a>
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