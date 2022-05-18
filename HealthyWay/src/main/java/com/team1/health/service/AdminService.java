package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.MemberVO;
import com.team1.health.vo.PagingVO;

public interface AdminService {

	//회원 관리-----------------------------------------
	
	//회원 목록
	public List<MemberVO> memberList();
	//totalRecord
	public int totalRecord(PagingVO pVO);
	//회원 삭제 
	public int memberDelete(String user_id);
	 
	//운동 관리-----------------------------------------
	
	
	
	//레시피 관리-----------------------------------------
	
	//마지막 id값
	public String lastIngred();
	//재료 DB 추가
	public int ingredInsert(IngredientVO vo);
	//재료 DB 삭제
	public int ingredDelete(String gred_num);
	
	
	//pt그룹 관리-----------------------------------------
	
	
	
	//커뮤니티 관리-----------------------------------------
	
	
}
