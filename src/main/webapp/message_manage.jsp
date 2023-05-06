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

#reply {
	width: 300px;
	height: 340px;
	margin: 150px 600px;
	border-radius: 10%;
	border: 1px solid #cccccc;
	background: #CAE8EA;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>


		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!--模块六 留言管理管理-->
			<div>
				<div class="panel panel-info">
					<div class="panel-heading">位置：评论管理</div>
					<div class="panel-body"></div>
					<!-- 评论管理表格-->
					<div class="table-responsive">
						<table class="table" id="mytable">
							<tr>
								<th>评论编号</th>
								<th>用户编号</th>
								<th>商品编号</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>评论上传的图片</th>
								<th>星星评价</th>
								<th>操作</th>
							</tr>
							<c:choose>
								<c:when test="${!empty COMMENTS}">
									<c:forEach var="comment" items="${COMMENTS}">
										<tr>
											<td style="font-weight: bold;">${comment.cmid}</td>
											<td>${comment.uid}</td>
											<td>${comment.pid}</td>
											<td>${comment.cmcontent}</td>
											<td><fmt:formatDate value="${comment.cmtime}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><img src="${comment.cmimage}"
												style="width: 70px; height: 70px;"></td>
											<td>${comment.score}颗星</td>
											<td>
												<button type="button" class="btn btn btn-info"
													data-toggle="modal" data-target="#reply">回复</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>

						<!-- 点击回复弹出框-->
						<div class="modal fade" id="reply" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<form style="margin-left: 30px; padding-top: 25px">
								<ul>
									<li><label>回复内容：</label> <textarea rows="7"
											style="margin: 0; top: 0;"></textarea></li>
								</ul>
							</form>
							<!-- 取消和确定按钮-->
							<div class="click" style="margin-left: 100px;">
								<button type="button" class="btn btn-primary"
									data-toggle="button" data-dismiss="modal" aria-hidden="true">关闭</button>
								<button type="button" class="btn btn btn-info"
									data-toggle="button" onclick="closeApply()"
									data-dismiss="modal" aria-hidden="true">回复</button>
							</div>
						</div>
						<script type="text/javascript">
                    	function closeApply(){
                    		alert("成功回复~")
                    	}
                    </script>
					</div>
				</div>

			</div>
			<!-- 页脚部分-->
			<!-- footer-->
			<div class="footer">
				<c:if test="${PAGE.isFirstPage == true}">
					<a class="btn btn-info" role="button">首页</a>
				</c:if>
				<c:if test="${PAGE.isFirstPage == false}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/selectAllComments.do?startPage=${PAGE.firstPage}"
						role="button">首页</a>
				</c:if>
				<c:if test="${PAGE.hasPreviousPage == true}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/selectAllComments.do?startPage=${PAGE.prePage}"
						role="button">上一页</a>
				</c:if>
				<c:if test="${PAGE.hasPreviousPage == false}">
					<a class="btn btn-info" role="button">上一页</a>
				</c:if>
				<c:if test="${PAGE.hasNextPage == true}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/selectAllComments.do?startPage=${PAGE.nextPage}"
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
						href="${pageContext.request.contextPath}/selectAllComments.do?startPage=${PAGE.lastPage}"
						role="button">尾页</a>
				</c:if>
				<label for="pageNum">跳转</label> <input type="text" id="pageNum"
					value="${PAGE.pageNum}" oninput="value=value.replace(/[^\d]/g,'')"
					style="width: 50px;"> <label for="pageNum">页，共${PAGE.pageNum}/${PAGE.pages}页</label>
				<button class="btn btn-default" type="submit" onclick="jumpPage()">确定</button>
			</div>
		</div>

		<script type="text/javascript">
				function jumpPage(){
					var pageNum = document.getElementById("pageNum").value
					var url = "${pageContext.request.contextPath}/selectAllComments.do?startPage=" + pageNum
					window.location.href = url;
				}
			</script>
	</div>

</body>

</html>
