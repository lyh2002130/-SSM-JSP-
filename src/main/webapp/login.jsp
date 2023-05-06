<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
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

.container .row div {
	/* position:relative;
				 float:left; */
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
</style>
</head>
<script>
	<c:if test="${!empty msg}">
	${msg}
	</c:if>
</script>
<body>
	<div class="container-fluid">
		<!-- 引入header.jsp -->
		<div class="container-fluid">
			<div class="col-md-4" style="float: left">
				<a href="/"><img src="img/logo.jpg" /></a>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-3" style="padding-top: 20px">
				<ol class="list-inline">

				</ol>
			</div>
		</div>

		<div class="container"
			style="width: 100%; height: 460px; background: url('images/login_bg.jpg') no-repeat 60% 0; background-size: cover;">
			<div class="row">
				<div class="col-md-7" style="float: left;">
					<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
				</div>

				<div class="col-md-5">
					<div
						style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 90px; background: #fff;">
						<font>登录</font>USER LOGIN <br> <font
							style="color: red; font-size: 16px; margin-left: 80px; display: block; padding: 12px 0;">${msg}</font>
						<form onsubmit="return checkAll()" class="form-horizontal"
							action="${pageContext.request.contextPath}/login.do">
							<div class="form-group">
								<label for="username" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="username"
										placeholder="请输入用户名" name="username">
								</div>
								<span id="usernameTip" style="color: red"></span>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="password"
										placeholder="请输入密码" name="password">
								</div>
								<span id="passwordTip" style="color: red"></span>
							</div>
							<div class="form-group">
								<label style="padding: 0 55px 0 125px;" for="user">会员 <input
									id="user" name="status" type="radio" value="vip" checked /></label> <label
									for="admin">管理员 <input id="admin" name="status"
									type="radio" value="admin" /></label>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input class="btn btn-warning" type="submit" id="b1" value="登录"
										style="width: 100px; font-size: 16px; margin: 0 60px;">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />

	</div>

</body>

</html>