
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptList.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="${url}/js/board/successList.js"></script>


<div class="wrap">



	<div class="main_wrap">
	
		<div class="pt_top_btn_wrap">
			<div class="top_left_wrap">
				
				
			</div>
			<div class="top_right_wrap">
				<!-- 검색 -->
				<form method="get" action="${url}/board/ptList" id="searchFrm">
					<div class="search_box">
						<input type="text" placeholder="Search" name="searchWord"
							id="searchWord">
						<button id="searchBtn">
							<span class="material-symbols-outlined">search</span>
						</button>
					</div>
				</form>
				<!-- 글쓰기 -->
				<c:if test="${logStatus == 'Y'}">
					<button id="write_btn"
						onclick="location.href='${url}/successWrite'">등록하기</button>
				</c:if>
			</div>
		</div>


		<div class="pt_list_wrap">
			<c:forEach var="vo" items="${ptList}">
				<ul class="pt_post_wrap">
					<li class="main_img_wrap"
						onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'"><img
						src="/successImg/${vo.img_file}"></li>
					<li	onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">${vo.keyword}</li>
					<li onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">${vo.title}</li>
					<li	onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">조회수 ${vo.hit}</li>
					<li	onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">${vo.write_date}</li>
					<li class="post_bottom" onclick="location.href='${url}/board/ptView?board_num=${vo.board_num}'">${vo.state}&nbsp;&nbsp;${vo.pNum} / ${vo.max_user}</li>
					<li class="post_bottom"
						<c:if test="${logStatus != 'Y'}">onclick="btn_notlogin();"</c:if>>
						<c:choose>
							<%-- 로그인 상태일 때 --%>
							<c:when test="${logStatus == 'Y'}">
								<span class="material-symbols-rounded line_heart"
									id="u_${vo.board_num}">favorite</span>
								<span class="material-symbols-rounded fill_heart"
									id="f_${vo.board_num}" style="display: none;">favorite</span>
							</c:when>

							<%-- 로그인 상태가 아닐 때, 로그인 alert --%>
							<c:otherwise>
								<span class="material-symbols-rounded line_heart">favorite</span>
							</c:otherwise>

						</c:choose>
					</li>

					<li style="display: none;">${vo.board_num}</li>
				</ul>
			</c:forEach>
		</div>