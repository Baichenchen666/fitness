<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="../commom/userhead.jsp"%>
<section class="about-inner py-lg-4 py-md-3 py-sm-3 py-3">
   <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title text-center mb-md-4 mb-sm-4 mb-3">会员身体情况记录表</h3>
      <div class="pull-right">
         <a href="/graduate/body/form" role="button" class="btn btn-primary btn-sm">新增</a>
   	  </div>
      <div class="typo-grids">
         <div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="bd-example mb-4">
                   <table class="table">
                      <thead>
                         <tr>
                            <th scope="col">用户名</th>
							<th scope="col">身高</th>
							<th scope="col">体重</th>
							<th scope="col">体脂率</th>
							<th scope="col">BMI指数</th>
							<th scope="col">胸围</th>
							<th scope="col">大臂围</th>
							<th scope="col">小臂围</th>
							<th scope="col">腰围</th>
							<th scope="col">臀围</th>
							<th scope="col">大腿围</th>
							<th scope="col">小腿围</th>
							<th scope="col">记录时间</th>
		                    <th scope="col">操作</th>
                         </tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${datalist}" var="body">
							<tr>
								<th scope="row">
									${body.username}
								</th>
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
								<td>
				    				<a href="/graduate/body/form?id=${body.id}" >修改</a>
									<a href="/graduate/body/delete?id=${body.id}" onclick="return confirmx('确认要删除该记录吗？', this.href)">删除</a>
								</td>
							</tr>
						</c:forEach>
                      </tbody>
                   </table>
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