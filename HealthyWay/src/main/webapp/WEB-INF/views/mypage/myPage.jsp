<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
body,ul,li{
	margin:0px;
	padding:0px;
	list-style:none;
}
body{
	background-color:rgb(236,236,236);
}
#myPageBackground{
	background-image:url(/myPageImg/myPageBackground.jpg);
	background-repeat:no-repeat;
	background-size:100%;
	width:100%;
	height:250px;
}
#myPageBackground::after{
	font-weight: bold;
	position:absolute;
	top:10%;
	left:50%;
	transform:translate(-50%,0%);
	text-align:center;
	content:'myPage';
	width:100%;
	overflow:hidden;
	height:100px;
	line-height:100px;
	font-size:3em;
	white-space:nowrap;
	animation-duration: 1s;
	animation-name: textShow;  
    animation-timing-function: ease-in-out;
    background: linear-gradient(
    		to right,
            rgba(181, 179, 217, 1) 0%,
            rgb(164,162,208) 20%,
            rgba(117, 114, 184, 1) 100%
            );
    -webkit-background-clip: text;
     color: transparent;
    -webkit-text-stroke:1px black;
}
@keyframes textShow{
	0%{
		opacity:0;
	}
	100%{
		opacity:1;
	}
}
#myPageContainer{
	position:relative;
	top:0px;
	width:1200px;
	margin:0 auto;
}
#myPageContainer>section, #myPageContainer>nav{
	float:left;
	background-color:white;
}
#sidePage{
	width:20%;
	text-align:center;
	position:relative;
	top:-50px;
	left:-30px;
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
	position:relative;
	width:80%;
	z-index:0;
}
#mainPage>div{
	float:left;
	width:100%;
}
#mainPage>div:nth-of-type(1){
	width:100%;
	/*탑 오른쪽 아래 왼쪽*/
	padding:0px 30px 40px 0px;
	box-sizing:border-box;
}
.pageBtn{
	background-color:rgb(240,240,240);
	height:40px;
	position:absolute;
	border:none;
	border-bottom:none;
	top:-20px;
	width:80px;
}
.inforBtn{
	left:610px;
	z-index:4;
}
.healthBtn{
	left:690px;
	z-index:3;
}
.foodBtn{
	left:770px;
	z-index:2;
}
.writeBtn{
	left:850px;
	z-index:1;
}
.clickUpClass{
	background-color:white;
	z-index:5;
	border:none;
}
.pageUpClass{
	display:block !important;
}
.pageView{
	position:relative;
	/*탑 오른쪽 아래 왼쪽*/
	margin:20px 0px 0px 0px;
	margin-bottom:30px;
	padding:40px 40px 0px 40px;
	box-sizing:border-box;
	width:100%;
	display:none;
	box-shadow:0px 15px 10px 5px rgb(196,196,196);
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
#groupShow{
	margin:10px 0 10px 0;
	width:10%;
	cursor:pointer;
}
#groupShow {
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
	var indexPrev = 2;
	$('.pageBtn').eq(indexPrev).addClass('clickUpClass');
	$('.pageView').eq(indexPrev).addClass('clickUpClass pageUpClass');
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
	});
});

</script>	
<!-- 뒷 배경 -->
<div id='myPageBackground'></div>
<!-- 마이페이지 전체 컨트롤러 -->
<section id='myPageContainer'>
	<!-- 사이드 메뉴: 20% -->
	<nav id='sidePage'>
		<div>
			<div id="imgDiv">
				<img src='/myPageImg/${userData.profie_img }' id='View'/>
			</div>
			<br/>
			<span>${userData.user_id }</span><br/>
			<button id='logout' class='btnClass'>로그아웃</button>
		</div>
		<div>
			<span>Group Page</span>
			<br/>
			<img src='/myPageImg/groupShow.png' id="groupShow"/>
			<br/>
			<div id="groupPageDiv">
				<c:forEach items="${PTboardData}" var="item">
					<div class="groupPage">
						<div>
							<img src='/myPageImg/${item.pt_img_file }'/>
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