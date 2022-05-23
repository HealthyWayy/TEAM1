<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/boardWrite.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
$(function() {
	// 글등록 버트 누르면 submit 실행
    $("#writeBtn").on("click",function() {
       if ($("#title").val() == "") {
          alert("글 제목을 입력하세요");
       }else if ($("#content").val() == "") {
           alert("내용을 입력하세요");
       }else{
    	   $("#writeFrm").submit();
       }
    });
	
	// 글등록 버튼 색변경
	$("#writeBtn").hover(function(){
		$(this).css("background-color", "#fff").css("border", "1px solid #bdbdbd").css("color", "#000");
	}, function(){
		$(this).css("background-color", "#ff5454").css("border", "1px solid #ff5454").css("color", "#fff");
	});
 });
</script>

<div class="wrap">
	 <form id="writeFrm" method="post" action="${url}/successEditOk">
		<ul id="writeFrm_wrap">
			<li>
				<select name="type_num" id="type_num">
					<option id="success" value="3" selected>성공스토리</option>
				</select>
			</li>
			<li id="title_wrap">
				<input type="text" name="title" id="title" placeholder="제목"  value="${bvo.title}">
			</li>
			<li class="img_wrap" style="display: block;">
				<div class="img_div" style="border: none;">
					<div class="img_phr" id="before_phr" style="display: none;">
						<span class="material-symbols-outlined">add_a_photo</span> Before
					</div>
					<img src="successImg/${bvo.img_file1}" id="before_preview">
				</div> 
				<!-- before 이미지 첨부 --> 
				<input type="file" name="filename" value="" id="before_file" style="display: none"> 
				<input type="hidden" name="img_file1" value="" id="before_img_file">
			</li>
			<li class="img_wrap" style="display: block;">
				<div class="img_div" style="border: none;">
					<div class="img_phr" id="after_phr" style="display: none;">
						<span class="material-symbols-outlined">add_a_photo</span> After
					</div>
					<img src="successImg/${bvo.img_file2}" id="after_preview">
				</div> 
				<!-- after 이미지 첨부 --> 
				<input type="file" name="filename" value=""	id="after_file" style="display: none"> 
				<input type="hidden" name="img_file2" value="" id="after_img_file">
			</li>
			<li>
				<textarea name="content" id="content" placeholder="내용을 입력해주세요!">${bvo.content}</textarea>
			</li>
			<li style="display: none;"><input type="hidden" name="board_num" value="${bvo.board_num}"></li>
		</ul>
	</form>
</div> 
<div class="writeBtn_wrap">
	<input class="writeBtn" type="button" id="writeBtn" value="등록">
</div> 
    