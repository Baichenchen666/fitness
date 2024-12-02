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
      <h3 class="title text-center mb-md-4 mb-sm-4 mb-3">健身计划介绍</h3>
      <div class="typo-grids">
      	<div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="sub-head mb-4">
                  <h4>训练计划</h4>
               </div>
               <c:if test="${!empty plan.proposal}">
               <div class="alert alert-light" role="alert">
                  ${plan.proposal}
               </div>
               </c:if>
               <c:if test="${!empty plan.rhythm}">
               <div class="alert alert-light" role="alert">
                  ${plan.rhythm}
               </div>
               </c:if>
               <div class="bd-example mb-4">
                   <table class="table">
                      <tbody>
                      	<c:forEach items="${pdlist}" var="planday">
                         <tr>
                            <th scope="row">
								${!empty planday.id?'Day':'' }${planday.day}
							</th>
							<td>
								${planday.act}
							</td>
							<td>
								<c:if test="${!empty planday.id}">
									${planday.groups}组*${planday.number}次
									组间休息${planday.secs}秒 
								</c:if>
							</td>
                         </tr>
                         </c:forEach>
                      </tbody>
                   </table>
                </div>
            </div>
         </div>
      
      	<div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="sub-head mb-4">
                  <h4>饮食建议</h4>
               </div>
               <div class="alert alert-light" role="alert">
                 	 建议您目前每日摄入<strong> ${calorie} </strong>卡路里，碳水<strong> ${carbohydrate } </strong>克，
                 	 蛋白质<strong> ${protein } </strong>克，脂肪<strong> ${fat } </strong>克。
                    <br>${content}
               </div>
            </div>
         </div>
      
         <div class="typo-grids pt-md-4 pt-sm-4 pt-4">
            <div class="sub-title">
               <div class="sub-head mb-4">
                  <h4>食物三大元素对照表</h4>
               </div>
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
                      	<c:forEach items="${foodlist}" var="food">
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