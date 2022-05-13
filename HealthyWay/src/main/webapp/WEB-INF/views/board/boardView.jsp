<link rel="stylesheet" href="${url}/css/board.css">



<div id="#b__table" >
        <h1 class="bf__title">👇 공지사항 👇</h1>
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
            </table>
            <input class="bo__btn__m" type="submit" id="btn_submit" value="수정">
            <input class="bo__btn__mb" type="button" value="목록으로" onclick="javascript:history.back()">
       </form>
</div>
