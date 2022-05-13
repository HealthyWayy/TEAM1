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
	position:relative;
	margin:7%;
	padding:4%;
	overflow:auto;
	border-radius:20px;
	border:1px solid #ddd;
	background-color: white;
	opacity: 0.9;
	font-size:11pt;
}
/*게시판 정보*/
#boardInfo{
	border-bottom:1px solid rgb(200,200,200);
	margin-bottom:3%;
	font-size:10pt;
	text-align: left;
}
#info{
	display:inline-block;
	padding-right:7px;
}
#info>li{
	display:inline-block;
	margin-left:7px;
}
#editDelete{
	position: absolute;
	top:16.5%;
	right:5%;
	font-size:10.5pt;
}
#editDelete>li{
	display: inline-block;
}
#editDelete>li:hover{
	text-decoration: underline;
}

/*이미지 div*/
#imgDiv{
	width:37%;
	height:500px;
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
	margin-bottom:2%;
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
	width:9%;
}
.warnIcon>span{
	vertical-align: bottom;
}
.heart1, .heart2{
	float:right;
	width:4%;
	cursor: pointer;
}
.heart2{
	display:none;
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
	top:15.5%;
	left:2%;
	float:right;
	width:40%;
	height:600px;
	overflow:auto;
	background-color: white;
	border-radius: 10px;
	border:1px solid rgb(200,200,200);
	padding-bottom:1%;
	display:none;
}
#commentDiv>p{
	position:relative;
	text-align: center;
	font-size:1.3em;
	margin-top: 3%;
}
#replyClose{
	position:absolute;
	top:0;
	right:3%;
	font-size:18pt;
	cursor: pointer;
}
#replyList{
	width:100%;
	height:75%;
	overflow: auto;
	margin-top:5%;
	padding-left:2%;
	padding-right:1%;
}
#replyList>li{
	width:100%;
	margin:0;
}
#replyList>li{
	padding-top:1%;
	padding-bottom:1%;
	border-bottom:1px solid rgb(200,200,200);
}
#replyList>li>label:nth-child(2){/*날짜*/
	margin-left: 1%;
	font-size:0.8em;
	color: gray;
}
#replyList>li>p{/*내용*/
	margin-bottom:2%;
}
#replyList>li>p>label{/*수정,삭제*/
	float:right;
	margin-right:1.5%;
	font-size:0.9em;
	cursor: pointer;
}
#replyList>li>p>label:hover{
	text-decoration: underline;
}

/*댓글 수정폼*/
.replyEditFrm{
	display:none;
}
.replyEditFrm>input[type="text"]{
	width:80%;
	height:40px;
	border-radius: 10px;
	border:1px solid rgb(200,200,200);
	overflow:auto;
	padding-left:2%;
	margin-right:1%;
}
/*수정, 취소 버튼*/
.replyEditFrm>input[type=reset], .replyEditFrm>input[type=button]{
	width:9%;
	height:30px;
	background-color: #FF5454;
	border-radius:10px;
	color:white;
	border:none;
}
#replyFrm{
	height:65px;
	padding-left:1%;
}
#rContent{
	width:86.5%;
	height:100%;
	border-radius: 10px;
	border:1px solid rgb(200,200,200);
	padding-left:2%;
}
#rSubmit{
	width:12%;
	height:100%;
	background-color: #FF5454;
	border-radius:10px;
	color:white;
	border:none;
}
#rContent:focus {
	outline:none;
}
@media ( min-width: 1800px ) {
	#viewRecipe{
		padding:6%;
	}
	#imgDiv{
		height:850px;
	}
	#recipeInfo{
		height:850px;
		font-size:16pt;
	}
	#ingredList{
		height:20%;
	}
	#title{
		text-align: center;
		font-size:30pt;
		margin-bottom:3%;
	}
	#boardInfo{
		font-size:14pt;
	}
	#ingredList{
		max-height:300px;
	}
	#ingredList>li{
		display:inline-block;
		font-size: 15pt;
		padding-left:1.5%;
		padding-right:1.5%;
		margin-right:1%;
		margin-bottom:1.5%;
		border-radius:10px;
		border:1px solid rgb(200,200,200);
	}
	#content{
		height:380px;
	}
	#totalKcal{
		height:33px;
		line-height:35px;
	}
}
</style>

<script>
$(function(){
	
	$(".commentIcon").click(function(){
		$("#commentDiv").fadeToggle("100ms");
	});
	$("#replyClose").click(function(){
		$("#commentDiv").fadeToggle("100ms");
	});
	
	//찜하기 셋팅
	$(document).ready(function(){
		setHeart();
		setReply();
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

//레시피 글 삭제
function deleteRecipe(boardNum, img){
	if(!confirm("레시피를 삭제하시겠습니까?")){
		return false;
	}
	
	$.ajax({
		url: "/recipe/delete",
		data : "board_num="+boardNum+"&recipe_img_file="+img,
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
//찜하기 set
function setHeart(){
	$.ajax({
		url: "/recipe/selectHeart",
		type: "post",
		success: function(result){
			if(result.length>0){
				$(result).each(function(){
					var boardNum = this.board_num;
					$("#e_"+boardNum).css("display", "none");
					$("#f_"+boardNum).css("display", "block");
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
			$("#f_"+boardNum).css("display", "block");
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
			$("#f_"+boardNum).css("display", "none");
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
	
	return false;
}

//댓글 set
function setReply(){

	$.ajax({
		url: "/reply/replyList",
		data: "board_num="+$("#board_num").val(),
		type: "post",
		success: function(result){
			if(result.length>0){
				$("#replyList").html("");
				$(result).each(function(){
					var tag=""
					tag = '<li><label>'+this.user_id+'</label>';
					tag += '<label>'+this.reply_date+'</label>';
					tag += '<p id="rContent'+this.reply_num+'">'+this.content+'<label onclick="deleteReply('+this.reply_num+');">삭제</label><label onclick="editClick('+this.reply_num+');">수정</label></p>';
					tag += '<form method="post" action="/recipe/updateReply" id="editFrm'+this.reply_num+'"class="replyEditFrm" onsubmit="return false;">';
					tag += '<input type="hidden" name="board_num" value="'+this.board_num+'"/>';
					tag += '<input type="hidden" name="reply_num" value="'+this.reply_num+'"/>';
					tag += '<input type="text" name="content" value="'+this.content+'"/>';
					tag += '<input type="button" value="수정" onclick="editReply('+this.reply_num+')"/> <input type="reset" value="취소" onclick="editClose('+this.reply_num+')"/></form></li>';
					
					$("#replyList").append(tag);
				});
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});

}

//수정 클릭
function editClick(reply_num){
	$("#rContent"+reply_num).css("display","none");//내용 숨기기
	$("#rContent"+reply_num).next().css("display","block");//폼 보이게
}
// 수정 취소 클릭
function editClose(reply_num){
	$("#rContent"+reply_num).css("display","block");
	$("#rContent"+reply_num).next().css("display","none");
}

//댓글 등록
function insertReply(board_num){
	
	if($("#rContent").val()==""){
		alert("댓글 내용을 입력해 주세요.");
		$("#rContent").focus();
		return false;
	}
	var params = $("#replyFrm").serialize();
	
	$.ajax({
		url: '/reply/insertReply',
		data: params,
		type: 'post',
		success: function(result){
			setReply();
			$("#rContent").val("");
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}
//댓글 삭제
function deleteReply(reply_num){
	if(!confirm("댓글을 삭제하시겠습니까?")){
		return false;
	}
	$.ajax({
		url: '/reply/deleteReply/',
		type: 'post',
		data: 'reply_num='+reply_num,
		success: function(result){
			if(result>0){
				setReply();
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}
//댓글 수정
function editReply(reply_num){
	var params = $("#editFrm"+reply_num).serialize();
	$.ajax({
		url: '/reply/updateReply',
		type: 'post',
		data: params,
		success: function(result){
			if(result>0){
				setReply();
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}
</script>

<div>
	<div id="viewRecipe">
		
		<div id="imgDiv">
			<!-- 이미지 -->
			<img src="/recipeImg/upload/${vo[0].recipe_img_file}" id="recipe_img"/>
		</div>
		
		<div id="recipeInfo">
			<input type="hidden" name="board_num" id="board_num" value="${vo[0].board_num}"/>
			<!-- title -->
			<p id="title">${vo[0].title}</p>
			
			<!-- 작성자, 등록일, 수정, 삭제 등 정보 -->
			<div id="boardInfo">
				<ul id="info">
					<li>작성자:&nbsp;${vo[0].user_id}</li>
					<li>작성일:&nbsp;${vo[0].write_date}</li>
					<li>조회수:&nbsp;${vo[0].hit}</li>
				</ul>
				<c:if test="${logId==vo[0].user_id}">
					<ul id="editDelete">
						<li><a href="/recipe/edit?board_num=${vo[0].board_num}">수정</a></li>
						<li><a href="javascript:deleteRecipe(${vo[0].board_num}, '${vo[0].recipe_img_file}');">삭제</a></li>
					</ul>
				</c:if>
			</div>
		
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
				<c:if test="${logId!=null}">	<!-- 로그인 한 경우만 찜하기 가능 -->
					<img src="/recipeImg/heart1.png" class="heart1" id="e_${vo[0].board_num}"/>
					<img src="/recipeImg/heart2.png" class="heart2" id="f_${vo[0].board_num}"/>
				</c:if>
				<img src="/recipeImg/commentIcon.png" class="commentIcon"/>
			</div>
		</div>
	</div>
	<div id="commentDiv">
		<p>댓글창<label id="replyClose">&times;</label></p>
		
		<ul id="replyList">
		</ul> 
		<c:if test="${logId!=null}">
			<form method="post" action="/reply/insertReply" id="replyFrm" onsubmit="return false;">
				<input type="hidden" name="board_num" id="board_num" value="${vo[0].board_num}"/>
				<input type="text" name="content" id="rContent"/>
				<input type="submit" value="등록" id="rSubmit" onclick="insertReply(${vo[0].board_num});"/>
			</form>
		</c:if>
	</div>
</div>