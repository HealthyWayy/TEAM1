package com.team1.health.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.MyPageDAO;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Inject
	MyPageDAO dao;

	@Override
	public MemberVO userData(String user) {
		return dao.userData(user);
	}

	@Override
	public List<BoardVO> PTboard(String user) {
		return dao.PTboard(user);
	}

	@Override
	public int userUpdate(MemberVO vo) {
		return dao.userUpdate(vo);
	}

	@Override
	public int userDelete(String user) {
		return dao.userDelete(user);
	}

	@Override
	public List<BoardVO> recipeHeart(String user) {
		return dao.recipeHeart(user);
	}

	@Override
	public BoardVO reciepeInfor(int board_num) {
		return dao.reciepeInfor(board_num);
	}

	@Override
	public int reciepeHeartDel(int board_num) {
		return dao.reciepeHeartDel(board_num);
	}
}
