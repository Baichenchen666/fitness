<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身视频</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">健身视频</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
                	<div class="panel-heading" style="height: 50px;">
                    	<div class="pull-right">
	                        <a href="/graduate/video/form" role="button" class="btn btn-primary btn-sm">新增</a>
	                   		<button class="btn btn-primary btn-sm" onclick="deleteCheck('确认要删除这些健身视频吗？');">批量删除</button>
	                   	</div>
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th></th>
									<th>视频名称</th>
									<th>强度</th>
									<th>器械</th>
									<th>时长</th>
									<th>健身部位</th>
									<th>完整视频</th>
									<th>部分视频</th>
									<th>观看次数</th>
				                    <th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="video">
								<tr>
									<td>
										<input type="checkbox" name="ck" value="${video.id }">
									</td>
									<td>
										${video.title}
									</td>
									<td>
										${video.strength}
									</td>
									<td>
										${video.apparatus}
									</td>
									<td>
										${video.duration }分钟
									</td>
									<td>
										${video.position}
									</td>
									<td>
										<c:if test="${!empty video.full }">
										<button type="button" class="btn btn-primary btn-sm" onclick="showUri('${video.id }',1)">查看完整视频</button>
										</c:if>
									</td>
									<td>
										<c:if test="${!empty video.partial }">
										<button type="button" class="btn btn-primary btn-sm" onclick="showUri('${video.id }',0)">查看部分视频</button>
										</c:if>
									</td>
									<td>
										${video.num}
									</td>
									<td>
					    				<a href="/graduate/video/form?id=${video.id}" role="button" class="btn btn-info">修改</a>
										<a href="/graduate/video/delete?id=${video.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该健身视频吗？', this.href)">删除</a>
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
	//弹出指定播放器窗口
function showUri(id, flag) {
	var html = "<video src='/graduate/video/seeFile?id="+id+"&&flag="+flag+"' style='width:640px;height:480px' controls='controls'></video>"
	top.$.jBox(html,{title: null,width:'auto',buttons:false});
}
function deleteCheck(message) {
    //弹出确认框，是否删除选中视频
	if (confirm(message)){
		var ids = "";
		$('input[name="ck"]:checked').each(function() {
			ids += $(this).val() + ",";         //this指当前点击的对象
		});
		window.location.href="/graduate/video/deleteCheck?ids="+ids;
       }
}
</script>