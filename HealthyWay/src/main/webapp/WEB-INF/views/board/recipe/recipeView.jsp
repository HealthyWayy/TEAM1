<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
body{
	background-image:url('/recipeImg/recipe.jpg');
	background-repeat : no-repeat;
    background-size : cover;
}
textarea:focus{
	outline:none;
}
#viewRecipe{
	margin:5%;
	padding:4%;
	overflow:auto;
	border-radius:20px;
	border:1px solid #ddd;
	background-color: white;
	opacity: 0.9;
	font-size:16px;
}

#imgDiv{
	width:37%;
	height:560px;
	float: left;
}
#recipe_img{
	width:100%;
	height:100%;
	object-fit: cover;
}
/*오른쪽 div(레시피 정보)-------------------------------------------*/
#recipeInfo{
	width:57%;
	height:80%;
	float:right;
	margin-left:6%;
}
#title{
	text-align: center;
	font-size:1.5em;
	margin-bottom:3%;
}
#recipeInfo>p{
	width:100%;
	font-weight: bold;
}
#totalKcal{
	padding-left:1%;
	padding-right:1%;
	margin-right:0.5%;
	height:25px;
	line-height:25px;
	float:right;
	background-color: #474747;
	color:white;
	border-radius:5px;
	font-size:11pt;
}
#content{
	padding:2%;
	width:100%;
	height:200px;
	overflow:auto;
	border-radius:10px;
	border:1px solid rgb(200,200,200);
	resize: none;
	margin:0 auto;
}
/*재료 리스트*/
#ingredList{
	overflow:auto;
	width:100%;
	margin-bottom:30px;
	max-height:250px;
}
#ingredList>li{
	display:inline-block;
	font-size: 11pt;
	padding-left:8px;
	padding-right:8px;
	margin-right:5px;
	margin-bottom:6px;
	border-radius:10px;
	border:1px solid rgb(200,200,200);
}

/*신고, 댓글, 하트*/
#subDiv{
	width:100%;
	vertical-align: bottom;
}
.warnIcon{
	float:left;
	color:black;
	cursor: pointer;
}
.warnIcon>img{
	width:7%;
}
.warnIcon>span{
	font-size:0.9em;
	vertical-align: bottom;
}
.heart1, .heart2{
	float:right;
	width:4%;
}
.commentIcon{	/*댓글*/
	float:right;
	margin-right:10px;
	width:3.5%;
	cursor: pointer;
}
/*댓글창*/
#commentDiv{
	position:fixed;
	top:100px;
	left:0px;
	float:right;
	width:600px;
	height:600px;
	overflow:auto;
	background-color: pink;
	display:none;
}
</style>

<script>
$(function(){
	$(".commentIcon").click(function(){
		$("#commentDiv").fadeToggle("100ms");
	});
});
</script>

<div>
	<div id="viewRecipe">
		<a href="/recipe/list"><p>레시피 목록</p></a>
		<div id="imgDiv">
			<!-- 이미지 -->
			<img src="/recipeImg/upload/${vo[0].recipe_img_file}" id="recipe_img"/>
		</div>
		<div id="recipeInfo">
			<!-- title -->
			<p id="title">${vo[0].title}</p>
	
			<!-- 재료 리스트 -->
			<p>재료</p>
			<ul id="ingredList">
				<c:forEach var="list" items="${gredList}">
					<li>${list.gred_name}&nbsp;${list.gred_gram}g</li>
				</c:forEach>
			</ul>
			
			<!-- 레시피 설명 -->
			<p>레시피 설명 <span id="totalKcal">Total: ${vo[0].total_kcal}kcal</span></p>
			<textarea readonly name="content" id="content">${vo[0].content}</textarea>
			
			<!-- 부가 기능 -->
			<div id="subDiv">
				<a class="warnIcon"><img src="/recipeImg/warnIcon.png"/><span>신고하기</span></a>
				<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
				<img src="/recipeImg/commentIcon.png" class="commentIcon"/>
			<!-- <a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a> -->
			</div>
		</div>
	</div>
	<div id="commentDiv">
		댓글창
	</div>
</div>