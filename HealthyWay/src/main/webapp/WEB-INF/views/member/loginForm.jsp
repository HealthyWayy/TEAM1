<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.joinimg {
	width: 100%;
}

.loginForm {
	margin: 0 auto;
}

#log {
	text-align: center;
}
.input-id {
	justify-content: center;
	text-align: center;
	display: flex;
}
.input-area1 {
	text-align: left;
	width: 120px;
}
.input-area2 {
	width: 300px;
	height: 30px;
}

.input-area2 input {
	width: 90%;
	height: 30px;
}

.login-btn {
	top-margin: 5px;
}
.login-btn button {
	height: 30px;
	width: 390px;
}

</style>

<div>
	<div>
		<img src="../../img/loginimg.jpg" class="joinimg" />
	</div>
	<section class="loginForm">
		<div id="log">
			<h1>Login</h1>
			<form method="post" action="/member/loginOk" id="logFrm">
				
				<div class="input-id">
					<div class="input-area1">
						<label for="userId">ID</label> 
					</div>
					<div class="input-area2">
						<input type="text" name="userId" id="userId" required />
					</div>
				</div>
				<div class="input-id">
					<div class="input-area1">
						<label for="userPwd">Password</label>
					</div>
					<div class="input-area2">
						<input type="password" name="userPwd" id="userPwd" autocomplete="off" required>
					</div>
				</div>
				<div class="login-btn">
					<button type="button" value="로그인" onclick="LogFormCheck()">Login</button>
				</div>
				<div class="bottom-menu">
					<a href="${url}/member/memberFind">아이디/비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="${url}/member/memberForm">회원가입
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</section>
</div>

