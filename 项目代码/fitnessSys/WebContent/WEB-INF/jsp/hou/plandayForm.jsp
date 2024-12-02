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
            	<h1 class="page-header">每项健身计划${not empty planday.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						每项健身计划${not empty planday.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/planday/save" method="post">
                            		<input class="form-control" type="hidden" name="id" value="${planday.id}">
                            		<input name="planid" type="hidden" value="${planday.planid}" placeholder="计划id"/>
									<div class="form-group">
										<label for="inputday">第几天</label>
										<input name="day" type="text" id="inputday" class="form-control" required="required" value="${planday.day}" placeholder="第几天"/>
									</div>
									<div class="form-group">
										<label for="inputact">动作</label>
										<input name="act" type="text" id="inputact" class="form-control" required="required" value="${planday.act}" placeholder="动作"/>
									</div>
									<div class="form-group">
										<label for="inputgroups">组数</label>
										<input name="groups" type="text" id="inputgroups" class="form-control" required="required" value="${planday.groups }" placeholder="组数"/>
									</div>
									<div class="form-group">
										<label for="inputnumber">次数RM</label>
										<input name="number" type="text" id="inputnumber" class="form-control" required="required" value="${planday.number }" placeholder="次数"/>
									</div>
									<div class="form-group">
										<label for="inputsecs">组间休息秒数</label>
										<input name="secs" type="text" id="inputsecs" class="form-control" required="required" value="${planday.secs }" placeholder="组间休息秒数"/>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/planday/list?planid=${planday.planid }" class="btn btn-default">返回</a>
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