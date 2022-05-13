<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function delCheck(){
		//confirm()은 사용자가 y, n을 선택 가능한 대화 상자
		if(confirm("글을 삭제하시겠습니까?")){
			//확인버튼 선택시
			location.href = "/board/boardDel?no="+${vo.no};
		}
	}
	//댓글-----------------------------------------
	$(function(){
		//댓글목록
		function replyListAll(){//현재 글의 댓글을 모두 가져온다
			var url = "/reply/list";
			var params = "board_num=${vo.board_num}";
			$.ajax({
				url : url,
				data : params,
				success : function(result){
					var $result = $(result);
					
					var tag = "<ul>";
					
					$result.each(function(idx, vo){
						tag += "<li><div>"+vo.userid;
						tag += "("+vo.writedate+") ";
						
						if(vo.userid=='${logId}'){
							tag += "<input type='button' value='수정'/>";
							tag += "<input type='button' value='삭제' title='"+vo.replyno+"'/>";
						}
						
						tag += "<br/>"+vo.coment+"</div>";
						
						//본인 글일때 댓글수정 폼이 있어야 한다
						if(vo.userid=='${logId}'){
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
<div class="container">
	<h1>글 내용 보기</h1>
	<ul>
		<li>번호 : ${vo.board_num}</li>
		<li>작성자 : ${vo.userid}</li>
		<li>작성일 : ${vo.writedate}, 조회수 : ${vo.hit}</li>
		<li>제목 : ${vo.subject}</li>
		<li>글 내용</li>
		<li>${vo.content}</li>
	</ul>
	<div>
		<c:if test="${logId==vo.userid }">
			<a href="/myapp/board/boardEdit?no=${vo.no}">수정</a>
			<a href="javascript:delCheck()">삭제</a>
		</c:if>
	</div>
	<hr/>
	<!-- 댓글쓰기 -->
	<c:if test="${logStatus=='Y'}">
		<form method="post" id="replyFrm">
			<input type="hidden" name="no" value="${vo.no}"/>
			<textarea name="coment" id="coment" style="width:500px; height:100px;"></textarea>
			<input type="submit" value="댓글등록"/>
		</form>
	</c:if>
	<!-- 댓글 목록이 나올 자리 -->
	<div id="replyList">
	
	</div>
</div>