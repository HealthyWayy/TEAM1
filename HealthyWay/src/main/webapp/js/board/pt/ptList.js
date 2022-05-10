$(function(){
	$("#recu_btn").hover(function(){
		$(this).css("color", "#000").css("background-color", "#fff");
	}, function(){
		$(this).css("color", "#fff").css("background-color", "#000");
	});
	
	$("#completed_btn").hover(function(){
		$(this).css("color", "#fff").css("background-color", "#000");
	}, function(){
		$(this).css("color", "#000").css("background-color", "#fff");
	});
	
	$("#write_btn").hover(function(){
		$(this).css("color", "#000").css("background-color", "#fff");
	}, function(){
		$(this).css("color", "#fff").css("background-color", "#000");
	});
	
	$("#recu_btn").click(function(){
		$(".pt_post_wrap").css("display", "none");
		$(".모집중").css("display", "block");
		$(".post_head").text("모집중인 PT그룹");
	});
	
	$("#completed_btn").click(function(){
		$(".pt_post_wrap").css("display", "none");
		$(".모집완료").css("display", "block");
		$(".post_head").text("모집완료 PT그룹");
	});
	
	
	
	$(".pt_post_wrap").hover(function(){
		$(this).css("border", "1px solid gray");
	}, function(){
		$(this).css("border", "1px solid #bdbdbd");
	});
	
	$("#searchBtn").click(function(){
		if($("#searchWord").val() == ''){
			alert("검색어를 입력하세요.");
			return false;
		}
		$("#searchFrm").submit();
	});
	
	
});