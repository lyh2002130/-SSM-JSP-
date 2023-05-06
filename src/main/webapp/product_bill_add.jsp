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

			<!-- 新增进货模块-->
			<div>
				<div id="sp_add">
					<div class="panel panel-info">
						<div class="panel-heading">位置：新增进货</div>
					</div>
					<form id="sp_add_left" method="POST"
						style="width: 100%; margin: 0 250px;">
						<div style="float: left;">
							<ul>
								<li><label>厂家名称：</label> <input type="text" id="firmName">
									<strong style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>厂家地址：</label> <input type="text"
									id="firmAddress"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>厂家电话：</label> <input type="number"
									id="firmPhone"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>商品名称：</label> <input type="text"
									id="productBillName"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>商品编号：</label> <input type="number"
									id="productBillNumber" maxlength="11"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>商品数量：</label> <input type="number"
									id="productBillCount"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>商品进价：</label> <input id="productBillPrice"
									onkeypress="if((event.keyCode&lt;48 || event.keyCode&gt;57)&amp;&amp; event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"
									type="text" /> <strong style="color: red; margin-left: 5px;">*</strong></li>
							</ul>
						</div>
					</form>
					<div style="margin: 485px;">
						<button id="productBillSubmit" type="submit">提交</button>
						<button id="btn_reset" type="reset" onclick="resetAll()">重置</button>
					</div>
				</div>

				<script type="text/javascript">
					function resetAll(){
						if(window.confirm("是否要重置？")){
							//清除所有的input
							for(var i=0; i<document.getElementsByTagName('input').length; i++){
							    document.getElementsByTagName('input')[i].value = "";
							}
							//清除所有的textarea
							for(var i=0; i<document.getElementsByTagName('textarea').length; i++){
							    document.getElementsByTagName('textarea')[i].value = "";
							}
							//清除图片
							var ulList = document.getElementById("list");
							ulList.innerHTML="";
							return true;
						}else{
							return false;
						}
					}
				</script>

			</div>
		</div>
	</div>
	<script>
		$("#productBillSubmit").click(function(){
			var data = {
					firmName : $("#firmName").val(),
					firmAddress : $("#firmAddress").val(),
					firmPhone : $("#firmPhone").val(),
					productBillName : $("#productBillName").val(),
					productBillCount : $("#productBillCount").val(),
					productBillNumber : $("#productBillNumber").val(),
					productBillPrice : $("#productBillPrice").val()
			}
			if(confirm("确定要提交吗？")){
				$.ajax({
					url: "${pageContext.request.contextPath}/addProductBill.do",
					type : "POST",
					data : data,
					success : function(data){
						alert(data.message);
					}
				})
			}
        });
	</script>
</body>

</html>