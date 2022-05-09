package com.team1.health.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.BoardDAO;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}
	@Override
	public BoardVO boardSelectByNo(int no) {
		return dao.boardSelectByNo(no);
	}

	@Override
	public ArrayList<BoardVO> boardSelectNotice(int limit) {
		return dao.boardSelectNotice(limit);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}

	@Override
	public int boardDelete(String userid, int no) {
		return dao.boardDelete(userid, no);
	}


	@Override
	public int totalRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> boardSelectAll(PagingVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
