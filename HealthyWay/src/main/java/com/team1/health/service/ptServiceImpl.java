package com.team1.health.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.PtDAO;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;

@Service
public class ptServiceImpl implements ptService {
	@Inject
	PtDAO dao;
	
	@Override
	public int ptBoardInsert(BoardVO vo) {
		return dao.ptBoardInsert(vo);
	}
	@Override
	public int ptGroupInsert(BoardVO vo) {
		return dao.ptGroupInsert(vo);
	}
	@Override
	public ArrayList<BoardVO> ptList() {
		return dao.ptList();
	}
	@Override
	public BoardVO ptBoardSelect(int no) {
		return dao.ptBoardSelect(no);
	}
	@Override
	public int hitCount(int no) {		
		return dao.hitCount(no);
	}
	@Override
	public int ptDel(int no, String id) {
		return dao.ptDel(no, id);
	}
	@Override
	public int ptBoardUpdate(BoardVO vo) {
		return dao.ptBoardUpdate(vo);
	}
	@Override
	public int ptGroupUpdate(BoardVO vo) {
		return dao.ptGroupUpdate(vo);
	}
	@Override
	public MemberVO leaderSelect(int board_num) {
		return dao.leaderSelect(board_num);
	}

}
