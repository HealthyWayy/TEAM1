<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptWrite.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="//cdn.ckeditor.com/4.18.0/basic/ckeditor.js"></script>
<script src="${url}/js/board/pt/ptWrite.js"></script>

<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#ptEidtFrm").submit(function(){
			event.preventDefault();
			
			// 유효성 검사
			if($("#title").val() == ''){
				alert("제목을 입력해주세요.");
				return false;
			}
			
			if($("#keyword").val() == ''){
				alert("키워드를 입력해주세요.");
				return false;
			}
			
			if($("#start_date").val() == ''){
				alert("시작일을 선택해주세요.");
				return false;
			}
			
			if($("#end_date").val() == ''){
				alert("종료일을 선택해주세요.");
				return false;
			}
			
			if($("#file").val() == ''){
				alert("대표사진을 추가해주세요.");
				return false;
			}
			
			if(CKEDITOR.instances['content'].getData() == ''){
				alert("내용을 입력해주세요.");
				return false;
			}

			/* var file = $("#file").val();
			var idx = file.lastIndexOf("\\")+1;
			var img = $("#imgFile").val(file.substring(idx));
			$("#imgFile").val(file.substring(idx));
			
			var value = CKEDITOR.instances['content'].getData()
			$("#content").text(value); */
			
			var params = new FormData($("#ptEditFrm")[0]);
			
			$.ajax({
				url: '/board/ptEditOk',
				data: params,
				method: 'post',
				processData: false,
				contentType: false,
				success: function(result){
					if(result > 0){
						alert("수정이 완료되었습니다.");
						location = "/board/ptList";
					}
				},
				error: function(e){
					alert('PT그룹 수정에 실패했습니다.');
					location = history.back();
				}
			});
			
		});
		
		
	});
</script>

<!-- 임시로 해둔 탑입니다 -->
<div class="top"></div>
<div class="main_wrap">
	<h1>PT그룹 개설하기</h1>
	<form action="${url}/board/ptEditOk" method="post" id="ptEditFrm">
		<input type="hidden" value="${vo.board_num}" name="board_num">
		<ul class="write_frm_wrap">
			<li id="title_li">
				<h3>제목</h3>
				<input type="text" name="title" id="title" value="${vo.title}">
			</li>
			<li id="keyword_li">
				<h3>키워드</h3>
				<input type="text" name="keyword" placeholder="예시) #스쿼트 #2주챌린지" id="keyword" value="${vo.keyword}">
			</li>
			<li id="img_file_li">
				<h3>대표 사진</h3>
				<input type="file" name="file" value="${vo.pt_img_file}" id="file">
				<input type="hidden" name="pt_img_file" value="${vo.pt_img_file}" id="imgFile"/>
			</li>
			<li id="start_date_li">
				<h3>시작일</h3>
				<input type="date" name="start_date" id="start_date" value="${vo.start_date}">
			</li>
			<li id="end_date_li">
				<h3>종료일</h3>
				<input type="date" name="end_date" id="end_date" value="${vo.end_date}">
			</li>
			<li id="max_user_li">
				<h3>모집 인원</h3>
				<select name="max_user" id="max_user">
					<c:forEach var="i" begin="1" end="10">
						<option <c:if test="${vo.max_user == i}">selected</c:if>><c:out value="${i}"/></option>
					</c:forEach>
				</select>
			</li>
			<li id="content_li">
				<h3>모집 내용</h3>
				<textarea name="content" id="content">${vo.content}</textarea>
			</li>
			
		</ul>
		
		<div class="submit_btn_wrap">
			<input type="submit" value="수정하기" id="EditOk_btn">
		</div>
	</form>

</div>
