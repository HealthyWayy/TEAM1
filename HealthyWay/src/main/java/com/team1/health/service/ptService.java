package com.team1.health.service;

import java.util.ArrayList;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;

public interface ptService {
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
	
	// 그룹pt 글삭제
	public int ptDel(int no, String id);
	
	// 그룹pt 글수정(DB - board)
	public int ptBoardUpdate(BoardVO vo);
		
	// 그룹pt 글수정(DB - PT_group)
	public int ptGroupUpdate(BoardVO vo);
	
	// 리더정보 선택
	public MemberVO leaderSelect(int board_num);
	
}
