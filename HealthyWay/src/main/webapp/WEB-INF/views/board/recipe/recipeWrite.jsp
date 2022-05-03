<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/recipeWrite.css" type="text/css" />
<script>
$(function(){
	
	//이미지 첨부되면 실행
	$("#file").change(function() {
		setImage(this, "#preview");
	});
    
	//글 등록 submit 이벤트
	$("#writeFrm").submit(function(){
		event.preventDefault();
		
		//유효성 검사
		if($("#title").val()==""){
			alert("레시피 제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if($("#ingredList>li").length<=0){
			alert("재료를 추가하세요.");
			return false;
		}
		if($("#contnet").val()==""){
			alert("레시피 설명란을 입력하세요.");
			$("#contnet").focus();
			return false;
		}
		
		return false;
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
<div>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ingredModal">
	  Open modal
	</button>
	<!-- 재료 모달창 -->
	<div class="modal fade" id="ingredModal">
		<div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
			<div class="modal-header">
	        <h4 class="modal-title">Ingredient List</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		
	    <div class="modal-body">
	    	<!-- 재료 리스트 -->
	    	<div id="ingredView">
	    		<form id="ingredSearch">
		    		<select name="searchKey">
		    			<option>음식명</option>
		    			<option>분류</option>
		    		</select>
		    		<input type="text" name="searchValue"/>
		    		<input type="submit" value="검색"/>
	    		</form><hr/>
	    		<p>재료 선택</p>
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">First item</a>
					<a href="#" class="list-group-item list-group-item-action">Second item</a>
					<a href="#" class="list-group-item list-group-item-action">Third item</a>
					<a href="#" class="list-group-item list-group-item-action">First item</a>
					<a href="#" class="list-group-item list-group-item-action">Second item</a>
					<a href="#" class="list-group-item list-group-item-action">Third item</a>
					<a href="#" class="list-group-item list-group-item-action">First item</a>
					<a href="#" class="list-group-item list-group-item-action">Second item</a>
				  <!-- 페이징 -->
					<ul class="paging">
						<a href="#"><li>◀</li></a>
						<a href="#"><li class="active_list">1</li></a>
						<a href="#"><li>2</li></a>
						<a href="#"><li>3</li></a>
						<a href="#"><li>4</li></a>
						<a href="#"><li>▶</li></a>
					</ul>
				</div>
	    	</div>
	    	<!-- 재료 추가 폼 -->
	    	<form id="ingredFrm">
	    		<p>음식명</p>
	    		<input type="hidden" name="gred_num"/>
	    		<input type="hidden" name="board_num" value="0"/><!-- 임의로 설정 -->
	    	</form>
	    </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" id="closeBtn" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<form method="post" action="/recipe/wirte" id="writeFrm" enctype="multipart/form-data">
		<div id="imgDiv">
			<!-- title -->
			<label for="title">Recipe: </label>
			<input type="text" name="title" id="title"/>
			
			<!-- 이미지 첨부 -->
			<input type="file" name="filename" id ="file"/>
			<input type="hidden" name="imgFile" value="" id="imgFile"/>
			<a href="javascript:document.getElementById('file').click();"><img src="/img/sampleimg.png" id="preview"/></a>
		</div>
		<div id="recipeInfo">
			<p class="subTitle">재료</p><hr/>
			<ul id="ingredList">
				<li>감자<span class="times">&times;</span></li>
				<li>양파<span class="times">&times;</span></li>
			</ul>
			<p class="subTitle">소스</p><hr/>
			<ul id="souceList">
				<li>간장<span class="times">&times;</span></li>
				<li>참기름<span class="times">&times;</span></li>
			</ul>
			<p class="subTitle">레시피 설명</p><hr/>
			<textarea name="content" id="content"></textarea>
			
			<input type="reset" value="취소"/>
			<input type="submit" value="등록"/>
		</div>
	</form>
</div>