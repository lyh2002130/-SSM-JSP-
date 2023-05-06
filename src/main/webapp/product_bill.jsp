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
/*点击修改出现提示框*/
.click {
	float: right;
}

.modal-open .modal {
	overflow-y: hidden;
	width: 620px;
	height: 510px;
	margin-top: 90px;
	margin-left: 440px;
	border-radius: 10%;
	border: 1px solid #cccccc;
	background: #CAE8EA;
	display: none;
}

.photo img {
	width: 70px;
	height: 70px;
	border: transparent;
	text-align: center;
}
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>

		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!-- 进货查询模块-->
			<div>
				<!-- 头部商品查询框-->
				<div class="panel panel-info">
					<div class="panel-heading">位置：进货查询</div>
				</div>
				<!-- 商品查询，修改，删除表格，bootstrap自适应表格-->
				<div class="table-responsive">
					<table class="table" id="mytable">
						<tr>
							<th style="display: none;">进货编号</th>
							<th>商品编号</th>
							<th>商品名称</th>
							<th>厂家名称</th>
							<th>厂家地址</th>
							<th>厂家联系方式</th>
							<th>进货数量</th>
							<th>进货价格</th>
							<th>操作</th>
						</tr>
						<c:choose>
							<c:when test="${!empty data.result.data}">
								<c:forEach var="item" items="${data.result.data}">
									<tr>
										<td style="display: none;">${item.productBillId}</td>
										<td style="font-size: 16px; font-weight: bold;">${item.productBillNumber}</td>
										<td>${item.productBillName}</td>
										<td>${item.firmName}</td>
										<td>${item.firmAddress}</td>
										<td>${item.firmPhone}</td>
										<td>${item.productBillCount}</td>
										<td>${item.productBillPrice}</td>
										<td>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" id="${item.productBillId}"
												data-target="#editProduct" onclick="openEditModal(this)">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											</button> <!-- 删除按钮 -->
											<button type="button" id="deleteButton"
												class="btn btn btn-info"
												onclick="deleteProductBill('${item.productBillId}')"
												data-toggle="button">
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											</button>
										</td>
									</tr>
									<script type="text/javascript">
										function openEditModal(obj){
											//获取当前点击行的id
											var $td = $(obj).parents('tr').children('td');
											$("#id").val($td.eq(0).text());
											$("#number").val($td.eq(1).text());
											$("#pname").val($td.eq(2).text());
											$("#firmname").val($td.eq(3).text());
											$("#firmaddress").val($td.eq(4).text());
											$("#phone").val($td.eq(5).text());
											$("#count").val($td.eq(6).text());
											$("#price").val($td.eq(7).text());
										}
									</script>
								</c:forEach>
							</c:when>
							<c:otherwise>
								暂无商品
							</c:otherwise>
						</c:choose>
					</table>

					<!-- 点击修改出现提示框-->
					<div class="modal fade" id="editProduct" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<form id="sp_add_left1"
							style="padding-top: 10px; margin: 0 100px;">
							<ul>
								<li><label>进货编号：</label> <input type="text" id="id"
									style="border: 0; background-color: #CAE8EA;" disabled>
								</li>
								<li><label>商品编号：</label> <input type="text" id="number"
									style="border: 0; background-color: #CAE8EA;" disabled>
								</li>
								<li><label>商品名称：</label> <input type="text" id="pname">
								</li>
								<li><label>厂家名称：</label> <input type="text" id="firmname">
								</li>
								<li><label>厂家地址：</label> <input type="text"
									id="firmaddress"></li>
								<li><label>厂家电话：</label> <input type="text" id="phone">
								</li>
								<li><label>进货数量：</label> <input type="text" id="count">
								</li>
								<li><label>进货价格：</label> <input type="text" id="price">
								</li>
							</ul>
						</form>
						<div class="click">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" aria-hidden="true">关闭</button>
							<button type="button" class="btn btn btn-info"
								data-toggle="button" onclick="updateProductBill()">保存修改</button>
						</div>
					</div>
				</div>
				<script> 
			    	function updateProductBill(){
			    		var data = {
			    				productBillId: $("#id").val(),
								firmName : $("#firmname").val(),
								firmAddress : $("#firmaddress").val(),
								firmPhone : $("#phone").val(),
								productBillName : $("#pname").val(),
								productBillCount : $("#count").val(),
								productBillNumber : $("#number").val(),
								productBillPrice : $("#price").val()
						}
						if(confirm("确定要保存修改吗？")){
							$.ajax({
								url: "${pageContext.request.contextPath}/editProductBill.do",
								type : "POST",
								data : data,
								success : function(data){
									alert(data.message);
								}
							});
						}
			    		
			    		location.href = "${pageContext.request.contextPath}/productBillList.do";
			    	}
			    </script>

				<!-- footer-->
				<div class="footer">
					<c:if test="${data.result.isFirstPage == true}">
						<a class="btn btn-info" role="button">首页</a>
					</c:if>
					<c:if test="${data.result.isFirstPage == false}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/productBillList.do?startPage=${data.result.firstPage}"
							role="button">首页</a>
					</c:if>
					<c:if test="${data.result.hasPreviousPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/productBillList.do?startPage=${data.result.prePage}"
							role="button">上一页</a>
					</c:if>
					<c:if test="${data.result.hasPreviousPage == false}">
						<a class="btn btn-info" role="button">上一页</a>
					</c:if>
					<c:if test="${data.result.hasNextPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/productBillList.do?startPage=${data.result.nextPage}"
							role="button">下一页</a>
					</c:if>
					<c:if test="${data.result.hasNextPage == false}">
						<a class="btn btn-info" role="button">下一页</a>
					</c:if>
					<c:if test="${data.result.isLastPage == true}">
						<a class="btn btn-info" role="button">尾页</a>
					</c:if>
					<c:if test="${data.result.isLastPage == false}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/productBillList.do?startPage=${data.result.pageNum}"
							role="button">尾页</a>
					</c:if>
					<label for="pageNum">跳转</label> <input type="text" id="pageNum"
						value="${data.result.pageStart}"
						oninput="value=value.replace(/[^\d]/g,'')" style="width: 50px;">
					<label for="pageNum">页，共${data.result.pageStart}/${data.result.pageNum}页</label>
					<button class="btn btn-default" type="submit" onclick="jumpPage()">确定</button>
				</div>
			</div>

			<script type="text/javascript">
				function jumpPage(){
					var pageNum = document.getElementById("pageNum").value
					var url = "${pageContext.request.contextPath}/productBillList.do?startPage=" + pageNum
					window.location.href = url;
				}
				//删除方法
				function deleteProductBill(id){
					if(confirm("确认要删除吗？")){
						$.ajax({
							url : "${pageContext.request.contextPath}/deleteProductBill.do",
							type : "POST",
							data : {
								productBillId : id
							},
							success : function(data) {
								alert(data.message);
								location.reload();
							}
						}) 
					}
				}
			</script>

		</div>
	</div>

</body>

</html>