<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#recipe_banner{
	position:relative;
	width:100%;
	height:300px;
	margin-top:50px;
	margin-bottom:50px;
}
#recipe_banner>img{
	position:absolute;
	width:100%;
	height:100%;
}
#recipe_banner>h1{
	position:absolute;
	top:100px;
	width:100%;
	heihgt:50px;
	text-align: center;
	line-height:50px;
	font-size:30pt;
	background-color: white;
}
#recipe_list{
	margin:0 auto;
	padding-left:50px;
	margin-bottom:50px;
	width:1200px;
	overflow:auto;
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
.recipe_info>p{
	font-size:20px;
	text-align: center;
}
.recipe_img:hover .recipe_info{
	display:block;
	transition:500ms;
}
.heart1, .heart2{
	position:absolute;
	left:220px;
	top:6px;
	width:25px;
}

</style>
<script>
$(function(){

});

</script>
<div>
	<!-- 배너 이미지 -->
	<div id="recipe_banner">
		<img src="/img/recipe_banner.jpg"/>
		<h1>More Recipes</h1>
	</div>
	<!-- 레시피 목록 -->
	<div id="recipe_list">
		<div class="recipe_img">
			<img src="/img/recipe_banner.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/img/heart2.png" class="heart2"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/img/heart2.png" class="heart2"/></a>
				<br/><br/><br/><br/>
				<p>식단명</p>
				<p>0kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/img/recipe_banner.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
			<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>식단명</p>
				<p>kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/img/recipe_banner.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>식단명</p>
				<p>kcal</p>
            </div>
		</div>
		<div class="recipe_img">
			<img src="/img/recipe_banner.jpg" class="recipe_img"/>
			<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
			<div class="recipe_info" onclick="javascript:void(0);">
				<a href="javascript:void(0);"><img src="/img/heart1.png" class="heart1"/></a>
				<br/><br/><br/><br/>
				<p>식단명</p>
				<p>kcal</p>
            </div>
		</div>
	</div>
</div>
