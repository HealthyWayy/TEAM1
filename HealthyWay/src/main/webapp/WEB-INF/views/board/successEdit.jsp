<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<style>
	#subject{width:99%}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		var fileCount = ${fileCount};
		
		//새로 추가되는 첨부파일
		$("#dataFrm b").click(function(){
			$(this).parent().css("display","none");//파일명 숨기기
			$(this).parent().next().attr("name","delFile");//삭제파일 정보의 name을 delFile로 변경
			$(this).parent().next().next().attr("type","file");//새로운 파일을 선택 가능하도록 변경
			//파일의 갯수가 줄어야 한다
			fileCount--;
		});
		
		$("#dataFrm").submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글 내용을 입력하세요");
				return false;
			}

			if($("#filename1").val()!=''){
				fileCount++;
			}
			if($("#filename2").val()!=''){
				fileCount++;
			}
			
			if(fileCount<1){
				alert("첨부파일은 반드시 1개 이상이어야 합니다. You got it?");
				return false;
			}
		});
	});
</script>
<div class="container">
	<h1>자료실 글 수정 폼</h1>
	<!-- 파일 업로드 기능을 가진 폼은 반드시 enctype속성을 명시해야 한다. -->
	<form id="dataFrm" method="post" action="/board/boardEdit" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${vo.board_num }"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="title" id="title" value="${vo.title}"/></li>
			<li>글 내용</li>
			<li><textarea name="content" id="content">${vo.content}</textarea></li>
			<li>첨부파일</li>
			<li>
				<!-- 첫번째 첨부파일 -->
				<div>${vo.filename1}&nbsp;&nbsp;&nbsp;<b>X</b></div>
				<!-- X를 누르면 삭제파일명이 있는 input의 name속성값을 delFile -->
				<input type="hidden" name="" value="${vo.filename1}"/>
				<!-- X를 누르면 파일이 삭제되고 새로운 파일 선택이 가능하도록 input을 만들어 준다 -->
				<input type="hidden" name="filename" id="filename1"/>
			</li>
			<li>
				<!-- 두번째 첨부파일이 있을때 -->
				<c:if test="${vo.filename2!=null && vo.filename2!='' }">
					<div>${vo.filename2 } &nbsp;&nbsp;<b>X</b></div>
					<input type="hidden" name="" value="${vo.filename2 }"/>
					<input type="hidden" name="filename" id="filename2"/>
				</c:if>
				<!-- 두번째 첨부파일이 없을때 -->
				<c:if test="${vo.filename2==null || vo.filename2=='' }">
					<input type="file" name="filename" id="filename2"/>
				</c:if>
			</li>
			<li><input type="submit" value="성공스토리 글 수정"/></li>
		</ul>
	</form>
</div>