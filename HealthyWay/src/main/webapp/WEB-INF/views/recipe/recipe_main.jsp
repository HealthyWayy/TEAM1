<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*a태그 설정*/
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

body{
	font-family: "NanumBarunGothic";
}
/*메인 배너*/
#recipe_banner{
	position:relative;
	width:100%;
	height:250px;
	margin-top:4%;
	margin-bottom:3%;
}
#bannerImg{
	position:absolute;
	width:90%;
	height:90%;
	margin-left:5%;
	margin-right:5%;
}
#headText{
	position:absolute;
	top:27%;
	width:100%;
	heihgt:50px;
	text-align: center;
	line-height:50px;
	font-size:30pt;
}
#recipe_banner>a>p{
	position:absolute;
	top:54%;
	width:100%;
	text-align: center;
	font-size:11pt;
}
/*추천 레시피 리스트*/
#recipe_list{
	margin:0 auto;
	margin-bottom:50px;
	width:90%;
	overflow:auto;
}
.recipe_div{
	position:relative;
	width:23%;
	height:340px;
	float:left;
	border-radius:15px;
	margin-left:1.6%;
}
.recipe_img{
	position:relative;
	width:100%;
	height:99%;
	float:left;
	border-radius:15px;
}
.recipe_info{
	position: absolute;
	left:0;
	top:0;
	width:100%;
	height:100%;
	border-radius:15px;
	background-color: white;
	opacity: 0;
	cursor : pointer;
}

.title, .kcal{
	font-size:20px;
	text-align: center;
	width:100%;
}
.title{
	position: absolute;
	top:35%;
}
.kcal{
	position:absolute;
	top:45%;
}
.recipe_div:hover .recipe_info{
	opacity:0.75;
	transition:0.4s;
}
.heart1, .heart2{
	position:absolute;
	left:87%;
	top:2%;
	width:10%;
}
.heart2{
	display:none;
}

@media ( min-width: 1800px ) {
	#recipe_banner{
		height:400px;
	}
	#headText{
		top:30%;
		font-size:35pt;
	}
	#recipe_banner>a>p{
		top:53%;
		font-size:13pt;
	}
	.recipe_div{
		height:580px;
	}
}
</style>
<script>
$(function(){
	$("#recipe_banner").mouseover(function(){
		$("#headText").css("color","rgb(252,199,71)").css("transition","300ms");
	});
	
	$("#recipe_banner").mouseout(function(){
		$("#headText").css("color","black");
	});
	
	$(document).ready(function(){
		setHeart();
	});
	
	$(".heart1").click(function(){
		var num = $(this).attr("id").substring(2);
		insertHeart(num);
		return false;
	});
	
	$(".heart2").click(function(){
		var num = $(this).attr("id").substring(2);
		deleteHeart(num);
		return false;
	});
});

function setHeart(){
	$.ajax({
		url: "/recipe/selectHeart",
		type: "post",
		success: function(result){
			if(result.length>0){
				$(result).each(function(){
					var boardNum = this.board_num;
					$("#e_"+boardNum).css("display", "none");
					$("#e-"+boardNum).css("display", "none");
					$("#f_"+boardNum).css("display", "block");
					$("#f-"+boardNum).css("display", "block");
				});
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

function insertHeart(boardNum){
	
	$.ajax({
		url: "/recipe/insertHeart",
		type: "post",
		data: "board_num="+boardNum,
		success: function(result){
			$("#e_"+boardNum).css("display", "none");
			$("#e-"+boardNum).css("display", "none");
			$("#f_"+boardNum).css("display", "block");
			$("#f-"+boardNum).css("display", "block");
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
	
	return false;
}
function deleteHeart(boardNum){
	
	$.ajax({
		url: "/recipe/deleteHeart",
		type: "post",
		data: "board_num="+boardNum,
		success: function(result){
			$("#e_"+boardNum).css("display", "block");
			$("#e-"+boardNum).css("display", "block");
			$("#f_"+boardNum).css("display", "none");
			$("#f-"+boardNum).css("display", "none");
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
	
	return false;
}


</script>
<div>
	<!-- 배너 이미지 -->
	<div id="recipe_banner">
		<a href="/recipe/list">
			<img src="/recipeImg/banner2.jpg" id="bannerImg"/>
			<h1 id="headText">MORE RECIPES</h1>
			<p>더 많은 레시피를 확인하세요!</p>
		</a>
	</div>
	
	<!-- 레시피 목록 -->
	<div id="recipe_list">
		<c:if test="${not empty vo}">
			<c:forEach var="vo" items="${vo}">
				<div class="recipe_div">
					<img src="/recipeImg/upload/${vo.recipe_img_file}" class="recipe_img"/>
					<c:if test="${logId!=null}">
						<img src="/recipeImg/heart1.png" class="heart1" id="e_${vo.board_num}"/>
						<img src="/recipeImg/heart2.png" class="heart2" id="f_${vo.board_num}"/>
					</c:if>
					<div class="recipe_info" onclick="javascript:location='/recipe/view?board_num=${vo.board_num}';">
					<c:if test="${logId!=null}">
						<img src="/recipeImg/heart1.png" class="heart1" id="e-${vo.board_num}"/>
						<img src="/recipeImg/heart2.png" class="heart2" id="f-${vo.board_num}"/>
					</c:if>
						<p class="title">${vo.title}</p>
						<p class="kcal">${vo.total_kcal}kcal</p>
		            </div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>