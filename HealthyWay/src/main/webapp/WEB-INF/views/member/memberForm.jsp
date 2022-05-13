<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${url}/css/member/memberForm.css">

<div class="wrap">
	<div class="memberForm">
		<h1>Healthy Way와 함께<br>
			건강한 운동 경험을 얻어가세요!</h1>
		<form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <ul>
            	<li>아이디</li>
            	<li>
            		<input type='text' name='user_id' id='user_id' placeholder='아이디 입력' required/><br>
					<span id='chk'></span>
					<input type="text" id='idchk' value="N" style="display:none;">
            	</li>
				<li>닉네임</li>
				<li>
	            	<input type='text' name='user_nickname' id='user_nickname' placeholder='닉네임 입력' required/><br>
					<span id='chkN'></span>
					<input type="text" id='stateNickChk' value="N" style="display:none;">
				</li>
				<li>비밀번호</li>
				<li>
					<input type="password" name="user_pw" id="user_pw" autocomplete="off" required/>
				</li>
				<li>비밀번호 확인</li>
				<li>
					<input type="password" name="user_pw2" id="user_pw2" autocomplete="off" required/>
				</li>
				<li>이름</li>
				<li>
					<input type="text" name="user_name" id="user_name" required/>
				</li>
				<li>연락처</li>
				<li>
					<input type='text' name='tel' id='tel' placeholder='예시) 01012341234' required/><br>
					<span id='chkT'></span>
					<input type="text" id='telChk' value="N" style="display:none;">
				</li>
				<li>이메일</li>
				<li>
	            	<input type='text' name='user_email' id='user_email' placeholder='예시) healthyWay@naver.com' required/><br>
					<span id='chkE'></span>
					<input type="text" id='EmailChk' value="N" style="display:none;">
				</li>
				<li>나이</li>
				<li>
					<input type='text' name='age' required/>
				</li>
				<li style="float: left; margin-right: 30px;">성별</li>
				<li style="margin-top: 10px;">
					<label><input type="radio" name="gender" value="M" required>남</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="gender" value="W" required>여</label>
				</li>
				<li>
            		<button type="submit" onclick="MemberCheck()">가입하기</button>
            	</li>
    		</ul>
        </form>
        <div class="check_account">이미 계정이 있으신가요?&nbsp;&nbsp;<a href="${url}/member/loginForm">로그인</a></div>

	</div>
	<div class="img_wrap">
		<img src="${url}/img/join_img.jpeg">
	</div>

</div>
<script type="text/javascript">
	let nickPass = false;
	let telPass = false;
	let emailPass = false;
	//가입하기 클릭시
	function MemberCheck() {
		let user_id = document.getElementById("user_id");
		if(user_id.value=='') {
			alert("아이디를 입력하세요");
			user_id.focus();
			return false;
		}
		
		// 비밀번호 확인
		let user_pw = document.getElementById("user_pw");
		let user_pw2 = document.getElementById("user_pw2");
		if(user_pw.value=='' || user_pw2.value=='') {
			alert("비밀번호를 입력하세요");
			user_pw.focus();
			return false;
		}
		if(user_pw.value != user_pw2.value) {
			alert("비밀번호가 일치하지 않습니다");
			user_pw2.focus();
			return false;
		}
		
		// 이름
		let user_name = document.querySelector("#user_name");
		if(user_name.value==''){
			alert("이름을 입력하세요");
			user_name.focus();
			return false;
		}
		
		//----------------- 중복방지
		// 닉네임중복확인
		if(!nickPass){
	        alert("닉네임을 확인해주세요");
	        return false
	    }
		
		// 전화번호중복확인
		if(!telPass){
	        alert("전화번호를 확인해주세요");
	        return false
	    }
		
		// 이메일중복확인
		if(!emailPass){
	        alert("이메일을 확인해주세요");
	        return false
	    }
		
		return true;
	}
	
	//----------------------------------------------------------------
	$(function() {
		//아이디 중복검사
		$("#user_id").keyup(function() {
			var user_id = $("#user_id").val();
			console.log(user_id);
			if (user_id != '' && user_id.length >= 6) {
				var url = "/member/checkId";
				$.ajax({
					url : url,
					data : "user_id=" + user_id,
					type : "POST",
					success : function(result) {
						if (result == user_id) {//사용불가능
							$("#chk").html("이미 사용중인 아이디입니다.");
							
							$("#idchk").val("N");
							$("#chk").css("color", "red")
						} else {//사용가능
							$("#chk").html("사용 가능한 아이디입니다.");
							$("#idchk").val("Y");
							$("#chk").css("color", "blue")
						}
					}
				});
			} else {//사용불가
				$("#chk").html("6자 이상으로 입력해주세요.");
				$("#idchk").val("N");
				$("#chk").css("color", "red")
			}
		});
	});
	
	$(function() {
		//닉네임 중복검사
		$("#user_nickname").keyup(function() {
			var user_nickname = $("#user_nickname").val();
			nickPass = false;
			if (user_nickname != '' && user_nickname.length >= 2) {
				var url = "/member/checkNick";
				$.ajax({
					url : url,
					data : "user_nickname=" + user_nickname,
					type : "POST",
					success : function(result) {
						if (result == user_nickname) {//사용불가능
							$("#chkN").html("이미 사용중인 닉네임입니다.");
							$("#stateNickChk").val("N");
							$("#chkN").css("color", "red")
							nickPass = false;
						} else {//사용가능
							$("#chkN").html("사용 가능한 닉네임입니다.");
							$("#stateNickChk").val("Y");
							$("#chkN").css("color", "blue")
							nickPass = true;
						}
					}
				});
			} else {//사용불가
				$("#chkN").html("2자 이상으로 입력해주세요.");
				$("#stateNickChk").val("N");
				$("#chkN").css("color", "red")
				nickPass = false;
			}
		});
	});
	
	$(function() {
		//핸드폰번호 중복검사
		$("#tel").keyup(function() {
			var tel = $("#tel").val();
			telPass = false;
			if (tel != '' && tel.length >= 10 && tel.length <=12) {
				var url = "/member/checkTel";
				$.ajax({
					url : url,
					data : "tel=" + tel,
					type : "POST",
					success : function(result) {
						if (result == tel) {//사용불가능
							$("#chkT").html("</br>이미 사용중인 전화번호입니다.");
							$("#telChk").val("N");
							$("#chkT").css("color", "red")
							telPass = false;
						} else {//사용가능
							$("#chkT").html("</br>사용 가능한 전화번호입니다.");
							$("#telChk").val("Y");
							$("#chkT").css("color", "blue")
							telPass = true;
						}
					}
				});
			} else {//사용불가
				$("#chkT").html("9자~12자 사이어야 합니다. 다음과 같이 입력해주세요. </br> 예) 01012341234");
				$("#telChk").val("N");
				$("#chkT").css("color", "red")
				telPass = false;
			}
		});
	});
	
	$(function() {
		//이메일 중복검사
		$("#user_email").keyup(function() {
			var user_email = $("#user_email").val();
			emailPass = false;
			if (user_email != '' && user_email.length >= 8) {
				var url = "/member/checkEmail";
				$.ajax({
					url : url,
					data : "user_email=" + user_email,
					type : "POST",
					success : function(result) {
						if (result == user_email) {//사용불가능
							$("#chkE").html("이미 사용중인 이메일입니다.");
							$("#EmailChk").val("N");
							$("#chkE").css("color", "red")
							emailPass = false;
						} else {//사용가능
							$("#chkE").html("사용 가능한 이메일입니다.");
							$("#EmailChk").val("Y");
							$("#chkE").css("color", "blue")
							emailPass = true;
						}
					}
				});
			} else {//사용불가
				$("#chkE").html("이메일은 아이디/비밀번호 찾기에 필요하니 정확히 입력바랍니다.");
				$("#EmailChk").val("N");
				$("#chkE").css("color", "red")
				emailPass = false;
			}
		});
	});
	
	
</script>

