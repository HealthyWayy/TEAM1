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
	
}
