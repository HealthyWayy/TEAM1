package com.team1.health.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.BoardService;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;

@RestController 
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService service;
	
	@GetMapping("board/boardList")
	public ModelAndView boardList(PagingVO pVO){
		ModelAndView mav = new ModelAndView();
		
		
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		mav.addObject("list", service.boardList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("board/boardList"); 
		return mav;
	}
	
	@GetMapping("boardWrite")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardWrite");
		return mav;
	}
	
	@PostMapping("boardWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request){
		 
		
		vo.setUser_id((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity = null; 
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			service.boardInsert(vo);
			String msg = "<script>";
				   msg += "alert('성공');";
				   msg += "location.href='/myapp/board/boardList';";
				   msg += "</script>";
			entity = new ResponseEntity<String>(msg, header, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>";
				   msg += "alert('실패');";
				   msg += "history.back();";
				   msg += "</script>";
			entity = new ResponseEntity<String>(msg, header, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@GetMapping("boardView")
	public ModelAndView boardView(int no){
		ModelAndView mav = new ModelAndView();
		
		service.hitCount(no);
		
		mav.addObject("vo", service.boardSelect(no));
		mav.setViewName("board/boardView");
		return mav;
	}
	
	
	@GetMapping("boardEdit")
	public ModelAndView boardEdit(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.boardSelect(no));
		mav.setViewName("board/boardEdit");
		
		return mav;
	}
	
	
	@PostMapping("boardEditOk")
	public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		vo.setUser_id((String)session.getAttribute("logId"));
		try {
			int result = service.boardUpdate(vo);
			if(result>0) {
				entity = new ResponseEntity<String>(getEditSuccessMessage(vo.getBoard_num()), headers, HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@GetMapping("boardDel")
	public ModelAndView boardDel(int no, HttpSession session){
		String userid = (String)session.getAttribute("logId");
		
		int result = service.boardDelete(no, userid);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:boardList");
		}else {
			mav.addObject("no", no);
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}

	
	public String getEditFailMessage() {
		String msg = "<script>";
			   msg += "alert('등록이 실패했습니다.');";
			   msg += "history.back();";
			   msg += "</script>";
		return msg;
	}
	public String getEditSuccessMessage(int no) {
		String msg = "<script>";
			   msg += "alert('등록이 성공했습니다.');";
			   msg += "location.href='/myapp/board/boardView?no="+no+"';";
			   msg += "</script>";
		return msg;
	}
}