<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>留言信息</title>
</head>
<body>
<%@ include file="../commom/userhead.jsp"%>
<section class="about-inner py-lg-4 py-md-3 py-sm-3 py-3">
   <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title text-center mb-md-4 mb-sm-4 mb-3">我的留言</h3>
      <div class="typo-grids">
         <div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="info-sub-w3 pb-lg-4 pb-md-3 pb-sm-3 pb-3" ><hr>
                <c:forEach items="${datalist}" var="word">
					<span style="margin-left: 35px;">
						<span style="color:#aaa">留言：</span>${word.content} （${word.createname} ${word.createtime}）
					</span><a href="/graduate/word/delete?id=${word.id}&&flag=1" onclick="return confirmx('确认要删除该留言信息吗？', this.href)" >删除</a>
					<c:if test="${!empty word.reply }">
					<p>
						<span style="color:#aaa;margin-left: 35px;">回复：</span>${word.reply} （${word.replyname} ${word.replytime}）
					</p>
					</c:if>
					<hr>
				</c:forEach>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<footer>
	<p>欢迎来到健身管理中心</p>
</footer>
</body>
</html>