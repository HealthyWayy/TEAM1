package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.MemberVO;
import com.team1.health.vo.PagingVO;
import com.team1.health.vo.ReportVO;
import com.team1.health.vo.ReportVO;
import com.team1.health.vo.TrainVO;

public interface AdminService {

	//회원 관리-----------------------------------------
	
	//회원 목록
	public List<MemberVO> memberList(PagingVO pVO);
	//totalRecord
	public int totalRecord1(PagingVO pVO);
	//회원 삭제 
	public int memberDelete(String user_id);
	 
	
	
	//레시피 관리-----------------------------------------
	
	//마지막 id값
	public String lastIngred();
	//재료 DB 추가
	public int ingredInsert(IngredientVO vo);
	//재료 DB 삭제
	public int ingredDelete(String gred_num);
	
	
	//pt그룹 관리-----------------------------------------
	//그룹 목록
	public List<BoardVO> ptList(PagingVO pVO);
	// totalRecord
	public int totalRecord2(PagingVO pVO);

	//board 관련 공통 코드--------------------------------------------
	// boardDelete
	public int boardDelete(int gred_num);

	
	//커뮤니티 관리-----------------------------------------
	
	
	//신고 관리--------------------------------------------
	//신고 목록
	public List<ReportVO> reportList(PagingVO pVO);
	//totalRecord
	public int totalRecord4(PagingVO pVO);
	//신고 삭제
	public int reportDelete(int report_num);
	// 신고 등록
	public int reportInsert(ReportVO vo);
	// 회원 신고 누적
	public int userReportCount(String user_id);
}
