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
#recipe_banner{
	position:relative;
	width:100%;
	height:800px;
	margin-top:4%;
	margin-bottom:3%;
}
#head1{
	position:absolute;
	top:40%;
	left:36%;
	height:50px;
	line-height:50px;
	text-align: center;
	color:white;
}

#video{
	width:100%;
	height:100%;
}

/*추천 레시피 리스트*/
#recipe_list{
	position:absolute;
	top:80%;
	left:3%;
	background-color: pink;
	text-align: center;
	margin-left:
}
.recipe_item{
	display:inline-block;
	position:relative;
	width:20%;
	height:340px;
	float:left;
	margin-left:2%;
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
	background-color: rgba(255,255,255,0.7);
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
.recipe_item:hover .recipe_info{
	opacity:1;
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
		height:1400px;
	}
	.recipeList{
		top:70%;
	}
	.recipeList>li>img{
		width:400px;
		height:400px;
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
	<!-- 배너-->
	<div id="recipe_banner">
		<video muted autoplay loop id="video">
	    	<source src="/recipeImg/video.mp4" type="video/mp4">
	  	</video>
	  	<h1 id="head1">오늘의 추천 레시피를 확인하세요!</h1>
	</div>
	
	<!-- 레시피 목록 -->
	<ul id="recipe_list">
		<c:if test="${not empty vo}">
			<c:forEach var="vo" items="${vo}">
				<li class="recipe_item">
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
				</li>
			</c:forEach>
		</c:if>
	</ul>
</div>