<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>英语听说教学平台</title>
</head>
<body>
<%@ include file="../commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	 <div id="page-wrapper">
          <div class="row">
              <div class="col-lg-12">
                  <h1 class="page-header">留言回复</h1>
              </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                         	 回复
                      </div>
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-12">
                                  <form role="form" action="/graduate/word/reply" method="post">
                                  	  <input class="form-control" type="hidden" name="id" value="${word.id }">
                                      <div class="form-group">
                                          <label>留言内容</label>
                                          <textarea class="form-control" rows="5" name="content" readonly>${word.content }</textarea>
                                      </div>
                                      <div class="form-group">
                                          <label>留言人</label>
                                          <input class="form-control" name="createname" value="${word.createname }" readonly>
                                      </div>
                                      <div class="form-group">
                                          <label>留言时间</label>
                                          <input class="form-control" name="createtime" value="${word.createtime }" readonly>
                                      </div>
                                      <div class="form-group">
                                          <label>回复内容</label>
                                          <textarea class="form-control" rows="5" name="reply">${word.reply }</textarea>
                                      </div>
                                      <button type="submit" class="btn btn-primary">提交</button>
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