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
	
	
	$(".pt_post_wrap").hover(function(){
		$(this).css("border", "1px solid gray");
	}, function(){
		$(this).css("border", "1px solid #bdbdbd");
	});
	
	
	
	
	
});