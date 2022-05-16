<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/js/member/question.js"></script>
<link href="${url}/css/member/question.css" rel="stylesheet" type="text/css">
<div class="wrap">
	<div class="memberForm">
		<img src="../../../img/question.jpg"/>
		<div class="mForm">
			<h1>나에 대해 알려주세요!</h1><br>
			<form method="post" action="/member/QuestionOk" id="mFrm" onsubmit="return QuestionCheck()">
	            <div class="QuestionFrm_btn_wrap">
	            	<div class="input-h">
	            		<div class="input-area1">
	            			<li>키</li>
	            		</div>
	            		<div class="input-area2">
	            			<input type='text' name='height' id='height' placeholder='키를 입력해주세요' required/>&nbsp;&nbsp;cm<br>
							<span id='chkH'></span>
							<input type="text" id='heightChk' value="N" style="display:none;">
	            		</div>
	            	</div>
	            	
	            	<div class="input-h">
	            		<div class="input-area1">
	            			<li>몸무게</li>
	            		</div>
	            		<div class="input-area2">
	            			<input type='text' name='weight' id='weight' placeholder='몸무게를 입력해주세요' required/>&nbsp;&nbsp;kg<br>
							<span id='chkW'></span>
							<input type="text" id='weightChk' value="N" style="display:none;">
	            		</div>
	            	</div>
	            	
	            	<div class="input-h">
	            		<div class="input-area1">
	            			<li>운동강도</li>
	            		</div>
	            		<div class="input-area3">
	            			<input type="radio" id="select1" name="strength" value="top" required><label for="select1">상</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" id="select2" name="strength" value="middle" required><label for="select2">중</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" id="select3" name="strength" value="bottom" required><label for="select3">하</label>
	            		</div>
	            	</div>
	            	
	            	<div class="input-h">
	            		<div class="input-area1">
	            			<li>즐겨하는 운동</li>
	            		</div>
	            		<div class="input-area4">
	            			<input type="radio" id="select4" name="favorite" value="yoga" required><label for="select4">요가</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" id="select5" name="favorite" value="pilates" required><label for="select5">필라테스</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" id="select6" name="favorite" value="health" required><label for="select6">헬스</label>
	            		</div>
	            	</div>
	            	<br><br>
	            	<button type="submit" class="sub-btn">제출하기</button>
	            </div>
	        </form>
	        <br><br><br><br><br>
	        <div class="check_account">다음에 하시겠습니까?&nbsp;&nbsp;<a href="/" class="gohome">홈으로가기</a></div>
		</div>
	</div>
</div>