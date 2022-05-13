package com.team1.health.controller;


import java.util.HashMap;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.team1.health.vo.PagingVO;
import com.team1.health.vo.BoardVO;
import com.team1.health.service.MemberService;
import com.team1.health.service.BoardService;


@RestController 

public class BoardController {
	
	@Inject 
	BoardService service;
	
	@Inject
	MemberService memberService;
	
	//건의할래요 뷰 1
		@GetMapping("boardList")
		public ModelAndView boardList(@RequestParam(value="pageNum",required = false, defaultValue = "1")int pageNum, @RequestParam(value="pageCount",required = false, defaultValue = "5")int pageCount, @RequestParam(value="searchWord",required = false, defaultValue = "")String searchWord){
			ModelAndView mav = new ModelAndView();
			
			
			PagingVO pvo = new PagingVO();
	        //검색어가 있을 경우
	        if(!searchWord.equals("")) 
	        	pvo.setSearchWord(searchWord);
	        //전체 게시글 업데이트
	        pvo.setOnePageRecord(pageCount);
	        pvo.setTotalRecord(service.totalRecord(pvo));
	        pvo.setPageNum(pageNum);
	        
			//총 페이지 수
	        pvo.setTotalRecord(service.totalRecord(pvo));
			
			//DB연결
			mav.addObject("boardList", service.boardList(pvo));
			
			//페이지 정보
			mav.addObject("pvo", pvo);
			
			mav.setViewName("board/boardList"); 
			return mav;
		}
	
	
	
	
	//공지사항 등록 뷰 2
	@GetMapping("boardWrite")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();
		
		
		
		mav.setViewName("board/boardWrite");
		return mav;
	
	
	}
	
	
	
	
	
	//공지사항 게시글 생성 요청 3
	@PostMapping("/boardWrite")
	public ResponseEntity<String> boardWrite(BoardVO vo, HttpServletRequest request){
		System.out.println("wirte start");
		 
		vo.setUser_id((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity = null;
		MultiValueMap<String, String> header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			service.boardInsert(vo);
			String msg = "<script>";
				   msg += "alert('등록이 성공했습니다');";
				   msg += "location.href='/boardList';";
				   msg += "</script>";
				   
			System.out.println("write");
			entity = new ResponseEntity<String>(msg, header, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>";
				   msg += "alert('등록이 실패하였습니다');";
				   msg += "history.back();";
				   msg += "</script>";
			entity = new ResponseEntity<String>(msg, header, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//공지 삭제요청 3
	@DeleteMapping("/board/boardList")
	
    public ResponseEntity<HashMap<String,String>> suggestionDelete(BoardVO vo, HttpServletRequest request, HttpSession session){
    	ResponseEntity<HashMap<String,String>> entity = null;
    	HashMap<String,String> result = new HashMap<String,String>();
    	String user_id = (String)session.getAttribute("logId");
    	System.out.println("delete");
    	
    	try {
    		BoardVO bvo = service.boardSelectByNo(vo.getBoard_num());
    		//작성자가 다를 경우
    		if(bvo.getUser_id().equals(user_id)== false) {
    			result.put("status", "200");
    			result.put("msg", "잘못된 접근입니다");
    			result.put("redirect", "/boardList");
    			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
    		}
    		else {
    			service.boardDelete(vo.getBoard_num(), vo.getUser_id());
    			result.put("status", "200");
    			result.put("msg", "글 삭제 완료.");
    			result.put("redirect", "/boardList");
    			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
    		}
    	}catch(Exception e) {
    		//삭제할 게시글이 존재하지 않을 경우 4
    		
    		e.printStackTrace();
    		result.put("status", "400");
    		result.put("msg", "글 삭제요청 에러");
    		result.put("redirect", "/boardList");
    		entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.BAD_REQUEST);	
    	}
    	return entity;
    }
		//공지사항 상세보기 5 
	@GetMapping("/board/boardList/{board_num}")
    public ModelAndView suggestionInfoView(@PathVariable(value="board_num")int board_num) {
    	ModelAndView mav  = new ModelAndView();
    	System.out.println("출력");
    	try {
    		BoardVO bvo = service.boardSelectByNo(board_num);
    		if(bvo != null) {
    			mav.addObject("bvo",bvo);
    			mav.setViewName("board/boardView");
    		}
    		else {
    			//게시물이 존재 하지 않을 경우
    			System.out.println("존재하지 않는 게시물");
    			mav.setViewName("redirect:/board/boardList");
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    		mav.setViewName("redirect:/board/boardList");
    	}
    	return mav;
    }

		//수정 뷰 7
	    @PostMapping("board/boardList/edit/{board_num}")
	    public ModelAndView suggestionEditView(@PathVariable(value="board_num")int board_num, HttpSession session) {
	    	ModelAndView mav = new ModelAndView();
	    	try {
		    	String user_id = (String)session.getAttribute("logId"); 
		    	BoardVO bvo = service.boardSelectByNo(board_num);
		    	//작성자 본인 확인
		    	if(user_id != null && bvo.getUser_id().equals(user_id) == true){
		    		mav.setViewName("board/boardEdit");
		    		mav.addObject("bvo",service.boardSelectByNo(board_num));
		    	}
		    	else {
		    		
		    		mav.setViewName("redirect:/boardList");
		    	}
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    		mav.setViewName("redirect:/boardList");
	    	}
	    	return mav;
	    }  
		
	    
	    
	    // 수정하기 요청 8
	    @PutMapping("/board/boardList")
	    public ResponseEntity<HashMap<String,String>> boardUpdate(BoardVO bvo, HttpServletRequest request, HttpSession session){
	    	ResponseEntity<HashMap<String,String>> entity = null;
	    	HashMap<String,String> result = new HashMap<String,String>();
	    	String user_id = (String)session.getAttribute("logId");
	    	
	    	try { 	
	    		if(service.boardSelectByNo(bvo.getBoard_num()) == null) {
	    			//수정할 게시글이 존재하지 않는 경우
	    			result.put("status", "200");
	    			result.put("msg", "존재하지 않는 게시물 입니다.");
	    			result.put("redirect", "/boardList");
	    			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	    		}
	    		//작성자가 다른경우
	    		if(bvo.getUser_id().equals(user_id)== false) {
	    			result.put("status", "200");
	    			result.put("msg", "잘못된 접근입니다");
	    			result.put("redirect", "/boardList");
	    			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	    		}
	    		else {
	    		
	    			service.boardUpdate(bvo);
	    			result.put("status", "200");
	    			result.put("msg", "글 수정 완료.");
	    			result.put("redirect", "/boardList");
	    			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	    		}
	    	}catch(Exception e) {
	    		result.put("status", "400");
	    		result.put("msg", "글 수정 요청 Error...");
	    		result.put("redirect", "/boardList");
	    		entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.BAD_REQUEST);	
	    	}
	    	
	    	
	    	return entity;
	    }
		
}