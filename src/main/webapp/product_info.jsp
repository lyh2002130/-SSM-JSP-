<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${PRODUCT.pname}详情</title>
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
</style>
</head>

<body id="return-top">
	<div class="container-fluid">

		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp" />

		<div class="container">
			<div class="row">
				<div
					style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
					<a href="default.jsp">首页&nbsp;&nbsp;&gt;</a> <a
						href="${pageContext.request.contextPath}/findAllProductByCid.do?cid=${PRODUCT.category.cid}">${PRODUCT.category.cname}&nbsp;&nbsp;&gt;</a>
					<a>${PRODUCT.pname}</a>
				</div>

				<div style="margin: 0 auto; width: 950px;">
					<div class="col-md-6">
						<img style="opacity: 1; width: 400px; height: 400px;" title=""
							class="medium" src="${PRODUCT.pimage}">
					</div>

					<div class="col-md-6">
						<div>
							<strong>${PRODUCT.pname}</strong>
						</div>
						<div
							style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
							<div>编号：${PRODUCT.pid}</div>
						</div>

						<div style="margin: 10px 0 10px 0;">
							亿家价: <strong style="color: #ef0101;">￥：${PRODUCT.shop_price}元/束</strong>
							参 考 价：
							<del>￥${PRODUCT.market_price}/束</del>
						</div>

						<div style="margin: 10px 0 10px 0;">
							促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)"
								style="background-color: #d5ff1d;">限时抢购</a>
						</div>

						<div
							style="padding: 10px; border: 1px solid #cbe6bf; width: 330px; margin: 15px 0 10px 0;; background-color: #dff0d8;">

							<div style="margin: 5px 0 10px 0;">白色</div>

							<div
								style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
								购买数量: <input id="quantity" name="quantity" value="1" size="10"
									min="1" type="number" style="width: 100px;">
							</div>

							<div style="margin: 20px 0 10px 0;; text-align: center;">

								<a href="#" onclick="addOrder()">
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-piggy-bank"></span> 立即购买
									</button>
								</a> <a href="#" onclick="addProduct()">
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-shopping-cartItem"></span> 加入购物车
									</button>
								</a>

							</div>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					// 加入购物车
					function addProduct(){
						//获取pid和num
						var pid = ${PRODUCT.pid};
						var num = document.getElementById("quantity").value;

						var url = "${pageContext.request.contextPath}/addCart.do?num="+num+ "&pid="+pid;
						window.location.href = url;
					}
				</script>

				<script type="text/javascript">
					// 立即购买
					function addOrder(){
						//获取pid和num
						var pid = ${PRODUCT.pid};
						var num = document.getElementById("quantity").value;

						var url = "${pageContext.request.contextPath}/showOrder1.do?num="+num+ "&pid="+pid;
						window.location.href = url;
					}
				</script>

				<div class="clear"></div>
				<div style="width: 950px; margin: 0 auto;">
					<div
						style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
						<strong>商品介绍</strong>
					</div>

					<div>
						<img src="${PRODUCT.pimage}">
					</div>

					<div
						style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
						<strong>商品参数</strong>
					</div>
					<div style="margin-top: 10px; width: 900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th colspan="2">基本参数</th>
								</tr>
								<tr>
									<th width="10%">类 别</th>
									<td width="30%">${PRODUCT.category.cname}</td>
								</tr>
								<tr>
									<th width="10%">材 料</th>
									<td>${PRODUCT.pmaterial}</td>
								</tr>
								<tr>
									<th width="10%">花 语</th>
									<td>${PRODUCT.pdesc}</td>
								</tr>
								<tr>
									<th width="10%">热门商品</th>
									<td>${PRODUCT.is_hot==1 ? '是':'否'}</td>
								</tr>
								<tr>
									<th width="10%">特价商品</th>
									<td>${PRODUCT.pbargain==1 ? '是':'否'}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="background-color: #d3d3d3; width: 900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th><strong>商品评论</strong></th>
								</tr>
								<tr class="warning">
									<th>暂无商品评论信息 <a>[发表商品评论]</a></th>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="background-color: #d3d3d3; width: 900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th><strong>商品咨询</strong></th>
								</tr>
								<tr class="warning">
									<th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>

		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />

	</div>

	<!--右侧悬浮框-->
	<jsp:include page="/fixed_box.jsp" />

</body>

</html>