package com.team1.health.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.BoardDAO;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;

//1
@Service
public class BoardServiceImpl implements BoardService {
	//2
	@Inject
	BoardDAO dao;
	//3
	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}
	//4
	@Override
	public List<BoardVO> boardList(PagingVO pVO) {
		System.out.println("dao : " + dao.boardList(pVO).get(0).getBoard_num());
		return dao.boardList(pVO);
	}
	//5
	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}
	//6
	@Override
	public BoardVO boardSelect(int no) {
		return dao.boardSelect(no);
	}
	//7
	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
	}
	//8
	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}
	//9
	@Override
	public int boardDelete(int no, String userid) {
		return dao.boardDelete(no, userid);
	}

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
	public int boardDelete(String userid, int no) {
		return dao.boardDelete(no, userid);
	}


}
