<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/board/boardWrite.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
$(function() {
	// 글등록 버튼 색변경
	$("#writeBtn").hover(function(){
		$(this).css("background-color", "#fff").css("border", "1px solid #bdbdbd").css("color", "#000");
	}, function(){
		$(this).css("background-color", "#ff5454").css("border", "1px solid #ff5454").css("color", "#fff");
	});
	
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
    
    // 이미지 div 누르면 file 실행
    $(".img_div").click(function(){
    	$(this).next().click();
    });
    
    $("#before_file").change(function(){
    	$("#before_phr").css("display", "none");
    	$(this).prev().css("border", "none");
    	setImage(this, "#before_preview");
    	
    	var file = $("#before_file").val();
    	var idx = file.lastIndexOf("\\")+1;
    	$("#before_img_file").val(file.substring(idx));
    	console.log($("#before_img_file").val());
    });
    
    $("#after_file").change(function(){
    	$("#after_phr").css("display", "none");
    	$(this).prev().css("border", "none");
    	setImage(this, "#after_preview");
    	
    	var file = $("#after_file").val();
    	var idx = file.lastIndexOf("\\")+1;
    	$("#after_img_file").val(file.substring(idx));
    	console.log($("#after_img_file").val());
    });
    
    // 카테고리 바뀌면 이미지 폼 노출
   	$("select").change(function(){
   		if($("select option:selected").val() == 3){
   			$(".img_wrap").css("display", "block");
   		}
   		
   		if($("select option:selected").val() == 5){
   			$(".img_wrap").css("display", "none");
   		}
   	});
    
    
 });

//이미지 미리보기
function setImage(input, preview) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$(preview).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
};

</script>

<div class="wrap">
	 <form id="writeFrm" method="post" action="${url}/suggestionWrite">
		<ul>
			<li>
				<select name="type_num" id="type_num">
					<option id="free" value="5">자유게시판</option>
					<option id="success" value="3">성공스토리</option>
				</select>
			</li>
			<li id="title_wrap">
				<input type="text" name="title" id="title" placeholder="제목">
			</li>
			<li class="img_wrap" style="display: none;">
				<div class="img_div">
					<div class="img_phr" id="before_phr">
						<span class="material-symbols-outlined">add_a_photo</span>
						Before
					</div>
					<img src="" id="before_preview">
				</div>
				<!-- before 이미지 첨부 -->
				<input type="file" name="before_file" value="" id="before_file" style="display: none">
				<input type="hidden" name="img_file1" value="" id="before_img_file">
			</li>
			<li class="img_wrap" style="display: none;">
				<div class="img_div">
					<div class="img_phr" id="after_phr">
						<span class="material-symbols-outlined">add_a_photo</span>
						After
					</div>
					<img src="" id="after_preview">
				</div>
				<!-- after 이미지 첨부 -->
				<input type="file" name="after_file" value="" id="after_file" style="display: none">
				<input type="hidden" name="img_file2" value="" id="after_img_file">
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
