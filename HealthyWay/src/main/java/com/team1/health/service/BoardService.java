package com.team1.health.service;

import java.util.ArrayList;
import java.util.List;


import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;
import com.team1.health.vo.ReplyVO;
import com.team1.health.vo.SuccessPagingVO;
import com.team1.health.vo.SuggestionPagingVO;

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
	public ArrayList<BoardVO> boardSelectAll(PagingVO vo);
	
	public int hitCount(int no);
	//6
	public int boardUpdate(BoardVO vo);

	//7
	public int boardDelete(int board_num, String user_id);
	
	//8
	public BoardVO boardSelectByNo(int board_num);

	//9
	public BoardVO boardView(int board_num);
	
	//댓글 추가
		public int insertReply(ReplyVO vo);
		//댓글 삭제
		public int deleteReply(int reply_num);
		//댓글 수정
		public int updateReply(ReplyVO vo);
		//댓글 목록
		public List<ReplyVO> replyList(int board_num);

	//자유게시판
	
		public int suggestionInsert(BoardVO vo);
	
		public BoardVO suggestionSelect(int board_num);
		
		public List<BoardVO> suggestionList(SuggestionPagingVO spVO);
		
		public int suggestiontotalRecord(SuggestionPagingVO spVO);
		
		public int suggestionUpdate(BoardVO vo);
		
		public int suggestionDelete(String user_id, int board_num);
		
		public BoardVO suggestionSelectByNo(int board_num);
		
		public BoardVO suggestionView(int board_num);
	
		public ArrayList<BoardVO> suggestionSelectAll(SuggestionPagingVO vo);

		//성공스토리
		
		//achieve_story 글등록
		public int acheiveInsert(BoardVO vo);
		public int successUpdate(BoardVO vo);
		// 성공스토리 글수정(achieve_story)
		public int achieveUpdate(BoardVO vo);
		
		public int successDelete(int board_num, String user_id);
		public BoardVO successView(int board_num);
		public ArrayList<BoardVO> successList(SuccessPagingVO ssVO);
		public BoardVO successSelectByNo(int board_num);
		public int successtotalRecord(SuccessPagingVO ssVO);
}
