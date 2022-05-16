
package com.team1.health.service;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.team1.health.dao.BoardDAO;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;
import com.team1.health.vo.SuggestionPagingVO;


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
		return dao.boardList(pVO);
	}
	//5
	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}
	//6
	@Override
	public BoardVO boardSelect(int board_num) {
		return dao.boardSelect(board_num);
	}
	//7
	@Override
	public void hitCount(int board_num) {
		dao.hitCount(board_num);
	}
	//8
	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}
	//9
	@Override
	public int boardDelete(int board_num, String user_id) {
		return dao.boardDelete(board_num, user_id);
	}
	@Override
	public BoardVO boardSelectByNo(int board_num) {
		return dao.boardSelectByNo(board_num);
		
	}
	@Override
	public BoardVO boardView(int board_num) {
		return dao.boardView(board_num);
	}

	//자유게시판
	@Override
	public int suggestionInsert(BoardVO vo) {
		return dao.suggestionInsert(vo);
		
	}
	
	@Override
	public int suggestiontotalRecord(SuggestionPagingVO spVO) {
		return dao.SuggestiontotalRecord(spVO);
	}
	
	//4
	@Override
	public List<BoardVO> suggestionList(SuggestionPagingVO pVO) {
		return dao.suggestionList(pVO);
	}
	
	
	@Override
	public BoardVO suggestionSelect(int board_num) {
		return dao.suggestionSelect(board_num);
	}
	

	@Override
	public int suggestionUpdate(BoardVO vo) {
		return dao.suggestionUpdate(vo);
	}
	
	@Override
	public int suggestionDelete(int board_num, String user_id) {
		return dao.suggestionDelete(board_num, user_id);
	}
	@Override
	public BoardVO suggestionSelectByNo(int board_num) {
		return dao.suggestionSelectByNo(board_num);
		
	}
	@Override
	public BoardVO suggestionView(int board_num) {
		return dao.suggestionView(board_num);
	}

	
	
	
}

