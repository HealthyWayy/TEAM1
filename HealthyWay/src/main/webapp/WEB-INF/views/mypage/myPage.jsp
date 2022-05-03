<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
body,ul,li{
	margin:0px;
	padding:0px;
	list-style:none;
}
#myPageBackground{
	background-color:rgb(226,224,250);
	width:100%;
	height:200px;
	z-index:-1;
}
#myPageContainer{
	position:relative;
	top:-160px;
	width:1200px;
	margin:0 auto;
	margin-top:50px;
}
#myPageContainer>section, #myPageContainer>nav{
	float:left;
	background-color:white;
	padding-top:30px;
}
#sidePage{
	width:20%;
	text-align:center;
	position:relative;
	/*탑 오른쪽 아래 왼쪽*/
	padding:0px 0px 0px 20px;
	box-sizing:border-box;
}
#sidePage>div:nth-of-type(1){
	height:340px;
}
#groupPageDiv{
	height:540px;
	overflow:auto;
	padding-bottom:20px;
	border:1px solid #ddd;
	border-radius:10px;
	transition-duration:1s;
}
#groupPageDiv:hover{
	transform: translate(0,-10px);
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
	width:90%;
	height:100px;
	overflow:hidden;
}
.groupPage>div>img{
	widhth:100%;
	height:100%;
}
#imgDiv{
	width:200px;
	height:200px;
	border-radius:100%;
	overflow:hidden;
	margin: 0 auto;
	border: 1px solid #ddd;
}
#imgDiv img{
	height:100%;
}
#sidePage>div>span{
	font-size:1.2em;
	font-weight:bold;
}
#logout{
	margin-top:20px;
	width:200px;
	height:30px;
	background-color:rgb(254,76,84);
	border-radius:15px;
	border:none;
	transition-duration:0.5s;
	border:1px solid #ddd;
}
#logout:hover{
	animation-duration: 0.5s;
	animation-name: slidein;
	animation-iteration-count: infinite;
	background-color:blue;
	transform: scale(1.1,1.1);
}
@keyframes slidein {
	0%{
		transform: scale(1.1,1.1);
	}
	50%{
		transform: scale(1.2,1.2);
	}
	100%{
		transform: scale(1.1,1.1);
	}
}
#mainPage{
	width:80%;
	height:500px;
}
#mainPage>div{
	float:left;
	width:100%;
}
#mainPage>div:nth-of-type(1){
	width:100%;
	/*탑 오른쪽 아래 왼쪽*/
	padding:0px 30px 40px 20px;
	box-sizing:border-box;
}
#myDataPart{
	width:100%;
	border:1px solid #ddd;
	border-radius:10px;
	height:250px;
	overflow:hidden;
}
#myDataPart>div{
	float:left;
	font-size:1.5em;
	box-sizing:border-box;
}
#myDataPart>div:nth-of-type(1){
	width:100%;
	/*탑 오른쪽 아래 왼쪽*/
	padding:15px 10px 0px 80px;
	box-sizing:border-box;
	height:25%;
}
#myDataPart>div:nth-of-type(n+2){
	/*탑 오른쪽 아래 왼쪽*/
	padding:25px 0px 0px 0px;
	width:25%;
	text-align:center;
	height:50%;
}
#myDataPart>div:nth-of-type(6){
	width:100%;
	padding:0px;
	height:25%;
	background-color:#ddd;
}
#myDataPart>div:nth-of-type(6) label{
	/*탑 오른쪽 아래 왼쪽*/
	padding:15px 0px 0px 0px;
	display:inline-block;
	width:32%;
	height:100%;
	cursor:pointer;
}
.pageBtn{
	background-color:#ddd;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	height:40px;
	position:relative;
	border:1px solid black;
	border-bottom:none;
}
.healthBtn{
	left:750px;
	z-index:1;
}
.foodBtn{
	left:720px;
	z-index:3;
}
.writeBtn{
	left:700px;
	z-index:2;
}
.clickUpClass{
	background-color:white;
	z-index:4;
}
.pageUpClass{
	display:block !important;
}
.pageView{
	position:absolute;
	/*탑 오른쪽 아래 왼쪽*/
	padding:30px 40px 0px 40px;
	box-sizing:border-box;
	width:100%;
	display:none;
}
#mainPage>div:nth-of-type(2):before{
	content:"";
	display:block;
	border-bottom:1px solid black;
	top:38px;
	left:20px;
	z-index:5;
	height  : 1px;
	width   : 95%;  /* or 100px */
	position:absolute;
}
#sidePage>div:nth-of-type(1):after{
	content : "";
	margin-top : 20px;
	margin-left : 10px; 
	display:block;
	height  : 1px;
	width   : 90%;  /* or 100px */
	border-bottom:1px solid #ddd;
}

</style>
<script>

$(()=> {
	//미리보기 이벤트
	$("#profileImg").on('change', function(){
    readURL();
    });
	
	//페이지 네이션 처리 이벤트
	var indexPrev = 1;
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
//미리보기 함수
function readURL() {
	//console.log(input)
	//console.log(event.target)
    if (event.target.files && event.target.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	//console.log(e)
        	$('#View').attr('src', e.target.result);
        }
        reader.readAsDataURL(event.target.files[0]);
    }
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
				<img src='/myPageImg/test.jpg' id='View'/>
			</div>
			<br/>
			<span>id</span><br/>
			<button id='logout'>로그아웃</button>
		</div>
		<div>
			<span>Group Page</span><br/><br/>
			<div id="groupPageDiv">
				
				<!-- 내가 가입한 그룹 -->
				<div class="groupPage">
					<div>
						<img src='/myPageImg/groupTest.jpg'/>
					</div>
					<span>그룹 내용</span>
				</div>
				<!-- 내가 가입한 그룹 -->
				<div class="groupPage">
					<div>
						<img src='/myPageImg/groupTest.jpg'/>
					</div>
					<span>그룹 내용</span>
				</div>
				<!-- 내가 가입한 그룹 -->
				<div class="groupPage">
					<div>
						<img src='/myPageImg/groupTest.jpg'/>
					</div>
					<span>그룹 내용</span>
				</div>
				
			</div>
		</div>
	</nav>
	<!-- 메인메뉴 : 80% -->
	<!-- 메인메뉴 : 전체 데이터는 다 이 페이지로 가져오고, 페이지 네이션은 include방식으로 -->
	<section id='mainPage'>
		<div>
			<!-- 간단한 개인 정보 출력 -->
			<div id='myDataPart'>
				<div>
					<span>체지방 3% 달성! 할 수 있다! 아자아자!</span>
				</div>
				<div>
					<span>185cm</span><br/>
					<span>height</span>
				</div>
				<div>
					<span>185cm</span><br/>
					<span>height</span>
				</div>
				<div>
					<span>185cm</span><br/>
					<span>height</span>
				</div>
				<div>
					<span>185cm</span><br/>
					<span>height</span>
				</div>
				<div>
					<input type='file' accept='image/*' id='profileImg' style='display:none;'/>
					<label for='profileImg'>프로필 변경</label>
					<input type='button' id='updateInfo' style='display:none;'/>
					<label for='updateInfo'>개인 정보 수정</label>
					<input type='button' id='deleteInfo' style='display:none;'/>
					<label for='deleteInfo'>회원 탈퇴</label>
				</div>
			</div>
		</div>
		<!-- 페이지 출력 -->
		<div style="position:relative;">
			<button class='pageBtn healthBtn'>운동 관리</button>
			<button class='pageBtn foodBtn'>식단 관리</button>
			<button class='pageBtn writeBtn'>내글 관리</button>
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