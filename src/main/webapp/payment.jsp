<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店 | 充值</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<style>
body {
	background: url('/images/payment.jpg') no-repeat;
	background-size: 100% 640px;
}

.pay_div {
	width: 400px;
	height: 250px;
	margin: 180px 526px;
	background-color: #a48d11;
}

.pay_form {
	padding: 20px;
}

.pay_form ul {
	padding-top: 10px;
}

.pay_form ul li {
	margin-top: 20px;
	list-style-type: none;
}
</style>
</head>

<body>
	<div class="pay_div">
		<form class="pay_form">
			<ul>
				<li><label>账户余额：</label> <input type="text"
					value="${USER.count}" disabled></li>
				<li><label>账户充值：</label> <input type="text" id="count"
					placeholder="请输入要充值的金额" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></li>
			</ul>
		</form>
		<div style="float: right; margin-right: 50px;">
			<button class="btn" onclick="updateCount()">充值</button>
			<a href="${pageContext.request.contextPath}/getOrders.do"
				style="color: #333;">
				<button class="btn">返回</button>
			</a>
		</div>
	</div>

	<script type="text/javascript">
    	function updateCount(){
    		var count = $("#count").val();
    		if(count == null || count < 0){
    			return alert("充值的金额不能为空或者负数！");
    		}else if(window.confirm("是否要充值？")){
    			$.post("${pageContext.request.contextPath}/updateCount.do", {"count": count}, function(data){
        			if(data == "OK"){
        				alert("充值成功！");
        				window.location.reload();
        			}else{
        				alert("充值失败！");
        				window.location.reload();
        			}
        		})
    		}else{
    			return false;
    		}
    	}
    </script>

</body>

</html>