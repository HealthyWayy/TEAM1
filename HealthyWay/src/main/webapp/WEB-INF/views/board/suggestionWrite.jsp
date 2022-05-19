<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/boardWrite.css">

<script>
$(function() {
	$("#writeBtn").hover(function(){
		$(this).css("background-color", "#fff").css("border", "1px solid #bdbdbd").css("color", "#000");
	}, function(){
		$(this).css("background-color", "#ff5454").css("border", "1px solid #ff5454").css("color", "#fff");
	});
	
    $("#writeBtn").on("click",function() {
       if ($("#title").val() == "") {
          alert("글 제목을 입력하세요");
       }else if ($("#user_id").val() == "") {
           alert("접속하신 아이디를 입력하세요");
       }else if ($("#content").val() == "") {
           alert("내용을 입력하세요");
       }else{
    	   $("#writeFrm").submit();
       }
    });
 });
</script>

<div class="wrap">
	 <form id="writeFrm" method="post" action="${url}/suggestionWrite">
		<ul>
			<li>
				<select name="type_num" id="type_num">
					<option value="5">자유게시판</option>
					<option value="3">성공스토리</option>
				</select>
			</li>
			<li>
				<input type="text" name="title" id="title" placeholder="제목">
			</li>
			<li>
				<textarea name="content" id="content" placeholder="내용을 입력해주세요!"></textarea>
			</li>
		</ul>
	</form>
</div> 
<div class="writeBtn_wrap">
	<input class="writeBtn" type="button" id="writeBtn" value="등록">
</div> 
