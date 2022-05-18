<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
#main{
	margin:4%;
	padding-top:2%;
}
.menu_list {
	text-align: right;
}

.menu_list li {
	display:inline-block;
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

.menu_list li:nth-child(1) {
	border: 1px solid gray;
	border-bottom: none;
	background-color: #fff;
	color: #000;
}

.table{
	text-align: center;
}
</style>

<script>
	
</script>

<div id="main">

	<ul class="menu_list">
		<li id="menu_member">회원관리</li>
		<li id="menu_report">신고관리</li>
	</ul>

	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Passward</th>
				<th>Name</th>
				<th>Nickname</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Email</th>
				<th>Tel</th>				
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vo}">
				<tr>
					<td>${vo.user_id}</td>
					<td>${vo.user_pw}</td>
					<td>${vo.user_name}</td>
					<td>${vo.user_nickname}</td>
					<td>${vo.gender}</td>
					<td>${vo.age}</td>
					<td>${vo.user_email}</td>
					<td>${vo.tel }</td>
					<td>탈퇴</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>