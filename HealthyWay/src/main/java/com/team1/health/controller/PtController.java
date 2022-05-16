package com.team1.health.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.BoardService;
import com.team1.health.service.PtService;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;

@RestController
@RequestMapping("/board/*")
public class PtController {
	@Inject
	PtService service;
	
	
	// pt 글 리스트
	@GetMapping("ptList")
	public ModelAndView ptList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("ptList", service.ptList());
		mav.setViewName("board/pt/ptList");
		return mav;
	}
	
	// pt 글등록 폼으로 이동
	@GetMapping("ptWrite")
	public ModelAndView ptWrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/pt/ptWrite");
		
		return mav;
	}
	
	// pt 글등록(DB)
	@PostMapping("ptWriteOk")
	public ResponseEntity<String> ptWriteOk(BoardVO vo, HttpServletRequest request){
		vo.setUser_id((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity = null; 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			service.ptBoardInsert(vo);
			service.ptGroupInsert(vo);
			String msg = "<script>alert('글이 등록되었습니다.');location.href='/board/ptList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글등록이 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// pt 글보기로 이동
	@GetMapping("ptView")
	public ModelAndView ptView(int board_num) {
		ModelAndView mav = new ModelAndView();
		
		// 조회수 증가
		service.hitCount(board_num);
		
		mav.addObject("vo", service.ptBoardSelect(board_num));
		mav.setViewName("board/pt/ptView");
		
		return mav;
	}

}
