<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.joinimg {
	width: 100%;
}
.memberForm {
	margin: 0 40% auto;
	padding: 0 auto;
}
.member-input {
	width: 100px;
}
.member-input input {
	width: 300px;
	height: 30px;
}
h1 {
	color: black;
}
</style>
<div>
	<div>
		<img src="../../img/welcomeimg.jpg" class="joinimg" />
	</div>
	<div class="memberForm">
		<form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
			<div class="member-input">	
				<label>아이디</label>
				<input type="text" name="userId" id="userId" onkeyup="CheckId()" required/>
				<span id="stateIdCheck" class="stateIdCheck">아이디를 입력하세요</span>
			</div>
			<div class="member-input">
				<label>닉네임</label>
				<input type="text" name="nickname" id="nickname" onkeyup="CheckNick()" required />
				<span id="stateNickChk" class="state">닉네임을 입력하세요</span>
			</div>
			<div class="member-input">
				<label>비밀번호</label>
				<input type="password" name="userPwd" id="userPwd" required />
			</div>
			<div class="member-input">
				<label>비밀번호확인</label>
				<input type="password" name="userPwd2" id="userPwd2" required />
			</div>
			<div class="member-input">
				<label>이름</label>
				<input type="text" name="userName" id="userName" required />
			</div>
			<div class="radio">
				<label>성별:&nbsp;&nbsp;&nbsp;</label> 
				<label><input type="radio" name="gender" value="남" required>남</label>
				&nbsp;&nbsp;&nbsp; <label><input type="radio" name="gender"
					value="여" required>여</label>
			</div>
		</form>
	</div>
</div>