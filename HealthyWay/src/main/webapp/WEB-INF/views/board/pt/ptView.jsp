<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptView.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="${url}/js/board/pt/ptView.js"></script>
<script>
// 글 삭제 확인
function del(){
	if(confirm("삭제하시겠습니까?")){
			// 확인버튼 선택시
			location.href = "${url}/board/ptDel?board_num=${vo.board_num}&pt_img_file=${vo.pt_img_file}";
		}
}

// 그룹pt 참가신청
function apply(){
	if(confirm("참여하시겠습니까?")){
		event.preventDefault();
		
		$.ajax({
			url: "/board/ptApply?board_num=${vo.board_num}",
			type: 'get',
			success: function(result){
				if(result > 0){
					alert("참가 신청이 완료됐습니다. 리더의 승인이 필요합니다.");
					location = "${url}/board/ptView?board_num=${vo.board_num}";
				}	
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	}
}

$(function(){
	// 그룹pt 참가신청
	$(".applyBtn").click(function(){
		apply();
	});
	
	// 글작성자일 경우 관리자 메뉴 클릭가능
	if(${lVO.user_id == logId}){
		$("#menu_manage").click(function(){
			$(".all_content").css("display", "none");
			$(".manage_wrap").css("display", "block");

			$(".all_menu").css("background-color", "#FCFCFC");
			$(".all_menu").css("color", "gray");
			$(".all_menu").css("border", "1px solid #E4E5E5").css("border-bottom", "1px solid gray").css("border-left", "none");
			$("#menu_info").css("border-left", "1px solid #E4E5E5");
			
			$(this).css("border", "1px solid gray").css("border-bottom", "none");
			$(this).css("background-color", "#fff").css("color","#000");
			$(this).children('span').text("lock_open");
			$("#menu_qna").children('span').text("lock");
		});
	}
	
	// 참가자 목록 가져오는 함수
	function apply_listAll(){
		var url = "${url}/board/apply_list";
		var params = "board_num=${vo.board_num}";
		
		$.ajax({
			url: url,
			data: params,
			success: function(result){
				if(result.length > 0){
					var $result = $(result);
					var tag = "<li>상태</li>";
						tag += "<li>아이디</li>";
						tag += "<li>성별</li>";
						tag += "<li>나이</li>";
						tag += "<li>키</li>";
						tag += "<li>몸무게</li>";
						tag += "<li>참여 횟수</li>";
						tag += "<li>&nbsp;</li>";
						tag += "<li>&nbsp;</li>";
						
					var W = "W";
					$result.each(function(idx, vo){
						tag += "<li>" + vo.user_state + "</li>";
						tag += "<li class='apply_id'>" + vo.user_id + "</li>";
						if(vo.gender == "W"){
							tag += "<li>여</li>";
						}else{
							tag += "<li>남</li>";
						}
						tag += "<li>" + vo.age + "세</li>";
						if(vo.height == 0){
							tag += "<li>미공개</li>";
						}else{
							tag += "<li>" + vo.height + "cm</li>";
						}
						if(vo.weight == 0){
							tag += "<li>미공개</li>";
						}else{
							tag += "<li>" + vo.weight + "kg</li>";
						}
						tag += "<li>00</li>";
						
						// status가 참여중이라면 숨기기
						if(vo.user_state == "참여중"){
							tag += "<li><button class='resignBtn' style='padding: 3px 6px;'><span class='material-symbols-outlined' style='font-size: 16px; vertical-align: sub;'>warning</span> 탈퇴</button></li>";
							tag += "<li><button class='denyBtn' style='display: none;'>거절</button></li>"
						}else{
							tag += "<li><button class='acceptBtn'>수락</button></li>";
							tag += "<li><button class='denyBtn'>거절</button></li>";
						}
							
					});		
				}else{
					var tag = "아직 참여자가 없습니다.";
				}
				$(".manage_list").append(tag);
				
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
		
	}
	

	
	// 관리자 -> 참가 수락
	$(document).on("click", ".acceptBtn", function(){
		if(confirm("수락하시겠습니까?")){
			var url = "/board/applyAccept";
			var params = "board_num=${vo.board_num}&user_id=" + $(this).parent().prev().prev().prev().prev().prev().prev().text();

			$.ajax({
				url: url,
				data: params,
				success: function(result){
					$(".manage_list").empty();
					apply_listAll();
					
				},
				error: function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	
	// 관리자 -> 참가 거절
	$(document).on("click", ".denyBtn", function(){
		if(confirm("거절하시겠습니까?")){
			var url = "/board/applyDeny";
			var params = "board_num=${vo.board_num}&user_id=" + $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					$(".manage_list").empty();
					apply_listAll();
				},
				error: function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	
	// 관리자 -> 탈퇴
	$(document).on("click", ".resignBtn", function(){
		if(confirm("선택한 그룹멤버를 탈퇴시겠습니까?")){
			var url = "/board/applyDeny";
			var params = "board_num=${vo.board_num}&user_id=" + $(this).parent().prev().prev().prev().prev().prev().prev().text();
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					$(".manage_list").empty();
					apply_listAll();
				},
				error: function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	
	
	apply_listAll();
	
	
	
});


</script>


<!-- 임시로 해둔 탑입니다 -->
<div class="top"></div>
    
<div class="wrap">
	<div class="head_wrap">
		<span id="keyword">${vo.keyword}</span>
		<h1>${vo.title}</h1>
		<span id="state">${vo.state}</span>
	</div>
	
	<div class="main_wrap">
		<div class="main_content_wrap">
			<ul class="menu_list">
				<li id="menu_info" class="all_menu">정보</li>
				<li id="menu_member" class="all_menu">멤버</li>
				<li id="menu_qna" class="all_menu">소통방 <span class="material-symbols-outlined" style="vertical-align: sub;">lock</span></li>
				<li id="menu_manage" class="all_menu" <c:if test="${lVO.user_id != logId}">style="cursor: no-drop;</c:if>">관리 <span class="material-symbols-outlined" style="vertical-align: sub;">lock</span></li>
			</ul>
			
			<div class="recu_status_wrap all_content">
				<h2>모집 현황</h2>
				<ul>
					<li>리더</li>
					<li>1/1</li>
					<li style="border: none;">&nbsp;</li>
					<li>&nbsp;</li>
					<li>멤버</li>
					<li>${pCount}/${vo.max_user}</li>
					<c:if test="${lVO.user_id == logId}">
						<li style="border: none;">&nbsp;</li>
					</c:if>
					<c:if test="${lVO.user_id != logId and pCount < vo.max_user}">
						<li class="applyBtn">참여</li>
					</c:if>
					<c:if test="${lVO.user_id != logId and pCount == vo.max_user}">
						<li>모집완료</li>
					</c:if>
					<li>&nbsp;</li>
				</ul>
				
			</div>
			
			<div class="content_wrap all_content">
				<h2>내용</h2>
				<p>
					${vo.content}
				</p>
			</div>
			
			<div class="member_wrap all_content" style="display: none">
				<h2>-리더</h2>
				<div class="main_member_leader_wrap">
					<div class="member_profile">
						<ul>
							<li class="main_member_img_wrap"><img src="${lVO.profie_img}"></li>
							<li>${lVO.user_nickname} (${lVO.user_id})</li>
							<li>고수</li>
							<li>나이 : ${lVO.age}</li>
							<li>
								Height : 
								<c:if test="${lVO.height == null or lVO.height == 0.0}">비공개</c:if>
								<c:if test="${lVO.height != null and lVO.height != 0.0}">${lVO.height}cm</c:if> 
							</li>
							<li>
								성별 : 
								<c:if test="${lVO.gender == 'W'}">여자</c:if>
								<c:if test="${lVO.gender == 'M'}">남자</c:if>
							</li>
							<li>
								Weight : 
								<c:if test="${lVO.weight == null or pVO.weight == 0}">비공개</c:if>
								<c:if test="${lVO.weight != null and pVO.weight != 0}">${lVO.weight}kg</c:if> 
							</li>
						</ul>
					</div>
				</div>
				<h2>-멤버</h2>
				<div class="main_member_wrap">
					<c:forEach var="pVO" items="${pList}">
						<div class="member_profile">
							<ul>
								<li class="main_member_img_wrap"><img src="${pVO.profie_img}"></li>
								<li>${pVO.user_nickname} (${pVO.user_id})</li>
								<li>고수</li>
								<li>나이 : ${pVO.age}세</li>
								<li>
									Height : 
									<c:if test="${pVO.height == null or pVO.height == 0.0}">비공개</c:if>
									<c:if test="${pVO.height != null and pVO.height != 0.0}">${pVO.height}cm</c:if> 
								</li>
								<li>
									성별 : 
									<c:if test="${pVO.gender == 'W'}">여자</c:if>
									<c:if test="${pVO.gender == 'M'}">남자</c:if>
								</li>
								<li>
									Weight : 
									<c:if test="${pVO.weight == null or pVO.weight == 0}">비공개</c:if>
									<c:if test="${pVO.weight != null and pVO.weight != 0}">${pVO.weight}kg</c:if> 
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="comment_wrap all_content" style="display: none">
				<input type="text" name="comment" id="comment" placeholder="질문을 입력해주세요.">
				<input type="submit" value="등록하기">
			
			</div>
			
			<div class="manage_wrap all_content" style="display: none;">
				<h2>참여자</h2>
				<ul class="manage_list">
				</ul>
			</div>
			
		</div>
		
		
		<div class="leader_profile_wrap">
			<div class="profile_info_wrap">
				<h4>리더정보</h4>
				<div class="leader_img_wrap"><img src="${lVO.profie_img}"></div>
				<div class="leader_name_wrap">
					${lVO.user_nickname} (${lVO.user_id})
				</div>
			</div>
			<div class="profile_info_wrap">
				<h4>활동 기간</h4>
				${vo.start_date} ~ ${vo.end_date} (${vo.datecal}일)
			</div>
			<div>
				<h4>그룹 멤버 (${pCount}명)</h4>
				<c:forEach var="pVO" items="${pList}">
					<div class="group_member_wrap">
						<div class="member_img_wrap"><img src="${pVO.profie_img}"></div>
						<div class="member_name_wrap">${pVO.user_nickname} (${lVO.user_id})</div>
					</div>
				</c:forEach>
			</div>
			<button class="applyBtn"<c:if test="${lVO.user_id == logId}">style="display: none;"</c:if>>참여하기</button>
			<c:if test="${vo.user_id == logId}">
				<button id="editBtn" onclick="location='/board/ptEdit?board_num=${vo.board_num}'">수정하기</button>
				<button id="delBtn" onclick="location='javascript:del()'">삭제하기</button>
			</c:if>
		</div>
	
	
	</div>


</div>