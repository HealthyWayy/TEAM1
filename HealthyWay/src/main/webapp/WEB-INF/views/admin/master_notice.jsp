<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
/*a태그 설정*/
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

body {
	font-family: "NanumBarunGothic";
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#container{
	margin:4%;
	padding-top:1%;
	padding-left:4%;
	padding-right:4%;
}
.menu_list {
	text-align: right;
}
.menu_list>li {
    float: left;
    width: 24.77%;
    text-align: center;
    height: 50px;
    line-height: 50px;
    border: 1px solid #E4E5E5;
    border-bottom: 1px solid gray;
    border-left: none;
    background-color: #FCFCFC;
    cursor: pointer;
    color: gray;
}

.menu_active {
	border: 1px solid gray !important;
	border-bottom: none !important;
	background-color: #fff !important;
	color: #000 !important;
}
#deleteReport{
	width:75px;
	height:30px;
	border-radius: 30px;
	border: 1px solid rgb(200,191,231);
	background-color:white;
}
.paging{
	text-align: center;
	margin:0 auto;
	margin-top:3%;
	width:85%;
	height:27px;
}
.paging>li{
	display:inline-block;
	width:2%;
	height:27px;
	line-height:30px;
	text-align:center;
	font-size:16px;
	margin-right:0.1%;
	border-radius:10px;
	background-color: rgb(235,235,235);
}
.active, .active>a{
	color:white;
	background-color:#FF5454 !important;
}

/*회원 신고 div*/
#reportDiv{
	width:100%;
	height:100%;
	overflow:auto;
	background-color: pink;
	display: none;
}
@media ( min-width: 1800px ) {
	#container{
		padding-left:7%;
		padding-right:7%;
	}
	#searchFrm{
		width:20%;
		margin-right:1%;
	}
}
</style>

<script>	
$(function(){
	//커뮤니티 관리 메뉴 클릭 이벤트
	$("#menu_community").click(function(){
		location="/master/community";
	});
		
	//공지사항 메뉴 클릭 이벤트
	$("#menu_notice").click(function(){
		location="/master/notice";
	});
});
	//글 삭제
	function deleteBoard(board_num){
		event.stopPropagation();//tr onclick 중복 제거
		
		if(!confirm("게시글을 삭제하시겠습니까?")){
			return false;
		}
		
		$.ajax({
			url: '/master/boardDelete',
			data: 'board_num='+board_num,
			type: 'post',
			success: function(result){
				if(result>0){
					alert("게시글이 삭제되었습니다.");
				}
				location.reload();
			},
			error: function(e){
				console.log(e.responseText);
				alert("게시글 삭제 실패하였습니다.");
			}
		});
		
	}
</script>

<div id="container">

	<!-- 메뉴 -->
	<ul class="menu_list">
		<li id="menu_community">커뮤니티 관리</li>
		<li id="menu_notice" class="menu_active">공지사항</li>
	</ul>
	
</div>