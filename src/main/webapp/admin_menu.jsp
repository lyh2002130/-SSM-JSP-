<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 左边内容 -->
<div id="left" class="left">
	<div id="logoDiv" class="logoDiv">
		<p id="logoTitle" class="logoTitle">
			<span style="font-size: 18px;">后台管理</span>
		</p>
	</div>
	<!-- 商品管理-->
	<div class="menu-title">商品管理</div>
	<a href="${pageContext.request.contextPath}/selectAllProduct.do"
		class="menu-item" style="color: #4f6b72; display: block;">－商品查询</a> <a
		href="${pageContext.request.contextPath}/add_product.jsp"
		class="menu-item" style="color: #4f6b72; display: block;">－商品添加</a>

	<!--进货管理 -->
	<div class="menu-title">进货管理</div>
	<a href="${pageContext.request.contextPath}/productBillList.do"
		class="menu-item" style="color: #4f6b72; display: block;">－进货查询</a> <a
		href="${pageContext.request.contextPath}/product_bill_add.jsp"
		class="menu-item" style="color: #4f6b72; display: block;">－新增进货</a>

	<!-- 订单管理-->
	<div class="menu-title">订单管理</div>
	<a href="${pageContext.request.contextPath}/selectAllOrder.do"
		class="menu-item" style="color: #4f6b72; display: block;">－订单查询</a>

	<!--信息管理 -->
	<div class="menu-title">信息管理</div>
	<a href="${pageContext.request.contextPath}/selectAllComments.do"
		class="menu-item" style="color: #4f6b72; display: block;">－评论管理</a>

	<!-- 用户管理-->
	<div class="menu-title">用户管理</div>
	<a href="${pageContext.request.contextPath}/selectAllUser.do"
		class="menu-item" style="color: #4f6b72; display: block;">－会员管理</a> <a
		href="${pageContext.request.contextPath}/admin_home.jsp"
		class="menu-item" style="color: #4f6b72; display: block;">－管理员中心</a>

</div>

<script>
	$(document).ready(function(){
		$(".left a").each(function(){
			$this = $(this);
			if($this[0].href == String(window.location)){
				$(".left a").removeClass("menu-item-active");
				$this.addClass("menu-item-active");
			}
		});
	});
</script>
