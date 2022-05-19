package com.team1.health.controller;


import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.team1.health.vo.PagingVO;
import com.team1.health.vo.ReplyVO;
import com.team1.health.vo.SuccessPagingVO;
import com.team1.health.vo.SuggestionPagingVO;
import com.team1.health.vo.BoardVO;
import com.team1.health.service.MemberService;
import com.team1.health.service.ReplyService;
import com.team1.health.service.BoardService;


@RestController 

public class BoardController {
	
	@Inject 
	BoardService service;
	
	@Inject
	MemberService memberService;
	
	@Inject
	ReplyService replyService;
	
	//공지사항 뷰 1
		@GetMapping("boardList")
		public ModelAndView boardList(@RequestParam(value="pageNum",required = false, defaultValue = "1")int pageNum, @RequestParam(value="pageCount",required = false, defaultValue = "10")int pageCount, @RequestParam(value="searchWord",required = false, defaultValue = "")String searchWord){
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
		vo.setType_num(4);
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
	@DeleteMapping("/boardList")
	public ResponseEntity<HashMap<String,String>> boardDelete(int board_num, HttpServletRequest request, HttpSession session){
		ResponseEntity<HashMap<String,String>> entity = null;
		HashMap<String,String> result = new HashMap<String,String>();
		String user_id = (String)session.getAttribute("logId");
		
		try {
			BoardVO bvo = service.boardSelectByNo(board_num);
			//작성자가 다른경우
			if(bvo.getUser_id().equals(user_id)== false) {
				result.put("status", "200");
				result.put("msg", "잘못된 접근입니다");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
			}
			else {
				service.boardDelete(bvo.getBoard_num(), bvo.getUser_id());
				result.put("status", "200");
				result.put("msg", "글 삭제 완료.");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
			}
		}catch(Exception e) {
			//삭제할 게시글이 존재하지 않을 경우
			//user_id가 null일 경우 
			e.printStackTrace();
			result.put("status", "400");
			result.put("msg", "글 삭제 요청 Error...");
			result.put("redirect", "/boardList");
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.BAD_REQUEST);	
		}
		return entity;
	}
		//공지사항 상세보기 5 
	@GetMapping("board/boardList/{board_num}")
	 public ModelAndView boardInfoView(@PathVariable(value="board_num")int board_num) {
		ModelAndView mav = new ModelAndView();
		
		service.hitCount(board_num);
		
		mav.addObject("bvo", service.boardSelect(board_num));
		mav.setViewName("board/boardView");
		return mav;
	}

		//수정 뷰 7
	    @PostMapping("/board/boardList/edit/{board_num}")
	    public ModelAndView boardEditView(@PathVariable(value="board_num")int board_num, HttpSession session) {
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
	  //댓글 등록
		@PostMapping("/reply/insertBoardReply")
		@ResponseBody
		public String insertReply(ReplyVO vo, HttpSession session) {
			String user_id = (String)session.getAttribute("logId");
			vo.setUser_id(user_id);
			service.insertReply(vo);
			return "/boardList/view?board_num="+vo.getBoard_num();
		}
		//댓글 삭제
		@PostMapping("/reply/deleteBoardReply")
		@ResponseBody
		public int deleteReply(int reply_num) {
			return service.deleteReply(reply_num);
		}
		//댓글 수정
		@PostMapping("/reply/updateBoardReply")
		@ResponseBody
		public int updateReply(ReplyVO vo) {
			return service.updateReply(vo);
		}
		//댓글 목록
		@PostMapping("/reply/replyBoardList")
		@ResponseBody
		public List<ReplyVO> replyList(int board_num){
			return service.replyList(board_num);
		}
	    
	    
	    
		    
//자유게시판 9
	    @GetMapping("board/suggestionList")
		public ModelAndView suggestionList(@RequestParam(value="pageNum",required = false, defaultValue = "1")int pageNum, @RequestParam(value="pageCount",required = false, defaultValue = "10")int pageCount, @RequestParam(value="searchWord",required = false, defaultValue = "")String searchWord){
			ModelAndView mav = new ModelAndView();
			
			
			SuggestionPagingVO spvo = new SuggestionPagingVO();
	        //검색어가 있을 경우
	        if(!searchWord.equals("")) 
	        	spvo.setSearchWord(searchWord);
	        //전체 게시글 업데이트
	        spvo.setOnePageRecord(pageCount);
	        spvo.setSuggestionTotalRecord(service.suggestiontotalRecord(spvo));
	        spvo.setPageNum(pageNum);
	        
			//총 페이지 수
	        spvo.setSuggestionTotalRecord(service.suggestiontotalRecord(spvo));
			
			//DB연결
			mav.addObject("suggestionList", service.suggestionList(spvo));
			
			//페이지 정보
			mav.addObject("spvo", spvo);
			
			mav.setViewName("board/suggestionList"); 
			return mav;
		}

//자유게시판 상세 뷰 10

	@GetMapping("/board/suggestionList/{board_num}")
  public ModelAndView suggestionInfoView(@PathVariable(value="board_num")int board_num) {
  	ModelAndView mav  = new ModelAndView();
  	System.out.println("출력");
  	try {
  		BoardVO bvo = service.suggestionSelectByNo(board_num);
  		if(bvo != null) {
  			mav.addObject("bvo",bvo);
  			mav.setViewName("board/suggestionView");
  		}
  		else {
  			//게시물이 존재 하지 않을 경우
  			System.out.println("존재하지 않는 게시물");
  			mav.setViewName("redirect:/board/suggestionList");
  		}
  		
  	}catch(Exception e) {
  		e.printStackTrace();
  		mav.setViewName("redirect:/board/suggestionList");
  	}
  	return mav;
  	
  }
	
	//자유게시판 생성 뷰
		@GetMapping("suggestionWrite")
		public ModelAndView suggestionWrite() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("board/suggestionWrite");
			return mav;
		
		
		}
	
	//자유게시판 게시글 생성 요청 11
		@PostMapping("/suggestionWrite")
		public ResponseEntity<String> suggestionWrite(BoardVO vo, HttpServletRequest request){
			System.out.println("자유글 게시");
			 
			vo.setUser_id((String)request.getSession().getAttribute("logId"));
			ResponseEntity<String> entity = null;
			MultiValueMap<String, String> header = new HttpHeaders();
			header.add("Content-Type", "text/html; charset=utf-8");
			
			try {
				service.boardInsert(vo);
				String msg = "<script>";
					   msg += "alert('등록이 성공했습니다');";
					   msg += "location.href='/board/suggestionList';";
					   msg += "</script>";
					   
				System.out.println("글쓰기");
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
//자유게시판 수정 뷰 12
@PostMapping("/board/suggestionList/edit/{board_num}")
public ModelAndView suggestionEditView(@PathVariable(value="board_num")int board_num, HttpSession session) {
	ModelAndView mav = new ModelAndView();
	try {
    	String user_id = (String)session.getAttribute("logId"); 
    	BoardVO bvo = service.suggestionSelectByNo(board_num);
    	//작성자 본인 확인
    	if(user_id != null && bvo.getUser_id().equals(user_id) == true){
    		mav.setViewName("board/suggestionEdit");
    		mav.addObject("bvo",service.suggestionSelectByNo(board_num));
    	}
    	else {
    		mav.setViewName("redirect:/board/suggestionList");
    	}
	}catch(Exception e) {
		e.printStackTrace();
		mav.setViewName("redirect:/board/suggestionList");
	}
	return mav;
}  

//13 자유게시판 수정 요청
@PutMapping("/board/suggestionList")
public ResponseEntity<HashMap<String,String>> suggestionUpdate(BoardVO bvo, HttpServletRequest request, HttpSession session){
	ResponseEntity<HashMap<String,String>> entity = null;
	HashMap<String,String> result = new HashMap<String,String>();
	String user_id = (String)session.getAttribute("logId");
	
	try { 	
		if(service.suggestionSelectByNo(bvo.getBoard_num()) == null) {
			//수정할 게시글이 존재하지 않는 경우
			result.put("status", "200");
			result.put("msg", "존재하지 않는 게시물 입니다.");
			result.put("redirect", "/board/suggestionList");
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
		}
		//작성자가 다른경우
		if(bvo.getUser_id().equals(user_id)== false) {
			result.put("status", "200");
			result.put("msg", "잘못된 접근입니다");
			result.put("redirect", "/board/suggestionList");
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
		}
		else {
			
			service.suggestionUpdate(bvo);
			result.put("status", "200");
			result.put("msg", "글 수정 완료.");
			result.put("redirect", "/board/suggestionList/"+bvo.getBoard_num());
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
		}
	}catch(Exception e) {
		result.put("status", "400");
		result.put("msg", "글 수정 요청 Error...");
		result.put("redirect", "/board/suggestionList");
		entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.BAD_REQUEST);	
	}
	
	
	return entity;
}

//자유게시판 삭제 14
@DeleteMapping("/board/suggestionList")
public ResponseEntity<HashMap<String,String>> suggestionDelete(int board_num, HttpServletRequest request, HttpSession session){
	ResponseEntity<HashMap<String,String>> entity = null;
	HashMap<String,String> result = new HashMap<String,String>();
	String user_id = (String)session.getAttribute("logId");
	
	try {
		BoardVO bvo = service.suggestionSelectByNo(board_num);
		//작성자가 다른경우
		if(bvo.getUser_id().equals(user_id)== false) {
			result.put("status", "200");
			result.put("msg", "잘못된 접근입니다");
			result.put("redirect", "/board/suggestionList");
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
		}
		else {
			service.suggestionDelete(bvo.getBoard_num(), bvo.getUser_id());
			result.put("status", "200");
			result.put("msg", "글 삭제 완료.");
			result.put("redirect", "/board/suggestionList");
			entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
		}
	}catch(Exception e) {
		//삭제할 게시글이 존재하지 않을 경우
		//user_id가 null일 경우 
		e.printStackTrace();
		result.put("status", "400");
		result.put("msg", "글 삭제 요청 Error...");
		result.put("redirect", "/board/suggestionList");
		entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.BAD_REQUEST);	
	}
	return entity;
}


//성공 스토리 뷰 15

@GetMapping("successList")
public ModelAndView boardList(SuccessPagingVO ssVO){
	ModelAndView mav = new ModelAndView();

	ssVO.setSuccessTotalRecord(service.successtotalRecord(ssVO));
	
	
	mav.addObject("list", service.successList(ssVO));
	mav.addObject("SSVO", ssVO);
	
	mav.setViewName("board/successList"); 
	return mav;
}

//성공스토리 등록 16
@GetMapping("successWrite")
public ModelAndView successWrite() {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("board/successWrite");
	return mav;
}

//성공스토리 등록 데이터 베이스 17

@PostMapping("/successOk")
public ResponseEntity<String> successWriteOk(BoardVO vo, HttpServletRequest request) {
	
	vo.setUser_id((String)request.getSession().getAttribute("logId"));
	
	ResponseEntity<String> entity = null;
	HttpHeaders headers = new HttpHeaders();
	headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
	
	
	String path = request.getSession().getServletContext().getRealPath("/upload");
	System.out.println("path -> "+path);
	try {
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		
		
		List<MultipartFile> files = mr.getFiles("filename");
		System.out.println("업로드 파일 수 = "+files.size());
		
		if(files!=null) {
			int cnt = 1;
			
			
			for(int i=0; i<files.size(); i++) {
				
				MultipartFile mf = files.get(i);
				
				
				String orgFileName = mf.getOriginalFilename();
				System.out.println("orgFileName -> "+orgFileName);
				
				
				if(orgFileName!=null && !orgFileName.equals("")) {
					File f = new File(path, orgFileName);
					
					
					if(f.exists()) {
						for(int renameNum=1; ; renameNum++) {
							
							int point = orgFileName.lastIndexOf(".");
							String fileName = orgFileName.substring(0, point);
							String ext = orgFileName.substring(point+1);
							
							f = new File(path, fileName+" ("+renameNum+")."+ext);
							if(!f.exists()) {
								orgFileName = f.getName();
								break;
							}
						}
					}
					
					
					try {
						mf.transferTo(f);
					}catch(Exception ee) {
						ee.printStackTrace();
					}
					
					
					if(cnt==1) {
						vo.setFilename1(orgFileName);
					}
					if(cnt==2) {
						vo.setFilename2(orgFileName);
					}
					cnt++;
				}
			}
		}
		System.out.println(vo.toString());
		
		//DB등록
		service.successInsert(vo);
		
		String msg = "<script>alert('자료실 글이 등록되었습니다.');location.href='/success/dataList';</script>";
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//200
	}catch(Exception e) {
		e.printStackTrace();
		
		fileDelete(path, vo.getFilename1());
		fileDelete(path, vo.getFilename2());
		
		String msg = "<script>alert('성공스토리 등록에 실패했습니다.');history.back();</script>";
		
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
	}
	return entity;
}

public void fileDelete(String path, String filename) {
	if(filename!=null) {
		File file = new File(path, filename);
		file.delete();
	}
}


//성공스토리 등록 데이터 베이스 18

@GetMapping("/success/successView")
public ModelAndView view(int board_num) {
	ModelAndView mav = new ModelAndView();

	// 조회수 증가
	service.hitCount(board_num);
	mav.addObject("successVO", service.successView(board_num));
	mav.setViewName("success/successView");
	return mav;
}

// 성공스토리 수정하기 폼 19


	@GetMapping("successEdit")
	public ModelAndView successEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.successSelect(board_num));
		mav.setViewName("board/success/successEdit");
		return mav;
	}

//성공스토리 수정하기 데이터베이스 20
	
	@PostMapping("successEditOk")
	public int successEditOk(BoardVO vo, HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mr) {
		
		String newImg = vo.getSuccess_img_file();
		System.out.println("newImg = " + newImg);
		String originImg = vo.getOriginSuccessImg();
		System.out.println("originImg = " + originImg);
		
		mr = (MultipartHttpServletRequest) request;
		MultipartFile file = mr.getFile("file");
		System.out.println(!newImg.equals(originImg));
		
		// 이미지 수정된 경우
		if(!newImg.equals(originImg)) {
			// 이전 이름으로 덮어쓰기
			vo.setSuccess_img_file(originImg);
			
			String path = request.getSession().getServletContext().getRealPath("successImg");
			File uploadFile = new File(path, vo.getPt_img_file());
			
			// 덮어쓰기
			try {
				file.transferTo(uploadFile);
				System.out.println("성공");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("실패");
			}
		}
		
		String logId = (String)session.getAttribute("logId");
		vo.setUser_id(logId);
		service.successUpdate(vo);
		int result = service.successUpdate(vo);
		
		return result;
	}

	//성공스토리 삭제 21
	
	@GetMapping("successDel")
	public ResponseEntity<String> successDel(int board_num, String success_img_file, HttpSession session, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		System.out.print("성공스토리 이미지");
		// 이미지 파일 삭제
		String path = request.getSession().getServletContext().getRealPath("/successImg");
		File file = new File(path, success_img_file);
		
		file.delete();
		
		String id = (String) session.getAttribute("logId");
		int result = service.successDelete(board_num, id);
		
		try {
			if(result > 0) {
				String msg = "<script>alert('성공스토리 삭제.'); location.href='/board/successList';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('성공스토리 삭제 실패.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}




















}