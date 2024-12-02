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
      <h3 class="title text-center mb-md-4 mb-sm-4 mb-3">食物三大元素对照表</h3>
      <div class="typo-grids">
         <div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="bd-example mb-4">
                   <table class="table">
                      <thead>
                         <tr>
                            <th scope="col">名称</th>
                            <th scope="col">类型</th>
                            <th scope="col">总能量（kcal）</th>
                            <th scope="col">蛋白质（g）</th>
                            <th scope="col">脂肪（g）</th>
                            <th scope="col">碳水化合物（g）</th>
                         </tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${datalist}" var="food">
                         <tr>
                            <th scope="row">
								${food.name}
							</th>
							<td>
								${food.type}
							</td>
							<td>
								${food.energy}
							</td>
							<td>
								${food.protein}
							</td>
							<td>
								${food.fat}
							</td>
							<td>
								${food.carbohydrate}
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