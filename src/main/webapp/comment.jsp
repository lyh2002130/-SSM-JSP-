<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>已买到的宝贝</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/comment.css">
<link rel="stylesheet" href="css/star.css" />
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style>
#files {
	display: none;
}
</style>

</head>

<body
	style="background: url(../images/beijing.jpg) no-repeat; background-size: 100% 100%;">

	<div class="header position-relative">
		<div class="wrap">
			<!--1.1.0 头部的左分区logo-->
			<div class="logo">
				<a href="default.jsp"><img src="img/logo.jpg" /></a>
			</div>
			<!--1.2.0头部的右分区-->
			<div class="header-right clearfix">
				<!--1.2.1右分区第一部分 登录条-->
				<div class="header-login">
					<ol class="list-inline" style="font-size: 15px;">
						<li>欢迎${USER.username}：</li>
						<%--若登录了--%>
						<c:if test="${!empty USER}">
							<li><a
								href="${pageContext.request.contextPath}/findOrder.do">个人中心</a></li>
							<li><a
								href="${pageContext.request.contextPath}/addCart.do?num=0">购物车</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.do">退出</a></li>
						</c:if>
					</ol>
				</div>
				<!--1.2.3右分区第三部分 搜索框-->
				<div class="comment_top_sousuo" style="margin: 38px 0 0 46px;">
					<input type="text" class="comment_top_input" id="key"
						placeholder="请输入您要搜索的关键词">
					<button type="submit" class="comment_top_search"
						onclick="searchKey()">搜索</button>
				</div>

			</div>
		</div>

		<script type="text/javascript">
			function searchKey(){
				var key = document.getElementById("key").value;
				url = "${pageContext.request.contextPath}/selectAllProductByPname.do?key="+key;
				url =  encodeURI(encodeURI(url));
				window.open(url);
			}
			document.onkeydown = function (e) { // 回车事件
				// 兼容FF和IE和Opera
			    var theEvent = window.event || e;
			    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
			    if (code == 13) {
			    	searchKey();
			    }
			}
		</script>
	</div>

	<div class="assess" style="margin: 120px auto;">
		<div class="assess_left" style="margin-top: 0;">
			<img src="${Product.pimage}" style="width: 250px;">
			<ul>
				<li>${Product.pname}</li>
				<li style="color: red;">$${Product.shop_price}</li>
			</ul>

		</div>


		<form id="comment_form" style="margin-top: 0;">
			<p>请至少填写一件商品的评价</p>
			<ul>
				<li><input id="uid" name="uid" value="${USER.uid}"
					style="display: none;"></li>
				<li><input id="pid" name="pid" value="${Product.pid}"
					style="display: none;"></li>
				<li id="stars"><label for="">商品满意度</label>
					<div class="star_bg"
						style="background: url(/images/star.png) repeat-x;">
						<input type="radio" id="starScore1" name="score"
							class="score score_1" value="1" /> <a href="#starScore1"
							class="star star_1"><label for="starScore1"></label></a> <input
							type="radio" id="starScore2" name="score" class="score score_2"
							value="2" /> <a href="#starScore2" class="star star_2"><label
							for="starScore2"></label></a> <input type="radio" id="starScore3"
							name="score" class="score score_3" value="3" /> <a
							href="#starScore3" class="star star_3"><label
							for="starScore3"></label></a> <input type="radio" id="starScore4"
							name="score" class="score score_4" value="4" /> <a
							href="#starScore4" class="star star_4"><label
							for="starScore4"></label></a> <input type="radio" id="starScore5"
							name="score" class="score score_5" value="5" /> <a
							href="#starScore5" class="star star_5"><label
							for="starScore5"></label></a>
					</div> <!--<span id="num">0</span>分--></li>
				<li><label for="">买家印象</label>
					<ul id="impress">
						<li><a href="#">鲜花很好看</a></li>
						<li><a href="#">包装很好</a></li>
						<li><a href="#">花样多</a></li>
						<li><a href="#">花朵很新鲜</a></li>
						<li><a href="#">颜色还不错</a></li>
						<li><a href="#">很漂亮</a></li>
						<li><a href="#">再来一束</a></li>
						<li><a href="#">不错</a></li>
						<li><a href="#">下次再来</a></li>
					</ul></li>
				<li id="advices"><label for="">评价晒单</label> <textarea
						name="cmcontent" id="cmcontent" cols="90" rows="10"
						placeholder="商品是否给力？快分享你的购买心得吧~"></textarea>
					<div id="count">
						<span id="nn">0</span>/<span id="fn">100</span>（评价多于<span id="spn">10</span>个字，有机会抽奖哦~）
					</div></li>
				<li><label for="">图片上传</label>
					<div id="images">
						<ul id="list"></ul>
						<label for="files"><img src="image/comment/camera.png"
							alt="" />共<span id="ni">0</span>张，还能上传<span id="fi">10</span>张</label> <input
							type="file" id="files" multiple="multiple"
							onchange="setImagePreviews();"
							accept="image/gif,image/jpeg,image/jpg,image/png,image/svg">
					</div></li>
				<li id="btn">
					<button id="btn_submit" type="button" onclick="submitComment()">提交</button>
					<button id="btn_reset" type="reset" onclick="resetComment()">重置</button>
				</li>
			</ul>
		</form>

		<script type="text/javascript">
			function submitComment(uid, pid){
				if(window.confirm("是否要提交？")){
					var input = document.getElementById('files');
		           	var url = window.URL.createObjectURL(input.files[0]);
		           	var name = input.files[0].name;
					var comment_form = $("#comment_form").serialize()
					$.post("${pageContext.request.contextPath}/addComment.do", comment_form + "&cmimage=" + name, function(data){
						if(data == "OK"){
							alert("评价提交成功！");
							window.location.reload();
						}else{
							alert("评价提交失败！");
							window.location.reload();
						}
					})
				}else{
					return false;
				}
			}
			function resetComment(){
				if(window.confirm("是否要重置？")){
					document.getElementById('cmcontent').val = "";
					//清除图片
					var ulList = document.getElementById("list");
					ulList.innerHTML="";
					return true;
				}
			}
		</script>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp" />


	<script type="text/javascript">
		/*评价内容*/
		var texts = document.getElementById('cmcontent');
		var nn = document.getElementById('nn');
		var fn = document.getElementById('fn');
		var count = document.getElementById('count');
		texts.oninput = function() {
			if (this.value.length <= 100) {
				nn.innerHTML = this.value.length;
				fn.innerHTML = 100 - this.value.length
			}else{
				count.innerHTML = '您已经超出了' + (this.value.length - 100) + '字';
				count.style.color = "red"
			}
		}
	
		//图片添加
		var n = 0;
		function setImagePreviews() {
			var oList = document.getElementById('list');
			var oInput = document.getElementById('files');
			var ni = document.getElementById('ni');
			var fi = document.getElementById('fi');
			oList.innerHTML += "";
			// 获取上传图片的个数
			var fileList = oInput.files;
			n += fileList.length;
			if (n <= 10) {
				for (var i = 0; i < fileList.length; i++) {
					if (oInput.files && oInput.files[i]) {
						createLi(window.URL.createObjectURL(oInput.files[i]));
						// console.log(oInput.files[i].name);
					}
				}
				ni.innerHTML = n;
				fi.innerHTML = 10 - n;
			} else {
				ni.innerHTML = 10;
				fi.innerHTML = 0;
			}
	
			function createLi(ImgSrc) {
				var oLi = document.createElement('li');
				var oImg = document.createElement('img');
				oImg.src = ImgSrc;
				oLi.appendChild(oImg);
				oList.appendChild(oLi);
			}
		}
	</script>
</body>

</html>