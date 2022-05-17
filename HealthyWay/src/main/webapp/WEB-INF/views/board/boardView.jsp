<link rel="stylesheet" href="${url}/css/board.css">

<script>
$(function() {
    console.log($)
	 $("#btn_delete").on("click",function() {
        $(function(){
            var url = "${url}/board/boardList";
            var data = $("#boardFrm").serialize()
         $.ajax({
            url : url,
            type : "DELETE",
            dataType : "JSON",
            data : data,
            success : function(result) {
               alert(result.msg);
               window.location.href = result.redirect;
            },
            error : function(error){
               console.log(error.responseJSON);
               alert(error.responseJSON.msg);
               
            
            }
            
        }) ; 
        });
    });
 });





</script>


<div id="#b__table" >
         <img src="/img/board2.jpg">
        <h1 class="bf__title"></h1>
       
       <form id="boardFrm" class="bf__container" method="post" action="/board/boardList/edit/${bvo.board_num}" id="boardFrm" >
           <input type="hidden" value="boardWrite" name="command">
        
            <table class="bf__table">
                <tr>
                    <th>제목 :</th>
                    <td>${bvo.title }</td>
					 

                </tr>
                <tr>
                    <th>아이디 :</th>
                    <td>${bvo.user_id }</td>
                </tr>
                <tr>
                    <th>내용 :</th>
                    <td>${bvo.content }</td>
                </tr>
            </table>
            <input class="bo__btn__m" type="submit" id="btn_submit" value="수정">
            <input class="bo__btn__wa" type="button" id="btn_delete" value="삭제">
            <input class="bo__btn__mb" type="button" value="목록" onclick="javascript:history.back()">
       </form>
</div>
