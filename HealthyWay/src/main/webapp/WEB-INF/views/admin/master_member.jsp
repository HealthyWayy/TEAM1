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
#container{
	margin:4%;
	padding-top:1%;
	padding-left:4%;
	padding-right:4%;
}
#searchFrm{
	overflow:auto;
	width:30%;
	float:right;
}
#searchFrm>input[type=text]{
	width:74%;
	height:30px;
	padding-left:2%;
	border-radius:10px;
	border:1px solid rgb(200,200,200);
}
#searchFrm>input[type=text]:focus{
	outline-color: #FF5454;
}
#searchFrm>input[type=submit]{
	width:25%;
	height:30px;
	border-radius: 30px;
	border:none;
	background-color: #FF5454;
	color:white;
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
.table{
	text-align: center;
}
#deletBtn{
	width:90%;
	height:30px;
	border-radius: 30px;
	border:none;
	background-color: #FF5454;
	color:white;
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
	height:100%;
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
		padding-left:6%;
		padding-right:6%;
	}
	#searchFrm{
		width:20%;
		margin-right:1%;
	}
}
</style>

<script>
	$(function(){
		//회원관리 메뉴 클릭 이벤트
		$("#menu_member").click(function(){
			$(this).attr("class", "menu_active");
			$("#menu_report").attr("class","");
			$("#manageDiv").css("display","block");
			$("#reportDiv").css("display","none");
		});
		
		//신고관리 메뉴 클릭 이벤트
		$("#menu_report").click(function(){
			$(this).attr("class", "menu_active");
			$("#menu_member").attr("class","");
			$("#reportDiv").css("display","block");
			$("#manageDiv").css("display","none");
		});
	});
	
	//회원 삭제
	function deleteMember(user_id){
		
		if(!confirm("회원을 삭제하시겠습니까?")){
			return false;
		}
		
		$.ajax({
			url: '/master/member/delete',
			data: 'user_id='+user_id,
			type: 'post',
			success: function(result){
				if(result>0){
					alert("회원이 삭제되었습니다.");
				}
				location.reload();
			},
			error: function(e){
				console.log(e.responseText);
				alert("회원 삭제 실패하였습니다.");
			}
		});
	}
</script>

<div id="container">

	<!-- 메뉴 -->
	<ul class="menu_list">
		<li id="menu_member" class="menu_active">회원관리</li>
		<li id="menu_report">신고관리</li>
	</ul>
	<form method="get" action="/master/member" id="searchFrm">
		<input type="text" name="searchWord"/>
		<input type="submit" value="검색"/>
	</form>
	<!-- 회원 관리 -->
	<div id="manageDiv">
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
						<td><button id="deletBtn" onclick="deleteMember('${vo.user_id}');">탈퇴</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		 <!-- 페이징 -->
	    <ul class="paging">
	    	<!-- prev -->
	    	<c:if test="${pVO.pageNum==1}">
	    		<li>◀</li>
	    	</c:if>
	    	<c:if test="${pVO.pageNum>1}">
	    		<li><a href="/master/member?pageNum=${pVO.pageNum-1}
	    		<c:if test='${pVO.searchWord!=null}'>
	    			&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
	    		</c:if>">◀</a></li>
	    	</c:if>
	    	
	    	<!-- pageNum -->
	    	<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
	    		<c:if test="${p<=pVO.totalPage}">
	    			<c:if test="${p==pVO.pageNum}">
	    				<li class="active">
	    			</c:if>
	    			<c:if test="${p!=pVO.pageNum}">
	    				<li>
	    			</c:if>
	    			<a href="/master/member?pageNum=${p}
		    			<c:if test='${pVO.searchWord!=null}'>
		    				&searchKey=${pVO.searchKey}
		    				&searchWord=${pVO.searchWord}
		    			</c:if>
	    			">${p}</a></li>
	    		</c:if>
	    	</c:forEach>
	    	
	    	<!-- next -->
	    	<c:if test="${pVO.pageNum==pVO.totalPage}">
	    		<li>▶</li>
	    	</c:if>
	    	<c:if test="${pVO.pageNum<pVO.totalPage}">
	    		<li><a href="/master/member?pageNum=${pVO.pageNum+1}
	    			<c:if test='${pVO.searchWord!=null}'>
	    				&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
	    			</c:if>">▶</a></li>
	    	</c:if>
	    </ul>
    </div>
    
    <!-- 회원 신고 -->
    <div id="reportDiv">
    	회원 신고 div
    </div>
</div>