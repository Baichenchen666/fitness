<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>留言信息</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">留言信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
            	<div class="panel panel-default">
                	<div class="panel-heading" style="height: 50px;">
                	</div>
					<!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
								<tr>
									<th>留言内容</th>
									<th>留言人</th>
									<th>回复内容</th>
									<th>回复人</th>
									<th>回复</th>
				                    <th style="width: 15%">操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${datalist}" var="word">
								<tr>
									<td>
										${word.content}
									</td>
									<td>
										${word.createname} ${word.createtime}
									</td>
									<td>
										${word.reply}
									</td>
									<td>
										${word.replyname} ${word.replytime}
									</td>
									<td>
										<a href="/graduate/word/getReply?id=${word.id}" role="button" class="btn btn-warning">回复</a>
									</td>
									<td>
										<a href="/graduate/word/delete?id=${word.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该留言信息吗？', this.href)">删除</a>
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