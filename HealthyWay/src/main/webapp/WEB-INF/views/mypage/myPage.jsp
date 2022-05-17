<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>

body,ul,li{
	margin:0px;
	padding:0px;
	list-style:none;
}
#myPageBackground{
	background-image:url(/img/myPageBackground.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	background-attachment: fixed;
	width:100%;
	height:300px;
}
#myPageContainer{
	position:relative;
	top:0px;
	left:0px;
	width:1500px;
	margin:0 auto;
}
#myPageContainer *{
	font-family:"BinggraeReguler";
}
#myPageContainer>section, #myPageContainer>nav{
	float:left;
	background-color:white;	
}
#sidePage{
	width:250px;
	text-align:center;
	position:sticky;
	margin-top:-80px;
	top:20px;
	/*탑 오른쪽 아래 왼쪽*/
	padding:0px 0px 20px 0px;
	box-sizing:border-box;
	box-shadow:0px 0px 20px 0px rgb(196,196,196);
}
#sidePage>div:nth-of-type(2){
	margin-top:20px;
}
#groupPageDiv{
	height:0px;
	overflow:auto;
	padding-bottom:15px;
	border-radius:10px;
	transition-duration:1s;
}
#groupPageDiv::-webkit-scrollbar{
	display:none;
}
.groupPage{
	box-shadow:1px 1px 5px 1px black;
	border-radius:10px;
	width:200px;
	background-color:#ddd;
	height:250px;
	margin:0 auto;
	margin-top:20px;
	padding:10px;
	box-sizing:border-box;
}
.groupPage:hover{
	box-shadow:1px 1px 10px 1px black;
}
.groupPage>div:nth-of-type(1){
	margin:0 auto;
	width:170px;
	height:100px;
	overflow:hidden;
	background-color:green;
	text-align:center;
	border-radius:10px;
}
.groupPage>div>img{
	width:100%;
}
#imgDiv{
	width:100%;
	overflow:hidden;
	margin: 0 auto;
	text-align:left;
}
#imgDiv img{
	text-align:left;
	position:relative;
	left:50%;
	transform:translate(-50%,0%);
	width:100%;
}
#sidePage>div>span{
	font-size:1.2em;
	font-weight:bold;
}
#logout{
	position:relative;
	margin-top:20px;
	width:200px;
	height:40px;
}
.btnClass{
	line-height:0px;
	border-radius:15px;
	border:none;
	color:white;
	overflow:hidden;
	cursor:pointer;
    background:linear-gradient(
    		to right,
            rgba(181, 179, 217, 1) 0%,
            rgb(164,162,208) 20%,
            rgba(117, 114, 184, 1) 100%
            );
}
.btnClass::before{
	position:absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
	content:'로그아웃';
	width:100%;
	height:100%;
	line-height:40px;
	background:linear-gradient(
    		to right,
            rgba(181, 179, 217, 1) 0%,
            rgb(164,162,208) 20%,
            rgb(145,141,199) 100%
            );
    transition-duration:0.5s;
}
.btnClassHover::before{
	opacity:0;
}
#mainPage{
	position:absolute;
	left:300px;
	width:1200px;
	z-index:0;
}
#mainPage>div{
	float:left;
	width:100%;
}
#mainPage>div:nth-of-type(1){
	width:1000px;
	/*탑 오른쪽 아래 왼쪽*/
	padding:0px 30px 40px 0px;
	box-sizing:border-box;
}
.foodBtn+.writeBtn{
	border-right:2px solid #ddd;
}
.pageBtn{
	padding:0px;
	background-color:rgb(240,240,240);
	height:40px;
	position:absolute;
	border:none;
	border-bottom:none;
	top:-40px;
	width:250px;
	border:2px solid #ddd;
	border-right:none;
}
.inforBtn{
	left:0px;
	z-index:4;
}
.healthBtn{
	left:250px;
	z-index:3;
}
.foodBtn{
	left:500px;
	z-index002;
}
.writeBtn{
	left:750px;
	z-index:1;
}
.clickUpClass{
	background-color:white;
	z-index:5;
	border-bottom:none;
}
.pageUpClass{
	display:block !important;
}
.pageView{
	border:none !important;
	position:relative;
	/*탑 오른쪽 아래 왼쪽*/
	margin-bottom:30px;
	padding:40px 40px 0px 40px;
	box-sizing:border-box;
	width:1000px;
	display:none;
}
#sidePage>div:nth-of-type(1):after{
	content : "";
	margin-top : 10%;
	margin-left : 10px; 
	display:block;
	height  : 1px;
	width   : 90%;  /* or 100px */
	border-bottom:1px solid #ddd;
}

#groupShow {
	margin:10px 0 10px 0;
	width:10%;
	cursor:pointer;
	animation-duration: 0.5s;
	animation-name: imgUpDown;
	animation-iteration-count: infinite;
	animation-direction: alternate;
	animation-timing-function:linear;
}
@keyframes imgUpDown{
	0% {
		transform: translate(0, -3px);
	}
	100% {
		transform: translate(0, 3px);
	}
}
</style>
<script>
$(()=> {
	let groupShow=false;
	$("#groupShow").click(function(){
		console.log("실행");
		if(groupShow==false){
			$("#groupPageDiv").css("height","270px");
			groupShow=true;
		}else{
			$("#groupPageDiv").css("height","0px");
			groupShow=false;
		}
	});
	//로그아웃 버튼 색변화 이벤트
	$('.btnClass').hover(function(){
		$(event.target).addClass('btnClassHover')
	},function(){
		$(event.target).removeClass('btnClassHover')
	})
	//페이지 네이션 처리 이벤트
	var indexPrev = 1;
	$('.pageBtn').eq(indexPrev).addClass('clickUpClass');
	$('.pageView').eq(indexPrev).addClass('clickUpClass pageUpClass');
	$('#myPageContainer').css('height','760px');
	//console.log($('.pageView').eq(0).html())
	//console.log($('.pageView').eq(1).html())
	//console.log($('.pageView').eq(2).html())
	$(".pageBtn").on('click',function(){
		var index = $(event.target).index();
		if(index!=indexPrev){
			$('.pageBtn').eq(index).addClass('clickUpClass');
			$('.pageBtn').eq(indexPrev).removeClass('clickUpClass');
			$('.pageView').eq(index).addClass('clickUpClass pageUpClass');
			$('.pageView').eq(indexPrev).removeClass('clickUpClass pageUpClass');
			indexPrev = index;
		}
		if(indexPrev==0){
			$('#myPageContainer').css('height','760px');
			console.log(indexPrev)
		}else if(indexPrev==1){
			$('#myPageContainer').css('height','1300px');
			console.log(indexPrev)
		}else if(indexPrev==2){
			$('#myPageContainer').css('height','750px');
			console.log(indexPrev)
		}else{
			$('#myPageContainer').css('height','760px');
			console.log(indexPrev)
		}
	});
});
function logOut(){
	location.href='/member/logout';
}

</script>
<!-- 뒷 배경 -->
<div id='myPageBackground'></div>
<!-- 마이페이지 전체 컨트롤러 -->
<section id='myPageContainer'>
	<!-- 사이드 메뉴: 20% -->
	<nav id='sidePage'>
		<div>
			<div id="imgDiv">
				<img src='/img/${userData.profie_img }' id='View'/>
			</div>
			<br/>
			<span>${userData.user_id }</span><br/>
			<button id='logout' class='btnClass' onclick='logOut()'>로그아웃</button>
		</div>
		<div>
			<span>My Group</span>
			<br/>
			<img src='/img/groupShow.png' id="groupShow"/>
			<br/>
			<div id="groupPageDiv">
				<c:forEach items="${PTboardData}" var="item">
					<div class="groupPage">
						<div>
							<img src='/img/${item.pt_img_file }'/>
						</div>
						<span>${item.title }</span>
						<span>${item.content }</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</nav>
	<!-- 메인메뉴 : 80% -->
	<!-- 메인메뉴 : 전체 데이터는 다 이 페이지로 가져오고, 페이지 네이션은 include방식으로 -->
	<section id='mainPage'>
		<!-- 페이지 출력 -->
		<div style="position:absolute;">
			<button class='pageBtn inforBtn'>개인 정보</button>
			<button class='pageBtn healthBtn'>운동 관리</button>
			<button class='pageBtn foodBtn'>식단 관리</button>
			<button class='pageBtn writeBtn'>내글 관리</button>
			<div class='pageView'>
				<%@ include file="/WEB-INF/views/mypage/inforPage.jspf" %>
			</div>
			<div class='pageView'>
				<%@ include file="/WEB-INF/views/mypage/healthPage.jspf" %>
			</div>
			<div class='pageView'>
				<%@ include file="/WEB-INF/views/mypage/foodPage.jspf" %>
			</div>
			<div class='pageView'>
				<%@ include file="/WEB-INF/views/mypage/myWritePage.jspf" %>
			</div>
		</div>
	</section>
</section>