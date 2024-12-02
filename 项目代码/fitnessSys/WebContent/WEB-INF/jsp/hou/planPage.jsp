<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身计划</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">健身计划</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
                	<div class="panel-heading" style="height: 50px;">
                    	<div class="pull-right">
	                        <a href="/graduate/plan/form" role="button" class="btn btn-primary btn-sm">新增</a>
	                        <button class="btn btn-primary btn-sm" onclick="deleteCheck('确认要删除这些健身计划吗？');">批量删除</button>
	                   	</div>
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th></th>
									<th>场所</th>
									<th>性别</th>
									<th>类型</th>
									<th>级数</th>
									<th style="width: 35%">建议</th>
									<th>健身节奏</th>
									<th>详细计划</th>
				                    <th style="width: 15%">操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="plan">
								<tr>
									<td>
										<input type="checkbox" name="ck" value="${plan.id }">
									</td>
									<td>
										${plan.place}
									</td>
									<td>
										${plan.gender}
									</td>
									<td>
										${plan.type}
									</td>
									<td>
										${plan.level}
									</td>
									<td>
										${plan.proposal}
									</td>
									<td>
										${plan.rhythm}
									</td>
									<td>
										<a href="/graduate/planday/list?planid=${plan.id}" role="button" class="btn btn-info">详细</a>
									</td>
									<td>
					    				<a href="/graduate/plan/form?id=${plan.id}" role="button" class="btn btn-info">修改</a>
										<a href="/graduate/plan/delete?id=${plan.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该健身计划吗？', this.href)">删除</a>
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
<script type="text/javascript">
	function deleteCheck(message) {
		if (confirm(message)){
			var ids = "";
			$('input[name="ck"]:checked').each(function() {
				ids += $(this).val() + ",";         //this指当前点击的对象
			});
			window.location.href="/graduate/plan/deleteCheck?ids="+ids;
        }
	}
</script>