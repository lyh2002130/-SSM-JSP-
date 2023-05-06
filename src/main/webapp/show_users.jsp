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

			<!--模块四 会员管理-->
			<div>
				<!-- 用户信息查询框-->
				<div class="panel panel-info">
					<div class="panel-heading">位置：会员管理</div>
					<div class="panel-body">
						<!--查询按钮及输入框-->
						<form class="form-inline">
							<div class="form-group">
								<input type="select" class="form-control"
									id="exampleInputEmail3" placeholder="请输入查询的用户">
							</div>
							<!-- 下拉选择框-->
							<select class="form-control">
								<option>请选择查询方式</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
							<!-- 查询按钮-->
							<button type="submit" class="btn btn-default">查询</button>
						</form>
					</div>
				</div>
				<!-- 用户信息表格，bootstrap自适应表格-->
				<div class="table-responsive">
					<table class="table" id="mytable">
						<tr>
							<th>用户编号</th>
							<th>用户名</th>
							<th>性别</th>
							<th>姓名</th>
							<th>邮箱</th>
							<th>手机号码</th>
							<th>出生日期</th>
						</tr>
						<c:choose>
							<c:when test="${!empty USERS}">
								<c:forEach var="user" items="${USERS}">
									<tr>
										<th class="spec">${user.uid}</th>
										<td>${user.username}</td>
										<td>${user.sex}</td>
										<td>${user.name}</td>
										<td>${user.email}</td>
										<td>${user.telephone}</td>
										<td>${user.birthday}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								暂无会户
							</c:otherwise>
						</c:choose>

					</table>
					<!-- footer-->
					<div class="footer">
						<c:if test="${PAGE.isFirstPage == true}">
							<a class="btn btn-info" role="button">首页</a>
						</c:if>
						<c:if test="${PAGE.isFirstPage == false}">
							<a class="btn btn-info"
								href="${pageContext.request.contextPath}/selectAllUser.do?startPage=${PAGE.firstPage}"
								role="button">首页</a>
						</c:if>
						<c:if test="${PAGE.hasPreviousPage == true}">
							<a class="btn btn-info"
								href="${pageContext.request.contextPath}/selectAllUser.do?startPage=${PAGE.prePage}"
								role="button">上一页</a>
						</c:if>
						<c:if test="${PAGE.hasPreviousPage == false}">
							<a class="btn btn-info" role="button">上一页</a>
						</c:if>
						<c:if test="${PAGE.hasNextPage == true}">
							<a class="btn btn-info"
								href="${pageContext.request.contextPath}/selectAllUser.do?startPage=${PAGE.nextPage}"
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
								href="${pageContext.request.contextPath}/selectAllUser.do?startPage=${PAGE.lastPage}"
								role="button">尾页</a>
						</c:if>
						<label for="pageNum">跳转</label> <input type="text" id="pageNum"
							value="${PAGE.pageNum}" style="width: 50px;"> <label
							for="pageNum">页，共${PAGE.pageNum}/${PAGE.pages}页</label>
						<button class="btn btn-default" type="submit" onclick="jumpPage()">确定</button>
					</div>
				</div>

				<script type="text/javascript">
					function jumpPage(){
						var pageNum = document.getElementById("pageNum").value
						var url = "${pageContext.request.contextPath}/selectAllUser.do?startPage=" + pageNum
						window.location.href = url;
					}
				</script>


			</div>


		</div>
	</div>
</body>

</html>