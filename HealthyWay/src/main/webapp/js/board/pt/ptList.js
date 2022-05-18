$(function(){
	$("#recu_btn").hover(function(){
		$(this).css("color", "#000").css("background-color", "#fff").css("border", "1px solid #ddd");
	}, function(){
		$(this).css("color", "#fff").css("background-color", "#A18ACB").css("border", "1px solid #A18ACB");
	});
	
	$("#completed_btn").hover(function(){
		$(this).css("color", "#fff").css("background-color", "#A18ACB").css("border", "1px solid #A18ACB");
	}, function(){
		$(this).css("color", "#000").css("background-color", "#fff").css("border", "1px solid #ddd");
	});
	
	$("#write_btn").hover(function(){
		$(this).css("color", "#000").css("background-color", "#fff").css("border", "1px solid #ddd");
	}, function(){
		$(this).css("color", "#fff").css("background-color", "#A18ACB").css("border", "1px solid #A18ACB");
	});
	
	$("#recu_btn").click(function(){
		$(".모집완료").css("display", "none");
		$(".모집중").css("display", "block");
		$(".post_head").text("모집중인 PT그룹");
	});
	
	$("#completed_btn").click(function(){
		$(".모집중").css("display", "none");
		$(".모집완료").css("display", "block");
		$(".post_head").text("모집완료 PT그룹");
	});
	
	
	
	$(".pt_post_wrap").hover(function(){
		$(this).css("border", "1px solid #a9a9a9");
	}, function(){
		$(this).css("border", "1px solid #e9e9e9");
	});
	
	$("#searchBtn").click(function(){
		if($("#searchWord").val() == ''){
			alert("검색어를 입력하세요.");
			return false;
		}
		$("#searchFrm").submit();
	});
	
});