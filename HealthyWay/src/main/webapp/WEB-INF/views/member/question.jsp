<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/js/member/question.js"></script>
<div class="wrap">
	<div class="memberForm">
		<h1>Healthy Way와 함께<br>
			건강한 운동 경험을 얻어가세요!</h1>
		<form method="post" action="/member/QuestionOk" id="mFrm" onsubmit="return QuestionCheck()">
            <ul>
            	<li>키</li>
            	<li>
            		<input type='text' name='height' id='height' placeholder='키를 입력해주세요' required/><br>
					<span id='chkH'></span>
					<input type="text" id='heightChk' value="N" style="display:none;">
            	</li>
				<li>몸무게</li>
				<li>
	            	<input type='text' name='weight' id='weight' placeholder='몸무게를 입력해주세요' required/><br>
					<span id='chkW'></span>
					<input type="text" id='weightChk' value="N" style="display:none;">
				</li>
				<li style="float: left; margin-right: 30px;">운동강도</li>
				<li style="margin-top: 10px;">
					<label><input type="radio" name="strength" value="top" required>상</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="strength" value="middle" required>중</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="strength" value="bottom" required>하</label>
				</li>
				<li style="float: left; margin-right: 30px;">즐겨하는 운동</li>
				<li style="margin-top: 10px;">
					<label><input type="radio" name="favorite" value="yoga" required>요가</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="favorite" value="pilates" required>필라테스</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="favorite" value="health" required>헬스</label>
				</li>
				<li>
            		<button type="submit">제출하기</button>
            	</li>
    		</ul>
        </form>
        <div class="check_account">이미 계정이 있으신가요?&nbsp;&nbsp;<a href="${url}/member/loginForm">로그인</a></div>
	</div>
	<div class="img_wrap">
		<img src="${url}/img/join_img.jpeg">
	</div>

</div>