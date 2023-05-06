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
<!--自定义-->
<link rel="stylesheet" href="css/index.css" type="text/css" />
</head>

<body id="return-top">
	<div class="container-fluid">

		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp"></jsp:include>

		<!-- 轮播图 -->
		<div class="container-fluid">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 轮播图的中的小点 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- 轮播图的轮播图片 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="img/18_youflower_pc.jpg">
						<div class="carousel-caption">
							<!-- 轮播图上的文字 -->
						</div>
					</div>
					<div class="item">
						<img src="img/18_youflower_pc.jpg">
						<div class="carousel-caption">
							<!-- 轮播图上的文字 -->
						</div>
					</div>
					<div class="item">
						<img src="img/18_youflower_pc.jpg">
						<div class="carousel-caption">
							<!-- 轮播图上的文字 -->
						</div>
					</div>
				</div>

				<!-- 上一张 下一张按钮 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!--正在热卖 -->
		<div class="container-fluid">
			<div class="col-md-12">
				<h2>
					正在热卖&nbsp;&nbsp;<img src="img/title2.jpg" />
				</h2>
			</div>
			<div class="col-md-2"
				style="border: 1px solid #E7E7E7; border-right: 0; padding: 0; float: left">
				<img src="products/hao/changtu.png" width="110%" height="600"
					style="display: inline-block;" />
			</div>
			<div class="col-md-10">

				<c:choose>
					<%--如若有商品，!empty表示列表时，判断列表的长度是否大于0--%>
					<c:when test="${!empty HOT_PRODUCT_LIST}">
						<%--迭代--%>
						<c:forEach var="product" items="${HOT_PRODUCT_LIST}">
							<div class="col-md-3"
								style="text-align: center; height: 320px; padding: 10px 0px;">
								<a
									href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">
									<img src="${product.pimage}" width="86%" height="240"
									style="display: inline-block;">
								</a>
								<p style="margin-top: 16px;">
									<a
										href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">${product.pname}</a>
								</p>
								<p>
									<font color="#E4393C" style="font-size: 16px">&yen;${product.shop_price}</font>
								</p>
							</div>
						</c:forEach>
					</c:when>
					<%--若没有商品--%>
					<c:otherwise>
						<h1 style="text-align: center">暂无热门商品</h1>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

		<!-- 广告条 -->
		<div class="container-fluid">
			<img src="products/hao/ctu2.png" width="100%" />
		</div>

		<!-- 新品上市 -->
		<div class="container-fluid">
			<div class="col-md-12">
				<h2>
					新品上市&nbsp;&nbsp;<img src="img/title2.jpg" />
				</h2>
			</div>
			<div class="col-md-2"
				style="border: 1px solid #E7E7E7; border-right: 0; padding: 0; float: left">
				<img src="products/hao/left-02.jpg" width="110%" height="600"
					style="display: inline-block;" />
			</div>
			<div class="col-md-10">


				<c:choose>
					<c:when test="${!empty NEW_PRODUCT_LIST}">
						<c:forEach var="product" items="${NEW_PRODUCT_LIST}">
							<div class="col-md-3"
								style="text-align: center; height: 320px; padding: 10px 0px;">
								<a
									href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">
									<img src="${product.pimage}" width="86%" height="240"
									style="display: inline-block;">
								</a>
								<p style="margin-top: 16px;">
									<a
										href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">${product.pname}</a>
								</p>
								<p>
									<font color="#E4393C" style="font-size: 16px">&yen;${product.shop_price}</font>
								</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h1 style="text-align: center">暂无新品上市</h1>
					</c:otherwise>
				</c:choose>

			</div>
		</div>


		<!-- 特价商品 -->
		<div class="container-fluid">
			<div class="col-md-12">
				<h2>
					特价商品&nbsp;&nbsp;<img src="img/title2.jpg" />
				</h2>
			</div>
			<div class="col-md-2"
				style="border: 1px solid #E7E7E7; border-right: 0; padding: 0; float: left">
				<img src="products/hao/left-03.jpg" width="110%" height="600"
					style="display: inline-block;" />
			</div>
			<div class="col-md-10">

				<c:choose>
					<c:when test="${!empty BARGAIN_PRODUCT_LIST}">
						<c:forEach var="product" items="${BARGAIN_PRODUCT_LIST}">
							<div class="col-md-3"
								style="text-align: center; height: 320px; padding: 10px 0px;">
								<a
									href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">
									<img src="${product.pimage}" width="86%" height="240"
									style="display: inline-block;">
								</a>
								<p style="margin-top: 16px;">
									<a
										href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">${product.pname}</a>
								</p>
								<p>
									<font color="#E4393C" style="font-size: 16px">&yen;${product.shop_price}</font>
								</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h1 style="text-align: center">暂无特价商品</h1>
					</c:otherwise>
				</c:choose>

			</div>

			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>

		</div>

		<!--右侧悬浮框-->
		<jsp:include page="/fixed_box.jsp"></jsp:include>
	</div>
</body>

</html>