package com.team1.health.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.AdminDAO;
import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.MemberVO;
import com.team1.health.vo.PagingVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;





	//회원 관리-----------------------------------------
	@Override
	public List<MemberVO> memberList() {//회원 목록
		return dao.memberList();
	}
	@Override
	public int totalRecord(PagingVO pVO) {//totalRecord
		return dao.totalRecord(pVO);
	}
	@Override
	public int memberDelete(String user_id) {//회원 탈퇴
		return dao.memberDelete(user_id);
	}
	//운동 관리-----------------------------------------
	
	//레시피 관리-----------------------------------------
	
	@Override
	public String lastIngred() {//마지막 id값 구하기
		return null;
	}

	@Override
	public int ingredInsert(IngredientVO vo) {//재료 추가
		return 0;
	}

	@Override
	public int ingredDelete(String gred_num) {//재료 삭제
		return 0;
	}


	
	//pt그룹 관리-----------------------------------------
	
	//커뮤니티 관리-----------------------------------------
}
