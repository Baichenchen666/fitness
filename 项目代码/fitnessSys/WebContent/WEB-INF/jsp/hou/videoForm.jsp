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
            	<h1 class="page-header">健身视频${not empty video.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						健身视频${not empty video.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/graduate/video/save" method="post" enctype="multipart/form-data">
                            		<input class="form-control" type="hidden" name="id" value="${video.id}">
                            		<input class="form-control" type="hidden" name="num" value="${video.num}">
									<div class="form-group">
										<label for="inputtitle">视频名称</label>
										<input name="title" type="text" id="inputtitle" class="form-control" required="required" value="${video.title}" placeholder="视频名称"/>
									</div>
									<div class="form-group">
										<label for="inputstrength">强度</label>
										<select name="strength" type="text" id="inputstrength" class="form-control" required="required" value="${video.strength}" placeholder="强度">
											<option value="K1零基础" ${video.strength == 'K1零基础'?'selected':'' }>K1零基础</option>
											<option value="K2初学" ${video.strength == 'K2初学'?'selected':'' }>K2初学</option>
											<option value="K3进阶" ${video.strength == 'K3进阶'?'selected':'' }>K3进阶</option>
										</select>
									</div>
									<div class="form-group">
										<label for="inputapparatus">器械</label>
										<input name="apparatus" type="text" id="inputapparatus" class="form-control" required="required" value="${video.apparatus}" placeholder="器械"/>
									</div>
									<div class="form-group">
										<label for="inputapparatus">时长（分钟）</label>
										<input name="duration" type="number" id="inputduration" class="form-control" required="required" value="${video.duration}" placeholder="时长"/>
									</div>
									<div class="form-group">
										<label for="inputposition">健身部位</label>
										<input name="position" type="text" id="inputposition" class="form-control" required="required" value="${video.position}" placeholder="健身部位"/>
									</div>
									<div class="form-group">
										<label for="inputconsume">总消耗（卡路里）</label>
										<input name="consume" type="text" id="inputconsume" class="form-control" required="required" value="${video.consume}" placeholder="总消耗（卡路里）"/>
									</div>
									<div class="form-group">
										<label for="inputinfo">简介</label>
										<textarea name="info" rows="4" id="inputinfo" class="form-control" required="required" >${video.info}</textarea>
									</div>
									<div class="form-group">
										<label for="inputfull">上传完整视频</label>
										<c:if test="${!empty video.full }">
											<button type="button" class="btn btn-primary btn-sm" onclick="showUri('${video.id }',1)">查看完整视频</button>
											<input name="uploadfile" type="file" id="inputfull" class="form-control" value="${video.full}"/>
										</c:if>
										<c:if test="${empty video.full }">
											<input name="uploadfile" type="file" id="inputfull" class="form-control" value="${video.full}"/>
										</c:if>
									</div>
									<div class="form-group">
										<label for="inputpartial">上传部分视频</label>
										<c:if test="${!empty video.partial }">
											<button type="button" class="btn btn-primary btn-sm" onclick="showUri('${video.id }',0)">查看部分视频</button>
											<input name="uploadfile2" type="file" id="inputpartial" class="form-control" value="${video.partial}"/>
										</c:if>
										<c:if test="${empty video.partial }">
											<input name="uploadfile2" type="file" id="inputpartial" class="form-control" value="${video.partial}"/>
										</c:if>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/graduate/video/list" class="btn btn-default">返回</a>
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
<script type="text/javascript">
function showUri(id, flag) {
	var html = "<video src='/graduate/video/seeFile?id="+id+"&&flag="+flag+"' style='width:640px;height:480px' controls='controls'></video>"
	top.$.jBox(html,{title: null,width:'auto',buttons:false});
}
</script>
</body>
</html>