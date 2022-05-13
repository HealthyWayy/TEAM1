package com.team1.health.service;

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
	public BoardVO boardSelect(int board_num);
	//5
	public void hitCount(int board_num);
	//6
	public int boardUpdate(BoardVO vo);
	//7
	public int boardDelete(int board_num, String user_id);
	
	//8
	public BoardVO boardSelectByNo(int board_num);

	//9
	public BoardVO boardView(int board_num);
	
	
	
	
	
}