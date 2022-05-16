package com.team1.health.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.PtService;
import com.team1.health.vo.BoardVO;

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
	public int ptWriteOk(BoardVO vo, HttpServletRequest request, MultipartHttpServletRequest mr){
		// 파일 업로드
		mr = (MultipartHttpServletRequest) request;
		MultipartFile file = mr.getFile("file");
		System.out.println(file);
		
		String path = request.getSession().getServletContext().getRealPath("/ptImg");
	
		// 파일명 중복되지 않게 처리
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString()+"_"+file.getOriginalFilename();
		vo.setPt_img_file(filename);
		File uploadFile = new File(path, filename);
		
		// 파일 업로드		
		try {
			file.transferTo(uploadFile);
			System.out.println("성공");

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("실패!");
		}

		vo.setUser_id((String)request.getSession().getAttribute("logId"));
		service.ptBoardInsert(vo);
		int result = service.ptGroupInsert(vo);
		
		return result;
	}
	
	// pt 글보기로 이동
	@GetMapping("ptView")
	public ModelAndView ptView(int board_num) {
		ModelAndView mav = new ModelAndView();
		
		// 조회수 증가
		service.hitCount(board_num);
		
		mav.addObject("lVO", service.leaderSelect(board_num));
		mav.addObject("vo", service.ptBoardSelect(board_num));
		mav.setViewName("board/pt/ptView");
		
		return mav;
	}
	
	// pt글수정 폼으로 이동
	@GetMapping("ptEdit")
	public ModelAndView ptEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.ptBoardSelect(board_num));
		mav.setViewName("board/pt/ptEdit");
		return mav;
	}
	
	// pt글수정(DB)
	@PostMapping("ptEditOk")
	public int ptEditOk(BoardVO vo, HttpServletRequest request, MultipartHttpServletRequest mr) {
		vo.setUser_id((String) request.getSession().getAttribute("logId"));
		
//		// 파일 업로드
//		mr = (MultipartHttpServletRequest) request;
//		MultipartFile file = mr.getFile("file");
//		System.out.println(file);
//				
//		String path = request.getSession().getServletContext().getRealPath("/ptImg");
//			
//		// 파일명 중복되지 않게 처리
//		UUID uuid = UUID.randomUUID();
//		String filename = uuid.toString()+"_"+file.getOriginalFilename();
//		vo.setPt_img_file(filename);
//		File uploadFile = new File(path, filename);
//				
//		// 파일 업로드		
//		try {
//			file.transferTo(uploadFile);
//			System.out.println("성공");
//
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("실패!");
//		}
		
		service.ptBoardUpdate(vo);
		int result = service.ptGroupUpdate(vo);
		
		return result;
	}
	
	// pt글삭제(DB)
	@GetMapping("ptDel")
	public ResponseEntity<String> ptDel(int board_num, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		String id = (String) session.getAttribute("logId");
		int result = service.ptDel(board_num, id);
		
		try {
			if(result > 0) {
				String msg = "<script>alert('삭제가 완료되었습니다.'); location.href='/board/ptList';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글삭제를 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
=======

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
