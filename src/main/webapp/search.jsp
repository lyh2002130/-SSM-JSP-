<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店 | 搜索</title>
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

		<!-- 登录 注册 购物车... -->
		<div class="container-fluid">
			<div class="col-md-4" style="float: left">
				<a href="/"><img src="img/logo.jpg" /></a>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-3" style="padding-top: 20px; float: right">
				<ol class="list-inline">
					欢迎${!empty USER ? USER.username:"非会员"}光临：
					<c:choose>
						<%--若登录了--%>
						<c:when test="${!empty USER}">
							<li><a href="home.jsp">个人中心</a></li>
							<li><a
								href="${pageContext.request.contextPath}/addCart.do?num=0">购物车</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.do">退出</a></li>
						</c:when>

						<c:otherwise>
							<li><a href="login.jsp">登录</a></li>
							<li><a href="register.jsp">注册</a></li>
						</c:otherwise>
					</c:choose>

				</ol>
			</div>
		</div>

		<!-- 导航条 -->
		<div class="container-fluid">
			<div class="collapse navbar-collapse navbar-inverse"
				id="bs-example-navbar-collapse-1" style="text-align: center;">
				<div class="navbar-form" role="search">
					<div class="form-group">
						<input type="text" class="form-control" id="key"
							placeholder="${KEY}">
					</div>
					<button type="submit" class="btn btn-default" onclick="searchKey()">搜索</button>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			function searchKey(){
				var key = document.getElementById("key").value
				url = "${pageContext.request.contextPath}/selectAllProductByPname.do?key="+key
				url =  encodeURI(encodeURI(url))
				window.location.href = url
			}
			//回车事件
			$("#key").keyup(function(){
				if(event.keyCode == 13){
					searchKey();
				}
			});
		</script>

		<div class="row" style="width: 1210px; margin: 26px auto;">


			<c:choose>
				<c:when test="${!empty PRODUCTS}">
					<c:forEach var="product" items="${PRODUCTS}">
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
					<h1 style="text-align: center; color: red;">无商品</h1>
				</c:otherwise>
			</c:choose>


		</div>

		<!--分页 -->
		<div style="width: 500px; margin: 0 auto; margin-top: 50px;">
			<c:if test="${PAGE.isFirstPage == true}">
				<a class="btn btn-warning" role="button">首页</a>
			</c:if>
			<c:if test="${PAGE.isFirstPage == false}">
				<a class="btn btn-warning" role="button" href="javascript:void(0);"
					onclick="jump(${PAGE.firstPage})">首页</a>
			</c:if>
			<c:if test="${PAGE.hasPreviousPage == true}">
				<a class="btn btn-warning" role="button" href="javascript:void(0);"
					onclick="jump(${PAGE.prePage})">上一页</a>
			</c:if>
			<c:if test="${PAGE.hasPreviousPage == false}">
				<a class="btn btn-warning" role="button">上一页</a>
			</c:if>
			<c:if test="${PAGE.hasNextPage == true}">
				<a class="btn btn-warning" role="button" href="javascript:void(0);"
					onclick="jump(${PAGE.nextPage})">下一页</a>
			</c:if>
			<c:if test="${PAGE.hasNextPage == false}">
				<a class="btn btn-warning" role="button">下一页</a>
			</c:if>
			<c:if test="${PAGE.isLastPage == true}">
				<a class="btn btn-warning" role="button">尾页</a>
			</c:if>
			<c:if test="${PAGE.isLastPage == false}">
				<a class="btn btn-warning" role="button" href="javascript:void(0);"
					onclick="jump(${PAGE.lastPage})">尾页</a>
			</c:if>
			<label for="pageNum">跳转</label> <input type="text" id="pageNum"
				style="width: 50px;"> <label for="pageNum">页，共${PAGE.pageNum}/${PAGE.pages}页</label>
			<button class="btn btn-warning" type="submit" onclick="jumpPage()">确定</button>
		</div>

		<script type="text/javascript">
			function jump(page){
				var url = "${pageContext.request.contextPath}/selectAllProductByPname.do?key=${KEY}&startPage=" + page;
				url =  encodeURI(encodeURI(url));
				window.location.href = url;
			}
			function jumpPage(){
				var pageNum = document.getElementById("pageNum").value;
				var url = "${pageContext.request.contextPath}/selectAllProductByPname.do?key=${KEY}&startPage=" + pageNum;
				url =  encodeURI(encodeURI(url));
				window.location.href = url;
			}
		</script>

		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />


		<!--右侧悬浮框-->
		<jsp:include page="/fixed_box.jsp" />
</body>

</html>