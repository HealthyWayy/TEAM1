<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*a태그 설정*/
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

/*메인 배너*/
#recipe_banner{
	position:relative;
	width:100%;
	height:300px;
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
	top:80px;
	width:100%;
	heihgt:50px;
	text-align: center;
	line-height:50px;
	font-size:30pt;
}
#recipe_banner>a>p{
	position:absolute;
	top:150px;
	width:100%;
	text-align: center;
	font-size:11pt;
}
/*추천 레시피 리스트*/
#recipe_list{
	margin:0 auto;
	padding-left:50px;
	margin-bottom:50px;
	width:1200px;
	overflow:auto;
}
.recipe_div{
	position:relative;
	width:250px;
	height:300px;
	float:left;
	margin-right:50px;
	border-radius:15px;
}
.recipe_img{
	position:relative;
	width:250px;
	height:300px;
	float:left;
	margin-right:50px;
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
	display:none;
	opacity: 0.8;
	cursor : pointer;
}
.title, .kcal{
	font-size:20px;
	text-align: center;
	width:100%;
}
.title{
	position: absolute;
	top:95px;
}
.kcal{
	position:absolute;
	top:130px;
}
.recipe_div:hover .recipe_info{
	display:block;
	transition:500ms;
}
.heart1, .heart2{
	position:absolute;
	left:220px;
	top:8px;
	width:25px;
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
	
	$(".heart2").click(function(){
		console.log("하트 클릭");
		return false;//하트 클릭 후 페이지 이동되지 않도록
	});
	
});

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
		<c:if test="${vo!=null}">
			<c:forEach var="vo" items="${vo}">
				<div class="recipe_div">
					<img src="/recipeImg/upload/${vo.recipe_img_file}" class="recipe_img"/>
					<a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a>
					<div class="recipe_info" onclick="javascript:location='/recipe/view?board_num=${vo.board_num}';">
						<a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a>
						<p class="title">${vo.title}</p>
						<p class="kcal">${vo.total_kcal}kcal</p>
		            </div>
				</div>
			</c:forEach>
		</c:if>
	<!--  
		<div class="recipe_img">
			<img src="/recipeImg/sample.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/recipeImg/heart2.png" class="heart2"/></a>
				<br/><br/><br/><br/>
				<p>연어 샌드위치</p>
				<p>100kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/recipeImg/sample.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
			<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>시금치 파스타</p>
				<p>100kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/recipeImg/sample.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>곤약 냉면</p>
				<p>100kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/recipeImg/sample.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/recipeImg/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>라이스페이퍼 치킨</p>
				<p>100kcal</p>
            </div>
		</div>
	</div>
	-->
</div>
