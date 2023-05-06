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
</style>
</head>

<body>

	<div class="wrap">
		<!-- 左边内容 -->
		<jsp:include page="/admin_menu.jsp"></jsp:include>


		<!-- 右边内容 -->
		<div id="right" class="tab-content right">

			<!-- 模块二商品添加-->
			<div>
				<div id="sp_add">
					<div class="panel panel-info">
						<div class="panel-heading">位置：商品添加</div>
					</div>
					<form id="sp_add_left" onsubmit="return submitProduct()"
						method="POST" style="width: 100%">
						<div style="float: left;">
							<ul style="padding-left: 20px;">
								<li><label>商品名称：</label> <input type="text"
									id="product_name" name="pname"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>商品类型：</label> <select id="typelist"
									style="height: 32px; width: 174px;">
										<option value="1">爱情鲜花</option>
										<option value="2">节日鲜花</option>
										<option value="3">毕业鲜花</option>
								</select> <strong style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>上市时间：</label> <input id="date" type="date"
									style="height: 32px; width: 174px;" name="pdate"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>&nbsp;&nbsp;&nbsp;库存&nbsp;&nbsp;&nbsp;：</label>
									<input id="num" type="text" name="num"
									onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
									onblur="this.v();"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>&nbsp;市场价 &nbsp;：</label> <input
									id="market_price" onkeyup="value=value.replace(/[^\d.]/g,'')"
									type="text" name="market_price"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>&nbsp;&nbsp;&nbsp;售价 &nbsp;&nbsp;&nbsp;：</label>
									<input id="shop_price"
									onkeyup="value=value.replace(/[^\d.]/g,'')" type="text"
									name="shop_price"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li><label>&nbsp;&nbsp;&nbsp;材料 &nbsp;&nbsp;&nbsp;：</label>
									<input id="material" type="text" style="height: 50px"
									name="pmaterial"> <strong
									style="color: red; margin-left: 5px;">*</strong></li>
								<li class="xhjj"><label>&nbsp;&nbsp;&nbsp;花语&nbsp;&nbsp;&nbsp;：</label>
									<textarea id="desc" style="margin-top: 0px; top: 16px;"
										name="pdesc"></textarea></li>
							</ul>
						</div>

						<div id="sp_add_right">
							<ul style="margin-left: -26px;">
								<li style="margin: 0 0 20px -16px;"><label>是否上架：</label> <select
									style="height: 32px; width: 174px;" name="pflag">
										<option value="1">是</option>
										<option value="0">否</option>
								</select> <strong style="color: red; margin-left: 5px;">*</strong></li>
								<li style="margin: 0 0 20px -16px;"><label>是否特价：</label> <select
									style="height: 32px; width: 174px;" name="pbargain">
										<option value="0">否</option>
										<option value="1">是</option>
								</select> <strong style="color: red; margin-left: 5px;">*</strong></li>
								<li style="margin: 0 0 20px -16px;"><label>是否热门：</label> <select
									style="height: 32px; width: 174px;" name="is_hot">
										<option value="0">否</option>
										<option value="1">是</option>
								</select> <strong style="color: red; margin-left: 5px;">*</strong></li>
							</ul>

							<label for="">图片上传</label>
							<div id="images">
								<ul id="list" style="list-style: none;"></ul>
								<label for="files"><img src="./image/comment/camera.png"
									alt="" />共<span id="ni">0</span>张，还能上传<span id="fi">10</span>张</label>
								<input type="file" id="files" name="pimage" multiple="multiple"
									onchange="setImagePreviews();"
									accept="image/gif,image/jpeg,image/jpg,image/png,image/svg">
								<strong style="color: red; margin-left: 5px;">*</strong>
							</div>
							<button id="btn_submit" type="submit"
								style="margin: 186px 232px 0 0;">提交</button>
						</div>
					</form>
					<button id="btn_reset" type="reset" style="margin: 13px 232px 0 0;"
						onclick="resetAll()">重置</button>
				</div>

				<script type="text/javascript">
					function submitProduct(){
						var product_name = $("#product_name").val();
						var num = $("#num").val();
						var market_price = $("#market_price").val();
						var shop_price = $("#shop_price").val();
						var material = $("#material").val();
						
						if(product_name == ""){
							return alert("商品名称不能为空！");
						}else if($("#date").val() == ""){
							return alert("上市时间不能为空！")
						}else if(num == "" || num <= 0){
							return alert("库存量不能为空或要大于0！");
						}else if(market_price == "" || market_price <= 0){
							return alert("市场价不能为空或要大于0！");
						}else if(shop_price == "" || shop_price <= 0){
							return alert("售价不能为空或要大于0！");
						}else if(material == ""){
							return alert("商品材料不能为空！");
						}else if($("#list").find('li').length == 0){
							return alert("需要至少一张商品图片！");;
						}else if(window.confirm("是否要提交？")){
							var cid = $("#typelist").val();
							url = "${pageContext.request.contextPath}/addProduct.do?cid=" + cid;
							$("#sp_add_left").attr("action", url);
							return alert("商品添加成功！");
						}else{
							return false;
						}
					}
					
					function resetAll(){
						if(window.confirm("是否要重置？")){
							//清除所有的input
							for(var i=0; i<document.getElementsByTagName('input').length; i++){
							    document.getElementsByTagName('input')[i].value = "";
							}
							//清除所有的textarea
							for(var i=0; i<document.getElementsByTagName('textarea').length; i++){
							    document.getElementsByTagName('textarea')[i].value = "";
							}
							//清除图片
							var ulList = document.getElementById("list");
							ulList.innerHTML="";
							return true;
						}else{
							return false;
						}
					}
				</script>

			</div>



		</div>
	</div>

</body>

</html>