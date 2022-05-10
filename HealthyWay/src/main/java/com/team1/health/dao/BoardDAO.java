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
	
	public BoardVO boardSelect(int no);
	
	public void hitCount(int no);
	
	public int boardUpdate(BoardVO vo);
	
	public int boardDelete(int no, String userid);
}