package com.team1.health.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.health.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class PtController {
	
	// pt 글 리스트로 이동
	@GetMapping("ptList")
	public String ptList() {
		return "board/pt/ptList";
	}
	
	// pt 글등록 폼으로 이동
	@GetMapping("ptWrite")
	public String ptWrite() {
		return "board/pt/ptWrite";
	}
	
	// pt 글보기로 이동
	@GetMapping("ptView")
	public String ptView() {
		return "board/pt/ptView";
	}
	
//	// pt 글등록(DB)
//	@PostMapping("ptWriteOk")
//	public ResponseEntity<String> ptWriteOk(BoardVO vo, HttpServletRequest request){
//		
//		ResponseEntity<String> entity = null; 
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-Type", "text/html; charset=utf-8");
//		
//	}

}
