<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
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

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>

<body>

	<!-- 引入header.jsp -->
	<div class="container-fluid">
		<div class="col-md-4" style="float: left">
			<a href="/"><img src="img/logo.jpg" /></a>
		</div>
	</div>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg') no-repeat;">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form onsubmit="return check()" class="form-horizontal"
					style="margin-top: 5px;"
					action="${pageContext.request.contextPath}/register.do"
					method="POST">
					<font style="color: red; margin-left: 50px"> <!-- 提示信息 --> <span
						style="font-size: 20px" id="message">${msg}</span>
					</font>
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username"
								placeholder="请输入用户名" name="username">
							<span id="sp2"></span>
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								placeholder="请输入密码" name="password" value=""
								   onblur="check()" required="required">
							<span id="warning1"></span>
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd"
								placeholder="请输入确认密码" onblur="check()" required="required">
							<span id="warning2"></span>
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email" required
								placeholder="Email" name="email">
							<span id="sp1"></span>
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="telephone" required
								placeholder="请输入手机号" name="telephone">
							<span id="sp"></span>
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" required
								placeholder="请输入姓名" name="name">
						</div>
						<strong style="color: red">*</strong>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="sex" id="sex" value="男" checked="checked"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="sex" id="sex" value="女"> 女
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input type="date" class="form-control" id="birthday" required
								name="birthday" value="2018-04-7">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="address" required
								   name="address">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input class="btn btn-warning" type="submit" id="tj" width="100"
								value="注册" name="submit" style="width: 100px; font-size: 16px;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp" />

	<script>
		var paw1 = document.getElementById("password");
		paw1.onmouseenter = function(){
			this.type="text";
		}
		paw1.onmouseleave = function(){
			this.type="password";
		}
		var paw2 = document.getElementById("confirmpwd");
		paw2.onmouseenter = function(){
			this.type="text";
		}
		paw2.onmouseleave = function(){
			this.type="password";
		}

		$("#email").blur(function () {
			var email = $("#email").val();
			var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if (re.test(email)){
				$("#sp1").css("color","green").html("邮箱格式正确");
			}else {
				$("#sp1").css("color","red").html("请输入正确的邮箱");
			}
		});

		function check() {
			var tj = $("#tj");
			if (document.getElementById("password").value == "" || document.getElementById("password").value == null) {
				// document.getElementById("warning2").innerHTML = "";
				$("#warning1").css("color","red").html("密码不能为空,请输入密码!");
				tj.attr("disabled","disabled");
			}else {
				document.getElementById("warning1").innerHTML = "";
				if (document.getElementById("password").value != document.getElementById("confirmpwd").value) {
					$("#warning2").css("color","red").html("两次密码的输入不一致");
					tj.attr("disabled","disabled");
				} else {
					document.getElementById("warning2").innerHTML = "密码一致";
					$("#warning2").css("color", "green");
					tj.removeAttr("disabled");
				}
			}
		};

		$("#telephone").blur(function () {
			var phone = $("#telephone").val();
			var tj = $("#tj");
			var regExp = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
			$.get("/yzphone.do",{"phone":phone},function (data) {
				if (data==0){
					if (phone != "" && phone != null) {
						if (regExp.test(phone)) {
							$("#sp").css("color","green").html("");
							$("#sp").css("color","green").html("手机号码可用");
							tj.removeAttr("disabled");
						} else {
							$("#sp").css("color","red").html("手机号码有误!");
							tj.attr("disabled","disabled");
						}
					} else {
						$("#sp").css("color","red").html("手机号不能为空,请输入手机号码!");
						tj.attr("disabled","disabled");
					}
				}else {
					$("#sp").css("color","red").html("手机号码已存在,请重新输入手机号码!");
					tj.attr("disabled", "disabled");
				}
			})
		});

		$("#username").blur(function () {
			var username = $("#username").val();
			var tj = $("#tj");
			$.get("/yzusername.do",{"username":username},function (data) {
				if (data==0){
					$("#sp2").css("color","green").html("用户名可用！");
					if (username != "" && username != null) {

					} else {
						$("#sp2").css("color","red").html("用户名不能为空,请输入用户名!");
						tj.attr("disabled","disabled");
					}
				}else {
					$("#sp2").css("color","red").html("用户名已存在,请重新输入用户名!");
					tj.attr("disabled", "disabled");
				}
			})
		})
	</script>

</body>

</html>