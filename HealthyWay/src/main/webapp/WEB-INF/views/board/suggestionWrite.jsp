<link rel="stylesheet" href="${url}/css/board.css">


<script>
$(function() {
	console.log('실행')
    $("#btn_submit").on("submit",function() {
       if ($("#title").val() == "") {
          alert("글 제목을 입력하세요");
          return false;
       }
       if ($("#user_id").val() == "") {
           alert("접속하신 아이디를 입력하세요");
           return false;
        }
       if ($("#content").val() == "") {
           alert("내용을 입력하세요");
           return false;
        }
       
       $(function(){
         var url = "${url}/suggestionWrite";
         var data = $("#boardFrm").serialize();
         
          $.ajax({
             url : url,
             type : "POST",
             dataType : "JSON",
             data : data,
             success : function(result) {
            	 alert(result);
             },
             error : function(error){
                console.log(error.responseJSON);
                alert(error.responseJSON.msg);
                window.location.href = error.responseJSON.redirect;
             }
             
         }) ;
       });
    });
 });
</script>
  
   <div id="#b__table" >
        <h1 class="bf__title">👇 게시글 작성 👇</h1>
       <form id="boardFrm" class="bf__container" method="post" action="/suggestionWrite">
        	<input type="hidden" value="suggestWrite" name="command">
        
            <table class="bf__table">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" id="title" placeholder="제목을 작성해주세요"></td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="user_id" value="${logId}"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="30"  name="content" id="content" style="padding: 10px"></textarea></td>
                </tr>
            </table>
            <input class="bo__btn__wa" type="submit" id="btn_submit" value="등록">
            <input class="bo__btn__wa" type="button" value="취소" onclick="javascript:history.back()">
    	</form>
    </div>