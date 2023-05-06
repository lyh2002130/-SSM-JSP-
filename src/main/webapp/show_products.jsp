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
	margin-top: -320px;
	margin-right: 48px;
	float: right;
}

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

			<!-- 模块一商品查询-->
			<div>
				<!-- 头部商品查询框-->
				<div class="panel panel-info">
					<div class="panel-heading">位置：商品查询</div>
					<div class="panel-body">
						<!--查询按钮及输入框-->
						<form class="form-inline">
							<div class="form-group">
								<input type="search" class="form-control"
									id="exampleInputEmail2" placeholder="请输入查询的商品">
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
				<!-- 商品查询，修改，删除表格，bootstrap自适应表格-->
				<div class="table-responsive">
					<table class="table" id="mytable">
						<tr>
							<th>商品编号</th>
							<th>商品名称</th>
							<th>图片</th>
							<th style="display: none;">上市时间</th>
							<th>鲜花素材</th>
							<th>库存量</th>
							<th>市场价</th>
							<th>定价</th>
							<th style="display: none;">花语</th>
							<th style="display: none;">是否上架</th>
							<th style="display: none;">是否特价</th>
							<th style="display: none;">是否热门</th>
							<th>操作</th>
						</tr>


						<c:choose>
							<c:when test="${!empty products}">
								<c:forEach var="product" items="${products}">
									<tr>
										<td style="font-size: 16px; font-weight: bold;">${product.pid}</td>
										<td>${product.pname}</td>
										<td><img src="${product.pimage}"
											style="width: 50px; height: 50px"></td>
										<td style="display: none;">${product.pdate}</td>
										<td>${product.pmaterial}</td>
										<td>${product.num}</td>
										<td>${product.market_price}</td>
										<td>${product.shop_price}</td>
										<td style="display: none;">${product.pdesc}</td>
										<td style="display: none;">${product.pflag}</td>
										<td style="display: none;">${product.pbargain}</td>
										<td style="display: none;">${product.is_hot}</td>
										<td>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" id="${product.pid}"
												data-target="#editProduct" onclick="openEditModal(this)">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											</button>
											<button type="button" class="btn btn btn-info"
												data-toggle="button" onclick="deleteProduct(${product.pid})">
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											</button>
										</td>
									</tr>
									<script type="text/javascript">
										function deleteProduct(pid){
											if(window.confirm("确定要删除该商品吗？")){
												//获取pid的值
												//window.location.href = "${pageContext.request.contextPath}/deleteProduct.do?pid="+pid;
												$.post("${pageContext.request.contextPath}/deleteProduct.do", {"pid": pid}, function(data){
													if(data == "OK"){
														alert("商品删除成功！");
														window.location.reload();
													}else{
														alert("商品删除失败！");
														window.location.reload();
													}
												}) 
											}else{
												return false;
											}
										}
										
										function openEditModal(obj){
											//获取当前点击行的id
											var $td = $(obj).parents('tr').children('td');
											$("#pid").val($td.eq(0).text());
											$("#pname").val($td.eq(1).text());
											$("#pdate").val($td.eq(3).text());
											$("#pmaterial").val($td.eq(4).text());
											$("#num").val($td.eq(5).text());
											$("#market_price").val($td.eq(6).text());
											$("#shop_price").val($td.eq(7).text());
											$("#pdesc").val($td.eq(8).text());
											$("#pflag").val($td.eq(9).text());
											$("#pbargain").val($td.eq(10).text());
											$("#is_hot").val($td.eq(11).text());
											
											var id = $(obj).attr("id");
											var imgname = document.getElementById("mytable").rows[id % 10].cells[2];
											var img = imgname.getElementsByTagName("img")[0].src;
											//将图片路径赋值给src
									    	$('#oImg').attr("src", img);
											$('#pimage').val(img);
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
						<form id="sp_add_left1" style="padding-top: 10px;">
							<ul>
								<li><label>商品编号：</label> <input type="text" name="pid"
									id="pid" style="border: 0; background-color: #CAE8EA;" disabled>
								</li>
								<li><label>商品名称：</label> <input type="text" name="pname"
									id="pname"></li>
								<li><label>上市时间：</label> <input type="date" name="pdate"
									id="pdate"></li>
								<li><label>鲜花素材：</label> <input type="text"
									name="pmaterial" id="pmaterial"></li>
								<li><label>库存量 &nbsp;&nbsp;&nbsp;：</label> <input
									type="text" name="num" id="num"></li>
								<li><label>&nbsp;市场价 &nbsp;&nbsp;：</label> <input
									type="text" name="market_price" id="market_price"></li>
								<li><label>&nbsp;&nbsp;&nbsp;定价 &nbsp;&nbsp;&nbsp;：</label>
									<input type="text" name="shop_price" id="shop_price"></li>
							</ul>
							<div id="sp_add_right"
								style="top: -374px; right: -328px; float: none">
								<ul style="margin-left: -26px;">
									<li><label>花语&nbsp;&nbsp;&nbsp;：</label> <textarea
											id="pdesc" style="margin-top: 0px; top: 16px;" name="pdesc"></textarea>
									</li>
									<li style="margin: 0 0 20px -16px;"><label>是否上架：</label> <select
										style="height: 32px; width: 174px;" name="pflag" id="pflag">
											<option value="0">否</option>
											<option value="1">是</option>
									</select></li>
									<li style="margin: 0 0 20px -16px;"><label>是否特价：</label> <select
										style="height: 32px; width: 174px;" name="pbargain"
										id="pbargain">
											<option value="0">否</option>
											<option value="1">是</option>
									</select></li>
									<li style="margin: 0 0 20px -16px;"><label>是否热门：</label> <select
										style="height: 32px; width: 174px;" name="is_hot" id="is_hot">
											<option value="0">否</option>
											<option value="1">是</option>
									</select></li>
									<li><label>图片 &nbsp;&nbsp;：</label> <label for="files">
											<img id="oImg" width="70px" height="70px"> <br /> <input
											type="text" id="pimage" name="pimage" style="display: none">
									</label> <input type="file" id="files" onchange="inputImg();">
									</li>
								</ul>
							</div>
						</form>
						<div class="click">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" aria-hidden="true">关闭</button>
							<button type="button" class="btn btn btn-info"
								data-toggle="button" onclick="updateProduct()">保存修改</button>
						</div>
					</div>
				</div>
				<script> 
			    	function updateProduct(){
			    		//alert($("#sp_add_left1").serialize())
			    		var url = "${pageContext.request.contextPath}/updateProduct.do?pid=" + $("#pid").val();
			    		$.post(url, $("#sp_add_left1").serialize(), function(data){
							if(data == "OK"){
								alert("商品修改成功！");
								window.location.reload();
							}else{
								alert("商品修改失败！");
								window.location.reload();
							}
						}) 
			    	}
			    	function inputImg() {
			           var input = document.getElementById('files');
			           var url = window.URL.createObjectURL(input.files[0]);
			           var name = input.files[0].name;
			           //动态赋予图片路径
			           $('#oImg').attr("src", url);
			           $('#pimage').val("product/" + name);
			        }
			    </script>

				<!-- footer-->
				<div class="footer">
					<c:if test="${PAGE.isFirstPage == true}">
						<a class="btn btn-info" role="button">首页</a>
					</c:if>
					<c:if test="${PAGE.isFirstPage == false}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllProduct.do?startPage=${PAGE.firstPage}"
							role="button">首页</a>
					</c:if>
					<c:if test="${PAGE.hasPreviousPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllProduct.do?startPage=${PAGE.prePage}"
							role="button">上一页</a>
					</c:if>
					<c:if test="${PAGE.hasPreviousPage == false}">
						<a class="btn btn-info" role="button">上一页</a>
					</c:if>
					<c:if test="${PAGE.hasNextPage == true}">
						<a class="btn btn-info"
							href="${pageContext.request.contextPath}/selectAllProduct.do?startPage=${PAGE.nextPage}"
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
							href="${pageContext.request.contextPath}/selectAllProduct.do?startPage=${PAGE.lastPage}"
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
					var url = "${pageContext.request.contextPath}/selectAllProduct.do?startPage=" + pageNum
					window.location.href = url;
				}
			</script>

		</div>
	</div>

</body>

</html>