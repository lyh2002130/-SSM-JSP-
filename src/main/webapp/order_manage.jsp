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
/*点击修改出现提示框*/
.modal-open .modal {
	overflow-y: hidden;
	width: 620px;
	height: 440px;
	margin-top: 90px;
	margin-left: 440px;
	border-radius: 10%;
	border: 1px solid #cccccc;
	background: #CAE8EA;
	display: none;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>


		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!-- 模块三 订单管理-->
			<div>
				<div class="panel panel-info">
					<div class="panel-heading">位置：订单查询</div>
					<div class="panel-body">
						<!--查询按钮及输入框-->
						<form class="form-inline">
							<label>查询条件</label>
							<!-- 下拉选择框-->
							<select class="form-control">
								<option>订单号</option>
							</select>
							<!-- 输入框-->
							<div class="form-group">
								<label>查询内容</label> <input type="search" class="form-control"
									placeholder="请输入查询的订单">
							</div>
							<!-- 查询按钮-->
							<button type="submit" class="btn btn-info">查询</button>
						</form>
					</div>
				</div>
				<!-- 订单查询，删除表格，bootstrap自适应表格-->
				<div class="table-responsive">
					<table class="table" id="mytable">
						<tr>
							<th>订单号</th>
							<th>收货人姓名</th>
							<th>收货人地址</th>
							<th>联系电话</th>
							<th>下单时间</th>
							<th>订单状态</th>
							<th>支付总额</th>
							<th>操作</th>
						</tr>

						<c:choose>
							<c:when test="${!empty ORDERS}">
								<c:forEach var="order" items="${ORDERS}">
									<tr>
										<td>${order.onum}</td>
										<td>${order.receiver}</td>
										<td>${order.address}</td>
										<td>${order.tel}</td>
										<td><fmt:formatDate value="${order.time}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${order.orderStatus}</td>
										<td>${order.ototal}</td>
										<td>
											<button type="button" onclick="editOrder('${order.oid}')"
												class="btn btn btn-info" data-toggle="modal"
												data-target="#editOrder">订单处理</button> <a
											href="${pageContext.request.contextPath}/showOrderDetails.do?orderId=${order.oid}"><button
													type="button" class="btn btn btn-primary">查看出货单</button></a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</div>
				<!-- 页脚部分-->
				<!-- footer-->
				<div class="footer">
					<c:if test="${PAGE.isFirstPage == true}">
						<a class="btn btn-info" role="button">首页</a>
					</c:if>
					<c:if test="${PAGE.isFirstPage == false}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllOrder.do?startPage=${PAGE.firstPage}"
							role="button">首页</a>
					</c:if>
					<c:if test="${PAGE.hasPreviousPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllOrder.do?startPage=${PAGE.prePage}"
							role="button">上一页</a>
					</c:if>
					<c:if test="${PAGE.hasPreviousPage == false}">
						<a class="btn btn-info" role="button">上一页</a>
					</c:if>
					<c:if test="${PAGE.hasNextPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllOrder.do?startPage=${PAGE.nextPage}"
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
							href="${pageContext.request.contextPath}/selectAllOrder.do?startPage=${PAGE.lastPage}"
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
					var url = "${pageContext.request.contextPath}/selectAllOrder.do?startPage=" + pageNum
					window.location.href = url;
				}
				
				function editOrder(id){
					location.href = "${pageContext.request.contextPath}/showEditOrder.do?orderId=" + id;
				}
			</script>
		</div>
	</div>
</body>

</html>