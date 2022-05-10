package com.team1.health.service;

import java.util.ArrayList;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;

public interface BoardService {
	public int boardInsert(BoardVO vo);
	public int totalRecord(PagingVO vo);
	public ArrayList<BoardVO> boardSelectAll(PagingVO vo);
	public BoardVO boardSelectByNo(int no);
	public ArrayList<BoardVO> boardSelectNotice(int limit);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(String userid, int no);
	
	// 그룹pt 글작성(board)
	public int ptBoardInsert(BoardVO vo);
	// 그룹pt 글작성
	public int ptGroupInsert(BoardVO vo);	
	// 그룹pt 글목록
	public ArrayList<BoardVO> ptList();
	// 그룹pt 뷰페이지 선택
	public BoardVO ptBoardSelect(int no);
	// 조회수 증가
	public int hitCount(int no);
	
	
	
}
