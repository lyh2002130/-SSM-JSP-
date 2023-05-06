<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body id="return-top">
	<div class="container-fluid">

		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp" />


		<div class="row" style="width: 1210px; margin: 0 auto;">


			<c:choose>
				<c:when test="${!empty PAGEBEAN.data}">
					<c:forEach var="product" items="${PAGEBEAN.data}">
						<div class="col-md-3"
							style="display: table-cell; text-align: center;">
							<a
								href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">
								<img src="${product.pimage}" width="200" height="200">
							</a>
							<p>
								<a
									href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}"
									style='color: green'>${product.pname}</a>
							</p>
							<p>
								<font color="#FF0000">商城价：&yen;${product.shop_price}</font>
							</p>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1>无商品</h1>
				</c:otherwise>
			</c:choose>


		</div>

		<!--分页 -->
		<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<ul class="pagination" style="text-align: center; margin-top: 10px;">


				<%--上一页图标--%>
				<c:choose>
					<c:when test="${PAGEBEAN.currPageNO == 1}">
						<li class="disabled"><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<%--当前页面不是第一页时，跳转时改变currPageNO属性--%>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=${param.cid}&currPageNO=${PAGEBEAN.currPageNO-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>



				<%--分页内容--%>
				<c:forEach var="i" begin="1" end="${PAGEBEAN.allPageNO}" step="1">
					<c:choose>
						<c:when test="${PAGEBEAN.currPageNO == i}">
							<li class="active"><a href="#">${i}</a></li>
						</c:when>
						<%--${param.cid} -> 请求地址栏的属性可通过param获取--%>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=${param.cid}&currPageNO=${i}">
									${i} </a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<%--下一页图标--%>
				<c:choose>
					<%--当前页面是最后一页时，下一页图标不可点击--%>
					<c:when test="${PAGEBEAN.currPageNO == PAGEBEAN.allPageNO}">
						<li class="disabled"><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<%--当前页面不是最后一页时，跳转时改变currPageNO属性--%>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=${param.cid}&currPageNO=${PAGEBEAN.currPageNO+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
		<!-- 分页结束 -->

		<!--商品浏览记录-->
		<div
			style="width: 1210px; margin: 0 auto; padding: 0 9px; border: 1px solid #ddd; border-top: 2px solid #999; height: 246px;">

			<h4 style="width: 50%; font: 14px/30px 微软雅黑">浏览记录</h4>
			<div style="clear: both;"></div>

			<div style="overflow: hidden;">


				<ul style="list-style: none;">
					<c:forEach var="img" items="${IMGS}">
						<li
							style="width: 150px; height: 216; float: left; margin: 0 8px 0 0; padding: 0 18px 15px; text-align: center;">
							<img src="${img}" width="130px" height="130px" />
						</li>
					</c:forEach>
				</ul>


			</div>
		</div>


		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />

	</div>

	<!--右侧悬浮框-->
	<jsp:include page="/fixed_box.jsp" />

</body>

</html>