<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店 | 订单</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<style>
* {
	margin: 0;
	padding: 0;
}
/*背景图片*/
body {
	background: url("./images/order.png") no-repeat 0 0;
	background-size: cover;
}
/*确认订单标题*/
.buy_title {
	width: 250px;
	font-size: 30px;
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0, #f22),
		color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(1, #f22));
	color: transparent;
	-webkit-background-clip: text;
	-moz-background-clip: text;
	-ms-background-clip: text;
	margin-left: 20px;
}

.buy {
	margin: 100px auto;
	width: 54%;
	height: 1000px;
	background-color: #f3cddc;
	position: relative;
}
/*收货人信息*/
.buy_message {
	height: 300px;
	background: white;
	border-radius: 10%;
	margin: 30px;
}

.buy_message>.form-horizontal {
	position: absolute;
	width: 600px;
	height: 200px;
	top: 160px;
	left: 70px;
}

.buy_message span {
	width: 250px;
	font-size: 20px;
	margin-left: 20px;
	margin-top: 20px;
	display: inline-block;
	font-weight: 1000;
}

.product_message span {
	width: 250px;
	font-size: 20px;
	margin-left: 20px;
	margin-top: 40px;
	display: inline-block;
	font-weight: 1000;
}
/*产品信息*/
.product_message {
	height: 540px;
	background: white;
	border-radius: 10%;
	width: 90%;
	margin: 30px;
}

.table-responsive>.table {
	width: 600px;
	height: 200px;
	margin: 20px 0 0 28px;
}

.table-responsive>.table td {
	text-align: center;
	vertical-align: middle;
}
/*确认提交*/
.submit {
	height: 100px;
	width: 100%;
	margin-top: 30px;
	position: absolute;
}

button {
	float: right;
	margin-right: 50px;
}
</style>

</head>
<body>
	<div class="buy">
		<div class="buy_title">确认订单</div>
		<div class="buy_message">
			<span>确认收货详情</span>
			<form class="form-horizontal" method="post" id="order_form">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">收货姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="receiver"
							placeholder="请输入收货人姓名" name="receiver" value="${user.name}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">收货地址</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="address"
							placeholder="请输入收货人地址" name="address" value="${user.address}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="tel"
							placeholder="请输入11位的手机号码" name="tel"
							onkeyup="this.value=this.value.replace(/\D/g,'')" value="${user.telephone}">
					</div>
				</div>
			</form>
		</div>
		
		<div class="product_message">
			<span>确认订单详情</span>
			<div class="table-responsive">
				<table class="table" style="margin-left: 75px;">
					<tr>
						<td class="active">商品图片</td>
						<td class="success">价格</td>
						<td class="warning">数量</td>
					</tr>
					<c:forEach var="productVo" items="${plist}">
					<tr>
						<td class="active"><img src="${productVo.product.pimage}"
							style="width: 100px; height: 100px"></td>
						<td class="success">${productVo.product.shop_price}</td>
						<td class="warning">${productVo.pnum}</td>
						<input type="hidden" id="t1" value="${productVo.product.pid}"/>
					</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td><b>总计：${subTotal}元</b></td>
					</tr>
				</table>
			</div>

		</div>
		<div class="submit">
			<a href="${pageContext.request.contextPath}/showCart.do"
				class="btn btn-warning"
				style="float: right; margin: 0 45px 0 -30px;">返回</a>
			<button type="button" class="btn btn-warning"
				onclick="submitOrder()">提交订单</button>
		</div>
	</div>

	<script type="text/javascript">
		// 购买商品
		var pids=[];
		function submitOrder(){
			$.each($("input[id='t1']"),function(){
				pids.push($(this).val());
			});
			var receiver = $("#receiver").val();
			var address = $("#address").val();
			var tel = $("#tel").val();
			var num = 1;

			if(num == 0){
				return alert("对不起，该商品没有库存了，请联系商家！");
			}else if(receiver == ""){
				return alert("收货人姓名必须填写！");
			}else if(address == ""){
				return alert("收货人地址必须填写！");
			}else if(tel == ""){
				return alert("手机号码必须填写！");
			} else if(tel.length != 11){
				return alert("手机号码必须为11位的数字！");
			} else if(window.confirm("确定要提交订单吗？")){
				$.post("${pageContext.request.contextPath}/createOrder.do?subTotal=${subTotal}"+"&pids="+pids, $("#order_form").serialize(),
						function(data){
							//获取返回状态
							if(data == "OK"){
								//获取业务数据
								var result = data.result;
								alert("订单提交成功！");
								window.location.reload();
								if(window.confirm("是否前往去付账？")){
									window.location.href = "${pageContext.request.contextPath}/payProduct.do?subTotal="+${subTotal};
									return true;
								}else{
									window.location.href = "${pageContext.request.contextPath}/getOrders.do";
									return false;
								}
							}else{
								alert("订单提交失败！");
								window.location.reload();
							}
						})
			}else{
				return false;
			}
	};
</script>
</body>
</html>