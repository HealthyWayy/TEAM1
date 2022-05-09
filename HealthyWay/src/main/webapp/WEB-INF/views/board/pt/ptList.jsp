<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/pt/ptList.css" type="text/css" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700;900&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
<script src="${url}/js/board/pt/ptList.js"></script>

<!-- 임시로 해둔 탑입니다 -->
<div class="top"></div>


<div class="wrap">
	<div class="pt_top_btn_wrap">
		<div class="top_left_wrap">
			<button id="recu_btn">모집중</button>
			<button id="completed_btn">모집완료</button>
		</div>
		<div class="top_right_wrap">
			<div class="search_box">
				<input type="text" placeholder="Search">
				<button><span class="material-symbols-outlined">search</span></button>
			</div>
			<button id="write_btn" onclick="location.href='${url}/board/ptWrite'">글쓰기</button>
		</div>
	</div>
	<div class="head_img">
		<img src="${url}/img/pt_head.png">
	</div>	
	
	<div class="main_wrap">
		<h2>새로운 PT그룹</h2>
		
		<div class="pt_list_wrap">
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
		</div>
		
		<h2>모집중인 PT그룹</h2>	
		<div class="pt_list_wrap">
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
			
			<ul class="pt_post_wrap" onclick="location.href='${url}/board/ptView'">
				<li class="main_img_wrap"><img src="${url}/img/pt_recu.jpeg"></li>
				<li>#평일내내 #스쿼트 #런지 #2세트</li>
				<li>평일 8시부터 런지, 스쿼트 파티</li>
				<li>조회수 00</li>
				<li>2022-04-27</li>
				<li>모집 중&nbsp;&nbsp;3 / 8</li>
				<li><span style="color: red;" class="material-symbols-outlined">favorite</span></li>
			</ul>
		</div>
	
		<!-- 페이징 -->

		<ul class="paging">
			<li><</li>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
			<li>></li>
		</ul>

	
	
	
	</div>

</div>