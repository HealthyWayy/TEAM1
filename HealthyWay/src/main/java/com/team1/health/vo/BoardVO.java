package com.team1.health.vo;


public class BoardVO {
	//board 테이블
	private int board_num;
	private String user_id;
	private String title;
	private String content;
	private int hit;
	private String writedate;
	private String mod_date;
	private int type_num;
	
	//PT_group 테이블
	private String state;
	private String start_date;
	private String end_date;
	private int max_user;
	private int pt_count;
	private String pt_img_file;
	

	//recipe_board 좋아요 테이블
	private String recipe_img_file;
	private double total_kcal;
	


	

	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getMax_user() {
		return max_user;
	}
	public void setMax_user(int max_user) {
		this.max_user = max_user;
	}
	public int getPt_count() {
		return pt_count;
	}
	public void setPt_count(int pt_count) {
		this.pt_count = pt_count;
	}
	public String getPt_img_file() {
		return pt_img_file;
	}
	public void setPt_img_file(String pt_img_file) {
		this.pt_img_file = pt_img_file;
	}
	public String getRecipe_img_file() {
		return recipe_img_file;
	}
	public void setRecipe_img_file(String recipe_img_file) {
		this.recipe_img_file = recipe_img_file;
	}
	public double getTotal_kcal() {
		return total_kcal;
	}
	public void setTotal_kcal(double total_kcal) {
		this.total_kcal = total_kcal;
	}

}

