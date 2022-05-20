<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/train/mytrain.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
function delete_myList(train_num) {
	if(confirm("운동을 삭제하시겠습니까?")){
		location.href="/trainning/delete_mytrain?train_num="+train_num;
		}
	}
	
function start_myLlist(train_num) {
	if(confirm("운동을 시작하시겠습니까?")){
		location.href="/trainning/testTrain";
		}
	}

function module_set(train_num){
      var data = "train_num="+ train_num;
      $("#my_trainList"+ train_num).html("")
      $.ajax({
         url: '/trainning/get_train_list',
         data: data,
         type: 'post',
         
         success: function(result){
       	  	var tag="";
       	  	
            	$(result).each(function(){
               tag = '<li class="my-list"><p></p><img src="/train_model/moduleImg/'+ this.module_img +'" style="width:200px;"><p>' + this.module_title + '</p><p>'+this.module_content+'</p></li>';
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

        <li><a  href="/trainning/trainningHome">트레이닝 센터</a></li>
        <li><a class="active" href="/trainning/myTrainning">나만의 운동</a></li>
        <li><a class="li-a" href="/trainning/recommendTrainning">추천 운동 목록</a></li>
    </ul>
    
    <div class="mytrain-frm">
        <h2>04 May Wed</h2>
        <h2>나만의 운동 관리</h2>  
		<ul>
			<c:forEach var='vo' items="${selectvo}">
				<div class="my-list-div" onload="module_set(${vo.train_num})">
					<h3>${vo.train_title}</h3>        
					<p><button class="del-btn" onclick="delete_myList(${vo.train_num})">삭제하기 + ${vo.train_num }</button></p>
					<ul id="my_trainList${vo.train_num}" class="my_trainList"></ul>
					<p><button class="del-btn" onclick="start_myLlist(${vo.train_num})">시작하기</button></p>
					<hr>
					<script type="text/javascript">
						module_set(${vo.train_num})
					</script>
				</div>
			</c:forEach> 
		</ul> 
    </div>