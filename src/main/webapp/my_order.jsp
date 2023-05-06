<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店 | 我的订单</title>
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
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th {
	vertical-align: middle;
	text-align: center;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp" />

		<c:choose>
			<c:when test="${!empty list}">
				<div class="container">
					<div class="row">

						<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
							<strong style="font-size: 16px; margin: 5px 0;">我的订单</strong>
							<table class="table table-bordered">
								<tbody>
								<tr>
									<td>订单号：</td>
									<td>收货人姓名：</td>
									<td>收货人地址：</td>
									<td>联系电话：</td>
									<td>下单时间：</td>
									<td>商品详情：</td>
									<td>支付总额：</td>
									<td>订单状态：</td>
								</tr>

								<c:forEach items="${list}" var="OrderVo">
									<tr>
										<td>${OrderVo.oid}</td>
										<td>${OrderVo.receiver}</td>
										<td>${OrderVo.address}</td>
										<td>${OrderVo.tel}</td>
										<td>${OrderVo.time}</td>
										<td>
											<c:forEach var="orderItem" items="${OrderVo.orderItems}">
												<a href="${pageContext.request.contextPath}/findProductByPid.do?pid=${orderItem.pid}">
														${orderItem.product.pname}：${orderItem.product.shop_price} X ${orderItem.pay_count}
												</a></br>
											</c:forEach>
										</td>
										<td>${OrderVo.ototal}</td>
										<td>
											<c:if test="${OrderVo.ostate==0 }">
												<a class="btn btn-warning" onclick="pay(ototal=${OrderVo.ototal},oid=${OrderVo.oid})">
													未付款(点击去付款)
												</a>
												<a class="btn btn-danger" href="/deleteOrder.do?oid=${OrderVo.oid}">
													取消订单
												</a>
											</c:if>
											<c:if test="${OrderVo.ostate==1 }">
												<a class="btn btn-success" href="#" disabled>已付款(待发货)</a>
											</c:if>
											<c:if test="${OrderVo.ostate==2 }">
												<a class="btn btn-success" href="/orderOstate.do?oid=${OrderVo.oid}&ostate=2">确认收货</a>
											</c:if>
											<c:if test="${OrderVo.ostate==3 }">
												<a class="btn btn-success" href="/?oid=${OrderVo.oid}&ostate=3">点击评价</a>
											</c:if>
											<c:if test="${OrderVo.ostate==4 }">
												<a class="btn btn-success" disabled>已完成</a>
												<a class="btn btn-danger" href="/deleteOrder.do?oid=${OrderVo.oid}">
													删除订单
												</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
					</div>

				</div>
			</c:when>
			<c:otherwise>
				<center>
					<font style="font-size: 66px">购物车无订单</font>
				</center>
			</c:otherwise>
		</c:choose>
<div align="center">
	<!-- footer-->
	<div class="footer">
		<c:if test="${PAGE.isFirstPage == true}">
			<a class="btn btn-info" role="button">首页</a>
		</c:if>
		<c:if test="${PAGE.isFirstPage == false}">
			<a class="btn btn-info"
			   href="${pageContext.request.contextPath}/getOrders.do?startPage=${PAGE.firstPage}"
			   role="button">首页</a>
		</c:if>
		<c:if test="${PAGE.hasPreviousPage == true}">
			<a class="btn btn-info"
			   href="${pageContext.request.contextPath}/getOrders.do?startPage=${PAGE.prePage}"
			   role="button">上一页</a>
		</c:if>
		<c:if test="${PAGE.hasPreviousPage == false}">
			<a class="btn btn-info" role="button">上一页</a>
		</c:if>
		<c:if test="${PAGE.hasNextPage == true}">
			<a class="btn btn-info"
			   href="${pageContext.request.contextPath}/getOrders.do?startPage=${PAGE.nextPage}"
			   role="button">下一页</a>
		</c:if>
		<c:if test="${PAGE.hasNextPage == false}">
			<a class="btn btn-info" role="button">下一页</a>
		</c:if>
		<c:if test="${PAGE.isLastPage == true}">
			<a class="btn btn-info" role="button">尾页</a>
		</c:if>
		<c:if test="${PAGE.isLastPage == false}">
			<a class="btn btn-info"
			   href="${pageContext.request.contextPath}/getOrders.do?startPage=${PAGE.lastPage}"
			   role="button">尾页</a>
		</c:if>
		<label for="pageNum">跳转</label> <input type="text" id="pageNum"
											   value="${PAGE.pageNum}" oninput="value=value.replace(/[^\d]/g,'')"
											   style="width: 50px;"> <label for="pageNum">页，共${PAGE.pageNum}/${PAGE.pages}页</label>
		<button class="btn btn-default" type="submit" onclick="jumpPage()">确定</button>
	</div>
</div>


	<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />

	</div>

	<!--右侧悬浮框-->
	<jsp:include page="/fixed_box.jsp" />

	<script type="text/javascript">
		// var pids = [];
		function pay(ototal,oid){
			window.location.reload();
				if(window.confirm("是否前往去付账？")){
					window.location.href = "${pageContext.request.contextPath}/payProduct1.do?subTotal="+ototal+"&oid="+oid;
				return true;
			}else{
				return false;
			}
		};
	</script>

	<script type="text/javascript">
		function jumpPage(){
			var pageNum = document.getElementById("pageNum").value
			var url = "${pageContext.request.contextPath}/getOrders.do?startPage=" + pageNum
			window.location.href = url;
		}
	</script>

</body>
</html>