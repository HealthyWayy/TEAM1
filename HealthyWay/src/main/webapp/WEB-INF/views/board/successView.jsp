<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function dataDelCheck(){
		
	}
</script>
<div class="container">
	<h1>성공스토리 보기</h1>
	<ul>
		<li>번호 : ${boardVO.board_num}</li>
		<li>글쓴이 : ${boardVO.user_id}</li>
		<li>등록일 : ${boardVO.write_date}</li>
		<li>제목 : ${boardVO.title}</li>
		<li>글 내용</li>
		<li>${dataVO.content}</li>
		<li>
			첨부파일 : <a href="/myapp/upload/${dataVO.filename1}" download>${boardVO.filename1}</a>
			<c:if test="${dataVO.filename2!=null && dataVO.filename2!='' }">
				, <a href="/myapp/upload/${dataVO.filename2}" download>${boardVO.filename2}</a>
			</c:if>
		</li>
	</ul>
	<c:if test="${dataVO.userid==logId}">
		<a href="/board/successEdit?board_num=${boardVO.board_num}">수정</a>
		<a href="javascript:dataDelCheck()">삭제</a>
	</c:if>
</div>