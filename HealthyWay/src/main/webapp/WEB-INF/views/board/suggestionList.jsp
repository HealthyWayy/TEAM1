<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<link rel="stylesheet" href="${url}/css/board/board.css">





<script>
	$(function(){
		$("#searchFrm").submit(function(event){
			event.preventDefault();
			if($("#searchWord").val()== ""){
				alert("검색어를 입력하세요");
				return false;
			}
		});
	});
</script>

<div class="bo__title">
<img src="/img/freedom.jpg">	
</div>


<!-- 검색 -->
<div class="bo__tatble__top">
	<form method="get" action="" id="searchFrm">
		<select name="searchKey" class="bo__search">
			<option value="title">제목</option>
			<option value="content">글 내용</option>
			<option value="user_id">작성자</option>
		</select>
		<input type="text" name="searchWord" id="searchWord"/>
		<input type="submit" value="Search" class="bo__btn"/>
		<button class="bo__btn__w" type="button" onclick="location.href='${url}/suggestionWrite'">글 작성</button>
	</form>
</div>

<table class="bo__table">
    <thead>
       <tr>
            <th style="width:5%">No</th>
            <th style="width:10%">작성자</th>
            <th style="width:65%">제목</th>
            <th>조회수</th>
            <th>글쓴날짜</th>
         </tr>
    </thead>
    <tbody class="bd_t" id="bd_t">
 		<c:forEach var="vo" items="${suggestionList}">
	         <tr>
	            <td>${vo.board_num}</td>
	            <td>${vo.user_id}</td>
	            <td class="bo__title1"><a href="${url}/board/suggestionList/${vo.board_num}"> ${vo.title} </a></td>
				<td>${vo.hit}</td>
	            <td>${vo.write_date}</td>
	        </tr>
        </c:forEach> 
    </tbody>
</table>


<div class="bo__container">
	
	<div class="bo__n__page">
		현재 페이지 ${spvo.pageNum}/ ${spvo.totalPage }
	</div>

	
	<!-- 페이징 -->
	<ul class="paging">
		<!-- 이전페이지 -->
		<c:if test="${spvo.pageNum==1 }">
		<li>prev</li>
		</c:if>
		<c:if test="${spvo.pageNum>1 }">
		<li><a href="${url}/board/suggestionList?pageNum=${bvo.pageNum-1}<c:if test='${bvo.searchWord!=null}'>&searchWord=${bvo.searchWord}</c:if>">prev</a></li>
		</c:if>
		<!-- 페이지 번호  -->
		<c:forEach var="p" begin="${spvo.startPage}" end="${spvo.startPage+spvo.onePageCount}">
			<!-- 총 페이지수 보다 출력할 페이지 번호가 작을 때 -->
			<c:if test ="${p <= spvo.totalPage}">
				<c:if test="${p==spvo.pageNum }">
					<li style="font-size= 20px"><a href="${url}/board?pageNum=${p}">${p}</a></li>
				</c:if>
				<c:if test="${p!=spvo.pageNum }">
					<li><a href=${url}/board/suggestionList?pageNum=${p}<c:if test='${spvo.searchWord!=null}'>&searchWord=${spvo.searchWord}</c:if>>${p}</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지  -->
		<c:if test="${spvo.pageNum == spvo.totalPage }">
			<li>next</li>
		</c:if>
		<c:if test="${spvo.pageNum < spvo.totalPage }">
			<li><a href="${url}/board/suggestionList?pageNum=${spvo.pageNum+1}<c:if test='${spvo.searchWord!=null}'>&searchWord=${spvo.searchWord}</c:if>">next</a></li>
		</c:if>
	</ul>
</div>