<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/train.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
function delete_myList(train_num) {
	alert("삭제되었습니다.");
	
}

function module_set(train_num){
	console.log("시작");
      var data = "train_num="+ train_num;
      $("#my_trainList"+ train_num).html("")
      $.ajax({
         url: '/trainning/get_train_list',
         data: data,
         type: 'post',
         
         success: function(result){
       	  	var tag="";
       	  	
            	$(result).each(function(){
               tag = '<li><p></p><img src="/train_model/moduleImg/'+ this.module_img +'"><p>' + this.module_title + '</p><p>'+this.module_content+'</p></li>';
               $("#my_trainList"+train_num).append(tag);
            });
            	
         },
         error: function(e){
            console.log(e.responseText);
         }
      });
    }
</script>
    

    <ul id="menu">
        <li><a href="/home/">홈</a></li>
        <li><a  href="/trainning/trainningHome">트레이닝 센터</a></li>
        <li><a class="active" href="/trainning/myTrainning">나만의 운동</a></li>
        <li><a href="/trainning/recommendTrainning">추천 운동 목록</a></li>
    </ul>
    
    <div style="background-color: ;" >
        <h2>04 May Wed</h2>
        <h2>나만의 운동 관리</h2>
        
        
	            <c:forEach var='vo' items="${selectvo}">
	            <div onload="module_set(${vo.train_num})">
	            
		            <h3>${vo.train_title}</h3>
		            <p><button onclick="delete_myList(${vo.train_num})">삭제하기 + ${vo.train_num }</button></p>
			            <ul id="my_trainList${vo.train_num}" class="my_trainList">
			      		</ul>
		            <hr>
		            <script type="text/javascript">
		            module_set(${vo.train_num})
		            </script>
		        </div>
	            </c:forEach>
        	

        <div>
            <h3>하체운동</h3><p>등록 날짜 : 22.05.04</p>
            <p><button>삭제하기</button></p>
            <ul>
                <li><a href="#"><img src="/img/train_ex3.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex3.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex3.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex3.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex3.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
            </ul>
        </div>

        <div>
            <h3>전신운동</h3><p>등록 날짜 : 22.05.04</p>
            <p><button>삭제하기</button></p>
            <ul>
                <li><a href="#"><img src="/img/train_ex4.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex4.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex4.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex4.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
                <li><a href="#"><img src="/img/train_ex4.jpg" alt=""><p>운동이름</p><p>운동설명</p></a></li>
            </ul>
        </div>



    </div>
    
    
    </div>