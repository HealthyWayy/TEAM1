
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

function delCheck(){
	
}

$(function(){
	//댓글목록
	function replyListAll(){//현재 글의 댓글을 모두 가져온다
		var url = "/myapp/reply/list";
		var params = "no=${vo.reply_num}";
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				
				var tag = "<ul>";
				
				$result.each(function(idx, vo){
					tag += "<li><div>"+vo.user_id;
					tag += "("+vo.write_date+") ";
					
					if(vo.userid=='${logId}'){
						tag += "<input type='button' value='수정'/>";
						tag += "<input type='button' value='삭제' title='"+vo.reply_num+"'/>";
					}
					
					tag += "<br/>"+vo.coment+"</div>";
					
					//본인 글일때 댓글수정 폼이 있어야 한다
					if(vo.user_id=='${logId}'){
						tag += "<div style='display:none'><form method='post'>";
						tag += "<input type='hidden' name='replyno' value='"+vo.replyno+"'/>";
						tag += "<textarea name='coment' style='width:400px; height:50px'>"+vo.coment+"</textarea>";
						tag += "<input type='submit' value='수정'/>";
						tag += "</form></div>";
					}
					
					tag += "<hr/></li>";
				});
				
				tag += "</ul>";
				$("#replyList").html(tag);
			},
			error : function(e){
				console.log(e.responseText);
			}
		});
	}
	//댓글 등록
	$("#replyFrm").submit(function(){
		event.preventDefault();
		if($("#coment").val()==""){
			alert("댓글을 입력하세요");
			return;
		}else{
			var params = $("#replyFrm").serialize();
			
			$.ajax({
				url : "/myapp/reply/writeOk",
				data : params,
				type : "POST",
				success : function(r){
					//댓글 입력 성공 후 쓰기 창을 초기화
					$("#coment").val("");
					
					replyListAll();
				},
				error : function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	//댓글 수정버튼 선택시 해당 댓글의 수정 폼 보여주기
	$(document).on("click","#replyList input[value=수정]",function(){
		//this : 이벤트 발생 요소
		$(this).parent().css("display", "none");//숨기기
		//보여주기
		$(this).parent().next().css("display", "block");
	});
	//댓글 수정(DB)
	$(document).on("submit","#replyList form",function(){
		event.preventDefault();
		//데이터
		var params = $(this).serialize();
		var url = "/myapp/reply/editOk";
		$.ajax({
			url : url,
			data : params,
			type : "POST",
			success : function(result){
				console.log(result);
				replyListAll();
			},
			error : function(){
				console.log("수정 에러 발생");
			}
		});
	});
	//댓글 삭제
	$(document).on("click", "#replyList input[value=삭제]", function(){
		if(confirm("댓글을 삭제하시겠습니까?")){
			var params = "replyno="+$(this).attr("title");
			$.ajax({
				url : "/myapp/reply/del",
				data : params,
				success : function(result){
					console.log(result);
					replyListAll();
				},
				error : function(){
					console.log("댓글 삭제 에러");
				}
			});
		}
	});
	//글 상세보기 진입시 댓글리스트 출력
	replyListAll();
});
</script>




</script>



<div id="#b__table" >
        <h1 class="bf__title">👇 공지 사항 👇</h1>
       <form id="boardFrm" class="bf__container" method="post" action="/board/boardList/edit/${bvo.board_num}" id="boardFrm" >
           <input type="hidden" value="boardWrite" name="command">
        
            <table class="bf__table">
                <tr>
                    <th class="bd__tb__sub">제목</th>
                    <td>${bvo.title }</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>${bvo.user_id }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${bvo.content }</td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${bvo.hit }</td>
                </tr>
                <tr>
                    <th>등록시간</th>
                    <td>${bvo.write_date }</td>
                </tr>
                
            </table>
            <input class="bo__btn__m" type="submit" id="btn_submit" value="수정">
            <input class="bo__btn__wa" type="button" value="삭제" onclick="javascript:delCheck()">
            <input class="bo__btn__mb" type="button" value="목록" onclick="javascript:history.back()">
            <input type="submit" value="댓글등록"/>
            <!-- 댓글쓰기 -->
	<c:if test="${logStatus=='Y'}">
		<form method="post" id="replyFrm">
			<input type="hidden" name="reply_num" value="${vo.reply_num}"/>
			<textarea name="coment" id="coment" style="width:500px; height:100px;"></textarea>
			
		</form>
	</c:if>
	<!-- 댓글 목록이 나올 자리 -->
	<div id="replyList">
	
	</div>
            
            
       </form>
</div>
	
