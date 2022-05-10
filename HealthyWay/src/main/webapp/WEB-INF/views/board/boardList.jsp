<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/*리스트*/
	.boardList{
		overflow:auto;
	}
	.boardList>li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid gray;
	}
	.boardList>li:nth-child(5n+2){
		width:60%;
		white-space:nowrap;/*줄 안 바꿈*/
		overflow:hidden;/*넘친 내용 숨기기*/
		text-overflow:ellipsis;/*넘침시 ...표시*/
	}
	/*페이징*/
	.paging{
		height:30px;
		margin:30px 0;
		overflow:auto;
	}
	.paging>li{
		float:left;
		padding-right:30px;
	}
	#searchFrm{
		padding:20px 200px;
		text-align:center;
	}
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==''){
				alert("검색어를 입력하쇼");
				return false;
			}
		});
	});
</script>
<div class="container">
	<h1>공지사항</h1>
	
	<div>
		총 레코드 수 : ${pVO.totalRecord}, ${pVO.totalPage}/${pVO.pageNum}
	</div>
	<ul class="boardList">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>조회수</li>
		<li>등록일</li>
		<c:forEach var="vo" items="${list}">
			<li>${vo.board_num}</li>
			<li><a href="/myapp/board/boardView?no=${vo.board_num}">${vo.title}</a></li>
			<li>${vo.user_id}</li>
			<li>${vo.hit}</li>
			<li>${vo.writedate}</li>
		</c:forEach>
		
		
	</ul>
	
	<!-- 페이징 -->
	<ul class="paging">
		<!-- 이전 페이지 -->
		<c:if test="${pVO.pageNum==1}">
			<li>prev</li>
		</c:if>
		<c:if test="${pVO.pageNum>1}">
			<li><a href="/myapp/board/boardList?pageNum=${pVO.pageNum-1}
				<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>
				">prev</a></li>
		</c:if>
		
		<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
			<!-- 총 페이지 수 보다 출력할 페이지 번호가 작을 때 -->
			<c:if test="${p<=pVO.totalPage}">
				<c:if test="${p==pVO.pageNum}">
					<li style="background-color:lightblue">
				</c:if>
				<c:if test="${p!=pVO.pageNum}">
					<li>
				</c:if>
				<a href="/myapp/board/boardList?pageNum=${p}
				<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>
				">${p}</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 페이지 -->
		<c:if test="${pVO.pageNum==pVO.totalPage}">
			<li>next</li>
		</c:if>
		<c:if test="${pVO.pageNum<pVO.totalPage}">
			<li><a href="/myapp/board/boardList?pageNum=${pVO.pageNum+1}
			<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>
			">next</a></li>
		</c:if>
	</ul>
	<!-- 검색 -->
	<div>
		<form method="get" action="/myapp/board/boardList" id="searchFrm">
			<select name="searchKey">
				<option value="title">제목</option>
				<option value="content">글내용</option>
				<option value="user_id">글쓴이</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="Search"/>
		</form>
	</div>
</div>