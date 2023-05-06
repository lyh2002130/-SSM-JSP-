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

.list-group-item {
	height: 80px;
	padding-top: 20px;
	line-height: 30px;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>

		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!--模块五 管理员个人中心-->
			<div>
				<div class="panel panel-default"
					style="width: 600px; margin: 0 auto">
					<!-- Default panel contents -->
					<div class="panel-heading">位置：个人中心</div>
					<div class="panel-body" id="manage_people">
						<img src="img/logo1.jpg">
					</div>
					<!-- List group -->
					<ul class="list-group" style="text-align: center;">
						<li class="list-group-item"><span
							class="glyphicon glyphicon-hdd" aria-hidden="true"></span>
							管理员ID：${ADMIN.aid}</li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>
							管理员昵称：<input type="text" id="username" name="username"
							value="${ADMIN.username}" size="30" style="text-align: center;" />
							<button type="button" class="btn" data-toggle="button"
								onclick="updateAdmin(${ADMIN.aid})">修改</button></li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-lock" aria-hidden="true"></span> 修改密码：
							<input type="password" id="password" name="password"
							value="${ADMIN.password}" size="30"
							onKeyUp="value=value.replace(/[\W]/g,'')"
							style="text-align: center;" />
							<button type="button" class="btn" data-toggle="button"
								onclick="updateAdmin(${ADMIN.aid})">修改</button></li>
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/adminToLogout.do">
								<button type="button" class="btn btn-danger" style="margin: 0">退出登录</button>
						</a></li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				function updateAdmin(aid){
					var username = $("#username").val();
					var password = $("#password").val();
					if(username == ""){
						return alert("管理员昵称不能为空！");
					}else if(password.length != 6){
						return alert("密码必须为6位字母或数字！");
					}
					
					$.post("${pageContext.request.contextPath}/updatePassword.do", 
							{"aid": aid, "password": password, "username": username}, function(data){
						if(data == "OK"){
							alert("管理员信息修改成功！");
							window.location.reload();
						}else{
							alert("管理员信息修改失败！");
							window.location.reload();
						}
					})
				}
			</script>
		</div>
	</div>
</body>

</html>