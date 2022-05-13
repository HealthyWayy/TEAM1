<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*a태그 설정*/
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

ul,li{
	margin:0;
	padding:0;
	list-style: none;
}
#topImg{
	position:relative;
	width:100%;
	height:260px;
	margin-bottom:50px;
}
#topImg>img{
	position:absolute;
	width:90%;
	height:100%;
	margin-left:5%;
}
#topImg>h1{
	position:absolute;
	top:75px;
	width:100%;
	heihgt:50px;
	text-align: center;
	line-height:50px;
	font-size:30pt;
}
#topImg>p{
	position:absolute;
	top:140px;
	width:100%;
	text-align: center;
	font-size:11pt;
}

/*검색폼*/
#searchFrm{
	float:left;
	margin:0;
	margin-right:10px;
}
#searchFrm>input[type=text]{
	width:210px;
	height:27px;
	border-radius:10px;
	border:1px solid rgb(200,200,200);
}
#searchFrm>input[type=text]:focus{
	outline-color: #FF5454;
}
#searchFrm>input[type=submit]{
	width:50px;
	height:27px;
	border:none;
	border-radius:30px;
	background-color: #FF5454;
	color:white;
	cursor : pointer;
}
/*글쓰기 버튼*/
#writeBtn{
	float:right;
	width:75px;
	height:27px;
	border-radius: 30px;
	border:none;
	background-color: #FF5454;
	color:white;
	cursor : pointer;
	
}
/*레시피 글 목록*/
#recipe_list{
	margin:0 auto;
	margin-bottom:50px;
	width:1160px;
	overflow:auto;
}
/*레시피 목록*/
.recipe_div{
	position:relative;
	width:260px;
	height:275px;
	float:left;
	margin-right:30px;
	border-radius:15px;
}
/*수정,삭제*/
#editDelete{
	position:absolute;
	bottom:-12px;
	left:190px;
}
#editDelete>a{
	font-size:11pt;
}
#editDelete>a:hover{
	font-weight:bold;
	color:gray;
}
#top{
	overflow: auto;
	width:1130px;
	margin-bottom:20px;
}
.recipe_img{
	width:100%;
	height:95%;
	border-radius:15px;
}
.recipe_div>p{
	margin:0;
	text-align:center;
}
.heart1, .heart2{
	position:absolute;
	left:223px;
	top:7px;
	width:28px;
}
/*페이징*/
.paging{
	text-align: center;
}
.paging>a>li{
	display:inline-block;
	width:25px;
	height:25px;
	line-height:24px;
	text-align:center;
	font-size:10pt;
	margin-right:5px;
	border-radius:10px;
	background-color: rgb(235,235,235);
}
.active_list{
	color:white;
	background-color:#FF5454 !important;
}
/*rgb(226,224,250):보라색*/
</style>

<script>
function deleteRecipe(boardNum){
	if(confirm("레시피를 삭제하시겠습니까?")==false){
		return false;
	}
	
	$.ajax({
		url: "/recipe/delete",
		data : "board_num="+boardNum,
		type: "post",
		success: function(result){
			if(result>0){
				alert("레시피가 삭제되었습니다.");
				location="/recipe/list";
			}
		},
		error: function(e){
			console.log(e.responseText);
			alert("레시피 삭제 실패하였습니다.");
		}
	});
}
</script>
<!-- <a href='https://kr.freepik.com/psd/banner'>Banner psd는 freepik - kr.freepik.com가 제작함</a>-->
<div style="margin-top:50px; margin-bottom:30px;">
	<div id="topImg">
		<img src="/recipeImg/banner.jpg"/>
		<h1>SHARE YOUR RECIPES</h1>
		<p>당신의 레시피를 공유하세요</p>
	</div>
	
	<!-- 글 목록 -->
	<div id="recipe_list">
		<!-- 등록/검색 -->
		<div id="top">
			<a href="/recipe/write"><button id="writeBtn">글쓰기</button></a>
			<form id="searchFrm">
				<input type="text"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
		<c:forEach var="vo" items="${vo}">
			<div class="recipe_div" style="margin-bottom:30px;">
				<a href="/recipe/view?board_num=${vo.board_num}"><img src="/recipeImg/upload/${vo.recipe_img_file}" class="recipe_img"/></a>
				<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
				<c:if test="${logId==vo.user_id}">
					<div id="editDelete">
						<a href="/recipe/edit?board_num=${vo.board_num}">수정</a>/<a href="javascript:deleteRecipe(${vo.board_num});">삭제</a>
					</div>
				</c:if>
				<p>${vo.title}</p>
			</div>
		</c:forEach>
		
		<!-- <a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a> -->
		
	</div>
	
	<!-- 페이징 -->
	<ul class="paging">
		<!-- prev -->
		<c:if test="${pVO.pageNum==1}">
			<a href="javascript:alert('이전 페이지가 존재하지 않습니다');"><li>◀</li></a>
		</c:if>
		<c:if test="${pVO.pageNum>1}">
    		<a href="/recipe/list?pageNum=${pVO.pageNum-1}
    			<c:if test='${pVO.searchValue!=null}'>
    				&searchKey=${pVO.searchKey}&searchValue=${pVO.searchValue}
    			</c:if>
    		"><li>◀</li></a>
    	</c:if>
    	
    	<!-- page -->
    	<c:forEach var="i" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
	    	<c:if test="${i<=pVO.totalPage}">
	    		<a href="/recipe/list?pageNum=${i}
	    			<c:if test='${pVO.searchValue!=null}'>
		    			&searchKey=${pVO.searchKey}
		    			&searchValue=${pVO.searchValue}
		    		</c:if>
		    	">
	    		<c:if test="${i==pVO.pageNum}">
	    			<li class="active_list">
	    		</c:if>
	    		<c:if test="${i!=pVO.pageNum}">
	    			<li>
	    		</c:if>
	    		${i}</li></a>
	    	</c:if>
    	</c:forEach>
    	
    	<!-- next -->
    	<c:if test="${pVO.pageNum==pVO.totalPage}">
    		<a href="javascript:alert('다음 페이지가 존재하지 않습니다');"><li>▶</li></a>
    	</c:if>
    	<c:if test="${pVO.pageNum<pVO.totalPage}">
    		<a href="/recipe/list?pageNum=${pVO.pageNum+1}
    		<c:if test='${pVO.searchValue!=null}'>
		  		&searchKey=${pVO.searchKey}
		    	&searchValue=${pVO.searchValue}
		    </c:if>
		    "><li>▶</li></a>
    	</c:if>
	</ul>
</div>