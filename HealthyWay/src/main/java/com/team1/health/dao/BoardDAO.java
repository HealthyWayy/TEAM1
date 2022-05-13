package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;



@Mapper
@Repository
public interface BoardDAO {
	
	public int boardInsert(BoardVO vo);
	
	public List<BoardVO> boardList(PagingVO pVO);
	
	public int totalRecord(PagingVO pVO);
	
	public BoardVO boardSelect(int board_num);
	
	public void hitCount(int board_num);
	
	public int boardUpdate(BoardVO vo);
	
	public int boardDelete(int board_num, String user_id);
	
	public BoardVO boardSelectByNo(int board_num);
	
	public BoardVO boardView(int board_num);
	
}