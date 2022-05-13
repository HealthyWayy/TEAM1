<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

body {
	background-color: white;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-body {
	padding: 2rem;
}

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: inline_block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not(:placeholder-shown) ~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}
</style>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<form method="post" class="form-signin" action="findUserPw" name="findform">
	
	<div class="form-label-group">
		<input type="text" id="user_id" name="user_id" class="form-control" /> <label
			for="user_id">아이디</label>
	</div>
	
	<div class="form-label-group">
		<input type="text" id="user_name" name="user_name" class="form-control" /> <label
			for="user_name">이름</label>
	</div>

	<div class="form-label-group">
		<input type="text" id="user_email" name="user_email" class="form-control" /> <label
			for="user_email">이메일</label>
	</div>

	<div class="form-label-group">
		<input type="text" id="tel" name="tel" class="form-control" /> <label
			for="tel">연락처</label>
	</div>
	
	<div class="form-label-group">
		<input class="btn btn-lg btn-secondary btn-block text-uppercase"
			type="submit" value="check">
	</div>

	<!-- 이름과 이메일이 일치하지 않을 때-->
	<c:if test="${check == 1}">
		<script>
			opener.document.findform.tel.value = "";
			opener.document.findform.user_name.value = "";
			opener.document.findform.user_email.value = "";
			opener.document.findform.tel.value="";
		</script>
		<label>일치하는 정보가 존재하지 않습니다.</label>
	</c:if>

	<!-- 이름과 이메일이 일치할 때 -->
	<c:if test="${check == 0 }">
		<label>찾으시는 비밀번호는 '${user_pw}' 입니다.</label>
		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="button" value="OK" onclick="findClose()">
		</div>
	</c:if>
</form>
<script>
	function findClose() {
		location.href="/member/loginForm";
	}
</script>



