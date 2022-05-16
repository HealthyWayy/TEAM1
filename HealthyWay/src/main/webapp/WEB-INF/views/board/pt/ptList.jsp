<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptList.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,300,0,200" />
<script src="${url}/js/board/pt/ptList.js"></script>

<div class="top"></div>

<div class="wrap">
	<div class="pt_top_btn_wrap">
		<div class="top_left_wrap">
			<button id="recu_btn">모집중</button>
			<button id="completed_btn">모집완료</button>
		</div>
		<div class="top_right_wrap">
			<!-- 검색 -->
			<form method="get" action="${url}/board/ptList" id="searchFrm">
				<div class="search_box">
					<input type="text" placeholder="Search" name="searchWord" id="searchWord">
					<button id="searchBtn"><span class="material-symbols-outlined">search</span></button>
				</div>
			</form>
			<!-- 글쓰기 -->
			<c:if test="${logStatus == 'Y'}"><button id="write_btn" onclick="location.href='${url}/board/ptWrite'">글쓰기</button></c:if>
		</div>
	</div>
	<div class="head_img">
		<img src="${url}/img/pt_head.png">
	</div>	
	
	<div class="main_wrap">
 		<%-- <h2>새로운 PT그룹</h2>
		
		<div class="pt_list_wrap">
			<c:forEach var="vo" items="${ptList}">
				<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
					<li class="main_img_wrap"><img src="/ptImg/${vo.pt_img_file}"></li>
					<li>${vo.keyword}</li>
					<li>${vo.title}</li>
					<li>조회수 ${vo.hit}</li>
					<li>${vo.write_date }</li>
					<li>모집 중&nbsp;&nbsp;0 / ${vo.max_user}</li>
					<li><span class="material-symbols-rounded">favorite</span></li>
					<li style="display: none;">${vo.board_num}</li>
				</ul>
			</c:forEach>
		</div>  --%>
		
		<h2 class="post_head">모집중인 PT그룹</h2>	
		<div class="pt_list_wrap">
			<c:forEach var="vo" items="${ptList}">
				<ul class="pt_post_wrap ${vo.state}" onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">
					<li class="main_img_wrap"><img src="/ptImg/${vo.pt_img_file}"></li>
					<li>${vo.keyword}</li>
					<li>${vo.title}</li>
					<li>조회수 ${vo.hit}</li>
					<li>${vo.write_date}</li>
					<li>${vo.state}&nbsp;&nbsp;${vo.pNum} / ${vo.max_user}</li>
					<li><span class="material-symbols-rounded">favorite</span></li>
					<li style="display: none;">${vo.board_num}</li>
				</ul>
			</c:forEach>
		</div>
	
		<!-- 페이징 -->

		<ul class="paging">
			<!-- 이전페이지 -->
			<c:if test="${pVO.pageNum == 1}">
				<li style="color: lightgray"><</li>
			</c:if>
			<c:if test="${pVO.pageNum > 1}">
				<li><a href="${url}/board/ptList?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchWord!=null}'>&searchWord=${pVO.searchWord}</c:if>"><</a></li>
			</c:if>
			
			<!-- 페이지번호 -->
			<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount-1}">
				<c:if test="${p<=pVO.totalPage}">
					<c:if test="${p==pVO.pageNum}">
						<li style="background-color: #f1f1f1; border-radius: 50%; font-weight: bold;">
					</c:if>
					<c:if test="${p != pVO.pageNum}">
						<li>
					</c:if>
					<a href="${url}/board/ptList?pageNum=${p}<c:if test='${pVO.searchWord!=null}'>&searchWord=${pVO.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음페이지 -->
			<c:if test="${pVO.pageNum != pVO.totalPage}">
				<li><a href="${url}/board/ptList?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchWord!=null}'>&searchWord=${pVO.searchWord}</c:if>">></a></li>
			</c:if>
			<c:if test="${pVO.pageNum == pVO.totalPage}">
				<li style="color: lightgray">></li>
			</c:if>
		</ul>

	</div>
</div>