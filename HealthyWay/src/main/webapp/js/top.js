$(function(){
	$('.dropbtn1').on('click', function(){	
		let p = $(this).offset();
	 	$('.dropdown-content1').css({
			'left':p.left-$('.dropdown-content1').width()*0.9,
			'top':p.top+20		
		});
		$('.dropdown-content1').toggleClass('display-show');
	});
	
	$('.submenu1').on('click',function(){
		if($('.submenu1').index(this)==0) {
			location.href="/mypage?indexPrev=0";
		}
		else if($('.submenu1').index(this)==1) {
			location.href="/mypage?indexPrev=1";
		}
		else if($('.submenu1').index(this)==2) {
			location.href="/mypage?indexPrev=2";
		}
		else if($('.submenu1').index(this)==3) {
			location.href="/mypage?indexPrev=3";
		}
		else {
			alert('잘못 입력되었습니다.');
		}
	});
	
});
