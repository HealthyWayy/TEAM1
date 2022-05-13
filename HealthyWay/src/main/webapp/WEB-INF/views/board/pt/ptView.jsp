<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptView.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="${url}/js/board/pt/ptView.js"></script>
<script>
function del(){
	if(confirm("삭제하시겠습니까?")){
			// 확인버튼 선택시
			location.href = "${url}/board/ptDel?board_num=${vo.board_num}";
		}
}

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
				<li id="menu_qna" class="all_menu">질문</li>
				<li id="menu_manage" class="all_menu">관리 <span class="material-symbols-outlined" style="vertical-align: sub;">lock</span></li>
			</ul>
			
			<div class="recu_status_wrap all_content">
				<h2>모집 현황</h2>
				<ul>
					<li>리더</li>
					<li>1/1</li>
					<li style="background-color: #F05A5D; color: #fff; border: 1px solid #F05A5D;">완료</li>
					<li>&nbsp;</li>
					<li>멤버</li>
					<li>2/8</li>
					<li>참여</li>
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
								<c:if test="${lVO.height != null and lVO.height != 0.0}">${lVO.height}</c:if> 
							</li>
							<li>
								성별 : 
								<c:if test="${lVO.gender == 'W'}">여자</c:if>
								<c:if test="${lVO.gender == 'M'}">남자</c:if>
							</li>
							<li>
								Weight : 
								<c:if test="${lVO.weight == null}">비공개</c:if>
								<c:if test="${lVO.weight != null}">${lVO.weight}</c:if> 
							</li>
						</ul>
					</div>
				</div>
				<h2>-멤버</h2>
				<div class="main_member_wrap">
					<div class="member_profile">
						<ul>
							<li class="main_member_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
							<li>김헬짱 (aaaaaa)</li>
							<li>고수</li>
							<li>나이 : 22</li>
							<li>Height : 165</li>
							<li>성별 : 여</li>
							<li>Weight : 비공개</li>
						</ul>
					</div>
					<div class="member_profile">
						<ul>
							<li class="main_member_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
							<li>김헬짱 (aaaaaa)</li>
							<li>고수</li>
							<li>나이 : 22</li>
							<li>Height : 165</li>
							<li>성별 : 여</li>
							<li>Weight : 비공개</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="comment_wrap all_content" style="display: none">
				<input type="text" name="comment" id="comment" placeholder="질문을 입력해주세요.">
				<input type="submit" value="등록하기">
			
			</div>
			
			<div class="manage_wrap all_content" style="display: none;">
				<h2>참여자</h2>
				<ul class="manage_list">
					<li>상태</li>
					<li>이름</li>
					<li>성별</li>
					<li>나이</li>
					<li>키</li>
					<li>몸무게</li>
					<li>참여 횟수</li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
					
					<li>참여 대기 중</li>
					<li>김진우</li>
					<li>남자</li>
					<li>00</li>
					<li>000cm</li>
					<li>00kg</li>
					<li>00</li>
					<li><button>수락</button></li>
					<li><button>거절</button></li>
					
					<li>그룹 참여</li>
					<li>신수진</li>
					<li>여자</li>
					<li>00</li>
					<li>000cm</li>
					<li>00kg</li>
					<li>00</li>
					<li><button>수락</button></li>
					<li><button>거절</button></li>
				</ul>
				
				<c:if test="${vo.user_id == logId}">
					<div class="edit_del_btn_wrap">
						<button id="editBtn" onclick="location='/board/ptEdit?board_num=${vo.board_num}'">수정하기</button>
						<button id="delBtn" onclick="location='javascript:del()'">삭제하기</button>
					</div>
				</c:if>
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
				<h4>그룹 멤버 (2명)</h4>
				<div class="group_member_wrap">
					<div class="member_img_wrap"><img src="${url}/img/pt_recu.jpeg"></div>
					<div class="member_name_wrap">김헬짱 (id)</div>
				</div>
				<div class="group_member_wrap">
					<div class="member_img_wrap"><img src="${url}/img/pt_recu.jpeg"></div>
					<div class="member_name_wrap">김헬짱 (id)</div>
				</div>
				
			</div>
		
			<button>참여하기</button>
		</div>
	
	
	</div>


</div>