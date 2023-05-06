<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>有间花店 | 购物车</title>
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

.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th {
	vertical-align: middle;
	text-align: center;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>

<script>
	<c:if test="${!empty product}">
	alert("${product.pname}"+"----商品的库存只有----"+${product.num});
	</c:if>
</script>

<body>
	<div class="container-fluid">
		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp" />

		<c:choose>
			<%--map不为null时--%>
			<c:when test="${!empty CART.map}">
				<div class="container">
					<div class="row">

						<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
							<strong style="font-size: 16px; margin: 5px 0;">购物车详情</strong>
							<table class="table table-bordered">
								<tbody>
									<tr class="warning">
										<th>图片</th>
										<th>商品</th>
										<th>价格</th>
										<th>数量</th>
										<th>小计</th>
										<th>操作</th>
										<th>选择</th>
									</tr>
									<%--
											加入购物车
											entry是Map的一个集合类，Map-key：商品编号
															   Map-value：Item购物项
										 --%>
									<c:forEach var="entry" items="${CART.map}">
										<tr>
											<td width="60" width="40%"><input type="hidden"
												name="id" value="22"> <img
												src="${entry.value.product.pimage}" width="70" height="60">
											</td>
											<td width="30%"><a
												href="${pageContext.request.contextPath}/findProductByPid.do?pid=${entry.value.product.pid}">${entry.value.product.pname}</a>
											</td>
											<td width="20%">￥${entry.value.product.shop_price}</td>
											<%--this.value指该标签的值，即购买数量--%>
											<td width="10%"><input name="quantity"
												value="${entry.value.pnum}" type="number"
												style="width: 100px;"
												onchange="updatePnum(${entry.key},this.value)" min="1" oninput="if(!/^[0-9]+$/.test(value)) value=value.replace(/\D/g,'');if(value>100)value=100;if(value<=0)value=1">
											</td>
											<td width="15%"><span class="subtotal">￥${entry.value.subTotal}</span>
											</td>
											<td><a
												onclick="delProduct('${entry.value.product.pname}',${entry.key})"
												href="#" class="delete">删除</a>
											</td>
											<td>
											    <input onclick="sum()" id="${entry.value.product.pid}" type="checkbox" value="${entry.value.subTotal}"/>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>

					<script type="text/javascript">
							//删除某个商品信息
							function delProduct(pname,pid){
								//弹出确定框
								var flag = window.confirm("你确定删除【"+pname+"】吗？");
								//点确定时
								if(flag){
									var url = "${pageContext.request.contextPath}/delProduct.do?pid="+pid;
									window.location.href = url;
								}
							}
							
							//更新购买数量的值
							function updatePnum(pid, num){
								var url = "${pageContext.request.contextPath}/updatePnum.do?pid="+pid+"&num="+num;
								window.location.href = url;
							}
						</script>

					<script>
						function sum() {
							var s = 0;
							var sub = [];
							$.each($('input:checkbox:checked'),function(){
								sub.push($(this).val());
							});
							for(var i=0;i<sub.length;i++){
								s+=parseInt(sub[i]);
							};
							$("#sp1").val(s)
						}
					</script>

					<div style="margin-right: 130px;">
						<%--<div style="text-align: right;">
							购物车总金额: <strong style="color: #ff6600;">￥${CART.total}元</strong>
						</div>--%>
							<div style="text-align: right;">
								购物车总金额: <strong style="color: #ff6600;"><input style="border: none "size="2" id="sp1" readonly>￥元</strong>
							</div>
						<div
							style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
							<a href="javascript:void(0)" onclick="clearCart()" id="clear"
								class="clear"><button class="btn btn-warning">清空购物车</button></a>

							<button class="btn btn-success" id="b1">点击购买</button>
						</div>
					</div>

					<script type="text/javascript">
						var pids=[];
						$("#b1").click(function(){
							//意思是选择被选中的checkbox
							$.each($('input:checkbox:checked'),function(){
								pids.push($(this).attr("id"));
							});
							var url = "${pageContext.request.contextPath}/showOrder.do?pids="+pids;
							window.location.href = url;
						});
					</script>

					<script type="text/javascript">
							//清空购物车
							function clearCart(){
								var flag = window.confirm("你确定【清空】购物车吗？");
								if(flag){
									var url = "${pageContext.request.contextPath}/clearCart.do";
									window.location.href = url;
								}
							}
						</script>
				</div>
			</c:when>
			<c:otherwise>
				<center>
					<font style="font-size: 66px">购物车无商品</font>
				</center>
			</c:otherwise>
		</c:choose>

		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp" />

	</div>

	<!--右侧悬浮框-->
	<jsp:include page="/fixed_box.jsp" />

</body>

</html>