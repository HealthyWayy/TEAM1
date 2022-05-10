package com.team1.health.service;

import java.util.ArrayList;
import java.util.List;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;

public interface BoardService {
	//1
	public int boardInsert(BoardVO vo);
	//2
	public List<BoardVO> boardList(PagingVO pVO);
	//3
	public int totalRecord(PagingVO pVO);
	//4
	public BoardVO boardSelect(int no);
	//5
	public void hitCount(int no);
	//6
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

	public int boardDelete(int no, String userid);
}

