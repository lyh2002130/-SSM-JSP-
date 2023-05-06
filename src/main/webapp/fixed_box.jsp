<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--右侧悬浮框-->
<div class="fixed-box">
	<img src="img/online.png" alt="">
	<!-- 点击在线咨询弹出模拟对话框，应用bootstrap ,应用QQ推广功能-->
	<div class="online">
		<a href="http://wpa.qq.com/msgrd?v=3&uin=2636329637&site=qq&menu=yes"
			target="_blank" style="width: 0; height: 0;">在线咨询</a>
		<!-- <a href="#" data-toggle="modal" data-target="#about">在线咨询</a> -->
	</div>

	<!-- 鼠标点击弹出二维码 -->
	<a href="#"><img class="code" src="img/code.png" alt=""></a> <a
		href="#return-top"><img class="fd" src="img/top.png" alt=""></a>
</div>

<!-- 点击在线咨询弹出框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="about">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					<img src="img/logo.jpg">
				</h4>
			</div>
			<div class="modal-body">
				<div class="content">聊天内容</div>
				<hr>
				<textarea rows="10" cols="30">说点什么吧...</textarea>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-default " data-dismiss="modal ">关闭</button>
				<a href="# " class="btn btn-primary ">发送</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--js代码=>下拉框id="bs-example-navbar-collapse-1 "对应的内容id=tab-list"-->
<script>
	$(document).ready(function() {
		$("#bs-example-navbar-collapse-1 .dropdown-menu a").click(function() {
			var href = $(this).attr("href");
			$("#tab-list a[href='" + href + "']").tab("show");
		});
	});
</script>