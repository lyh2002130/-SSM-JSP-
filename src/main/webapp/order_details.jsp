<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>有间花店 | 后台管理</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<!-- 引入css样式-->
<link rel="stylesheet" type="text/css" href="css/admin.css"
	media="screen">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/admin.js"></script>

<style type="text/css">
a:focus, a:hover {
	text-decoration: none;
}

.panel-body {
	text-align: left;
}

#mytable th, #mytable td {
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>

		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!-- 出货单详情模块-->
			<div>
				<div id="sp_add">
					<div class="panel panel-info">
						<div class="panel-heading">位置：出货单详情</div>
					</div>
					<form id="sp_add_left" method="POST"
						style="width: 100%; margin: 0 250px;">
						<div style="float: left;">
							<ul>
								<li><label>订单号：</label> <span>${data.orderNumber}</span></li>
								<li><label>收货人姓名：</label> <span>${data.addresseeName}</span></li>
								<li><label>收货人地址：</label> <span>${data.addresseeAddress}</span></li>
								<li><label>联系电话：</label> <span>${data.addresseePhone}</span></li>
								<li><label>下单时间：</label> <span>${data.orderTime}</span></li>
								<li><label>订单状态：</label> <span>${data.orderStatus}</span></li>
								<li><label>支付总额：</label> <span>${data.orderTotalPrice}</span></li>
								<li><label>商品名称：</label> <span>${data.itemName}</span></li>
								<li><label>商品图片：</label> <img src="${data.itemImage}"
									style="width: 100px; height: 100px;"></li>
								<li><label>购买数量：</label> <span>${data.itemPayCount}</span></li>
								<li><label>发货数量：</label> <span>${data.itemSendCount}</span></li>
							</ul>
						</div>
					</form>
					<div style="margin: 485px;">
						<a href="${pageContext.request.contextPath}/selectAllOrder.do"><button
								id="btn_submit" type="submit">返回</button></a>
					</div>
				</div>
</body>

</html>
