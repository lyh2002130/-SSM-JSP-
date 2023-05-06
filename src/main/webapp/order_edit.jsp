<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

textarea {
	resize: none;
}

form ul li label {
	font-size: 18px;
}

form ul li input {
	width: 300px;
	height: 40px;
}

#productBillSubmit {
	float: right;
	margin-top: 40px;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	background-color: #dff0d8;
	line-height: 1.42857143;
	color: #333;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>


		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!-- 订单处理模块-->
			<div>
				<div id="sp_add">
					<div class="panel panel-info">
						<div class="panel-heading">位置：订单处理</div>
					</div>
					<form id="sp_add_left" method="POST"
						style="width: 100%; margin: 100px 250px;">
						<input type="hidden" id="orderId" value="${orderId}">
						<div style="float: left;">
							<ul>
								<li><label>购买数量：</label> <span>${itemPayCount}</span></li>
							</ul>
							<ul>
								<li><label>发货数量：</label> <input type="number"
									id="itemSendCount" max=${itemPayCount
									} value="${itemSendCount}" /> <strong
									style="color: red; margin-left: 5px;">(只有提交发货数量，自动修改订单状态)</strong></li>
								<li><label>订单状态：</label> <select id="orderStatus"
									style="width: 300px; height: 40px;" name="pflag">
										<c:choose>
											<c:when test="${orderStatus == 0}">
												<option selected="selected" value="0">未付款</option>
												<option value="1">已付款，代发货</option>
												<option value="2">部分发货，待收货</option>
												<option value="3">全部发货，待收货</option>
											</c:when>
											<c:when test="${orderStatus == 1}">
												<option value="0">未付款</option>
												<option selected="selected" value="1">已付款，代发货</option>
												<option value="2">部分发货，待收货</option>
												<option value="3">全部发货，待收货</option>
											</c:when>
											<c:when test="${orderStatus == 2}">
												<option value="0">未付款</option>
												<option value="1">已付款，代发货</option>
												<option selected="selected" value="2">部分发货，待收货</option>
												<option value="3">全部发货，待收货</option>
											</c:when>
											<c:when test="${orderStatus == 3}">
												<option value="0">未付款</option>
												<option value="1">已付款，代发货</option>
												<option value="2">部分发货，待收货</option>
												<option selected="selected" value="3">全部发货，待收货</option>
											</c:when>
											<c:otherwise>
												<option value="0">未付款</option>
												<option value="1">已付款，代发货</option>
												<option value="2">部分发货，待收货</option>
												<option value="3">全部发货，待收货</option>
											</c:otherwise>
										</c:choose>
										<!-- <option value="4">确认收货</option> -->
								</select> <strong style="color: red; margin-left: 5px;">*</strong></li>
							</ul>
						</div>
					</form>
					<div style="position: absolute; top: 360px; left: 1000px;">
						<button id="productBillSubmit" type="submit">提交</button>
						<button id="btn_reset" type="reset" onclick="resetAll()">返回</button>
					</div>
				</div>

				<script type="text/javascript">
					function resetAll(){
						location.href = "${pageContext.request.contextPath}/selectAllOrder.do";
					}
					
				</script>

			</div>
		</div>
	</div>
	<script>
		$("#productBillSubmit").click(function(){
			var data = {
					orderId : ${orderId},
					itemSendCount : $("#itemSendCount").val(),
					orderStatus : $("#orderStatus").val()
			}
			if(confirm("确实要提交吗？")){
				$.ajax({
					url: "${pageContext.request.contextPath}/editOrder.do",
					type : "POST",
					data : data,
					success : function(data){
						alert(data.message);
						if(data.status == ""){
							location.href = "${pageContext.request.contextPath}/selectAllOrder.do";
						}
					}
				})
			}
        });
	</script>
</body>

</html>