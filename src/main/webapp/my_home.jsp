<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>有家花店 | 个人中心</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/base.css"></link>
<style>
.photo img {
	width: 200px;
	height: 200px;
	border: transparent;
	border-radius: 50%;
	text-align: center;
}

.clearfix .li1 {
	padding-top: 66px;
}

#content2 ul li {
	list-style: none;
	border-top: 1px solid gray;
	width: 80%;
	padding: 10px;
}

#content2 ul li:first-child {
	border: none;
}
</style>

</head>

<body>
	<div class="container-fluid">
		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp" />

		<div class="wrap">
			<div class="tab">
				<div id="tab1" class="tab1" onclick="Tab(1)">个人信息</div>
			</div>

			<!-- 个人信息 -->
			<div id="content1" class="content1">
				<div id="info" class="info">

					<table style="width: 800px" class="table">
						<tr>
							<td rowspan="3">
								<div id="photo" class="photo"></div>
								<button id="btn1">
									<label for="files">更改头像</label>
								</button> <input type="file" id="files" onchange="inputImg();"
								style="display: none;">
							</td>
							<td style="vertical-align: middle;"><input type="text"
								value="${USER.username}">
								<button id="btn2">更改昵称</button></td>
						</tr>
						<tr>
							<td style="vertical-align: middle;"><input type=text
								value="${USER.email}">
								<button id="btn3">更改邮箱</button></td>
						</tr>
						<tr>
							<td style="vertical-align: middle;"><input type="text"
								value="${USER.telephone}">
								<button id="btn4">更改手机号码</button></td>
						</tr>

					</table>
				</div>

			</div>
			<script>
		        function inputImg() {
		            var input = document.getElementById('files');
		            var url = window.URL.createObjectURL(input.files[0]);
		            var photo = document.getElementById('photo');
		            photo.innerHTML = "";
		            var oImg = document.createElement('img');
		            oImg.src = url;
		            photo.appendChild(oImg);
		        }
		    </script>

<%--			<div id="content2" class="content2">
				<ul>
					<c:choose>
						<c:when test="${!empty orders}">
							<c:forEach var="order" items="${orders}">
								<li><a
									href="${pageContext.request.contextPath}/findProductByPid.do?pid=${product.pid}">
										<img src="${order.itemImage}"
										style="width: 70px; height: 70px;" />
								</a> <span style="margin: 24px;">${order.itemName}</span> <span
									style="float: right; margin-top: 20px;"> <span>${order.orderStatus}</span>
										<button class="btn btn-default" style="margin-left: 120px;"
											onclick="enterComment(${order.itemPid})">评价</button>
										<button class="btn btn-default"
											onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode)">刪除</button>
								</span></li>
								<script type="text/javascript">
									function enterComment(pid){
										var url = "${pageContext.request.contextPath}/showProductToComment.do?pid="+pid;
										window.location.href = url;
									}
								</script>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div style="line-height: 550px; text-align: center;">
								<span style="font-size: 40px; color: red; font-weight: bold;">
									暂无订单</span>
							</div>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>--%>

		</div>
	</div>
</body>

</html>