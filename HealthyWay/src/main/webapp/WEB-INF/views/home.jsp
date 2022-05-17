<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/home.css" rel="stylesheet" type="text/css"/>
<script src="/js/home.js"></script>
<header class="nav-bar">
  <ul>
  	<li><a href="/">Logo</a></li>
  </ul>
  <ul>
  	<c:if test="${logStatus != 'Y' }">
  		<li><a href="/member/loginForm">Login</a></li>		
  	</c:if>
  	<c:if test="${logStatus == 'Y' }">
  		<li><div class="profile-container dropbtn2"></div></li>
	  	<li><a href="/member/logout">Logout</a></li>
  	</c:if>  
  </ul>
</header>
<!-- quick button -->
<div class="quick"><ul></ul></div>

<nav class="dropdown-content2">
	 <ul class="gnb">
	 	<li class="submenu2"><span>mypage1</span></li>
	 	<li class="submenu2"><span>mypage2</span></li>
	 	<li class="submenu2"><span>mypage3</span></li>
	 	<li class="submenu2"><span>mypage4</span></li>
	 </ul>
</nav>
<div class="container">
        <div class="box">
        	<div class="cover">
        		<div class="copywriteBox">
        			<div class="copywrite-first">
        				<span class="fade-in-box dFirst">color is beautiful</span><br/>
        				<span class="fade-in-box dSecond">color is beautiful</span><br/>
        				<span class="fade-in-box dThird">color is beautiful</span>
        			</div>
        			<div></div>
        		</div>
  			 	<section class="btn-container form-move-1">
				    <button class="blob-btn">
				        Start
				        <span class="blob-btn__inner">
				            <span class="blob-btn__blobs">
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				            </span>
				        </span>
				    </button>
				    <br />
				
				    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
				        <defs>
				            <filter id="goo">
				                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
				                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo">
				                </feColorMatrix>
				                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
				            </filter>
				        </defs>
				    </svg>
				</section>
        	</div>
        		<img alt="" src="/img/exercise01.jpg">
        </div>
        <div class="box">
        	<div class="cover">
        		<ul class="copywrite-second">
        			<li class="slideUp dFirst">Dream&nbsp;</li>
        			<li class="slideUp dSecond">comes&nbsp;</li>
        			<li class="slideUp dThird">true</li>
        		</ul>
				<section class="btn-container form-move-2">
				    <button class="blob-btn">
				        Start
				        <span class="blob-btn__inner">
				            <span class="blob-btn__blobs">
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				            </span>
				        </span>
				    </button>
				    <br />
				
				    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
				        <defs>
				            <filter id="goo">
				                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
				                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo">
				                </feColorMatrix>
				                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
				            </filter>
				        </defs>
				    </svg>
				</section>	
			</div>
        	<img  id="image-back" alt="" src="/img/exercise02.jpg">
        </div>
        <div class="box">
        	<div class="cover">
				<div class="copywrite-third">
					<div>
						<p class="slide-up dFirst">Hello there,</p>
					</div>
					<div>
						<p class="slide-up dSecond">this is just</p>
					</div>
					<div>
						<p class="slide-up dThird">a test.</p>
					</div>
				</div>
				<section class="btn-container form-move-3">
				    <button class="blob-btn">
				        Start
				        <span class="blob-btn__inner">
				            <span class="blob-btn__blobs">
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				            </span>
				        </span>
				    </button>
				    <br />
				
				    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
				        <defs>
				            <filter id="goo">
				                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
				                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo">
				                </feColorMatrix>
				                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
				            </filter>
				        </defs>
				    </svg>
				</section>
			</div>
        	<img alt="" src="/img/exercise03.jpg">
        </div>
        <div class="box">
	        <div class="cover">
				<p class="copywrite-fourth">
					<span class="blur-animation">It's</span>
					<span class="blur-animation">all</span>
					<span class="blur-animation">becoming</span>
					<span class="blur-animation">clear</span>
					<span class="blur-animation">to</span>
					<span class="blur-animation">me</span>
					<span class="blur-animation">now</span>
				</p>
				<section class="btn-container form-move-4">
				    <button class="blob-btn">
				        Start
				        <span class="blob-btn__inner">
				            <span class="blob-btn__blobs">
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				                <span class="blob-btn__blob"></span>
				            </span>
				        </span>
				    </button>
				    <br />
				
				    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
				        <defs>
				            <filter id="goo">
				                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
				                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo">
				                </feColorMatrix>
				                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
				            </filter>
				        </defs>
				    </svg>
				</section>
			</div>
	        <img alt="" src="/img/exercise04.jpg">
        </div>
</div>