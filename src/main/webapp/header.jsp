<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
					<li><a href="${pageContext.request.contextPath}/findOrder.do">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/showCart.do">购物车</a></li>
					<li><a href="${pageContext.request.contextPath}/getOrders.do">我的订单</a></li>
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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="default.jsp">首页</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="ul">
					<li><a
						href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=0">全部鲜花</a></li>
					<li><a
						href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=1">爱情鲜花</a></li>
					<li><a
						href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=2">节日鲜花</a></li>
					<li><a
						href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=3">毕业鲜花</a></li>
				</ul>
				<div class="navbar-form  navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" id="key"
							placeholder="请输入您要搜索的关键词">
					</div>
					<button type="submit" class="btn btn-default" onclick="searchKey()">搜索</button>
				</div>
			</div>
		</div>
	</nav>
</div>

<script type="text/javascript">
	function searchKey(){
		var key = document.getElementById("key").value;
		url = "${pageContext.request.contextPath}/selectAllProductByPname.do?key="+key;
		url =  encodeURI(encodeURI(url));
		window.open(url);
	}
	//回车事件
	$("#key").keyup(function(){
		if(event.keyCode == 13){
			searchKey();
		}
	});
</script>