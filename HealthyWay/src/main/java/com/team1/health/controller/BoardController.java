package com.team1.health.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

import com.team1.health.service.BoardService;
import com.team1.health.service.MemberService;
import com.team1.health.service.ReplyService;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.PagingVO;
import com.team1.health.vo.SuccessPagingVO;
import com.team1.health.vo.SuggestionPagingVO;

@RestController

public class BoardController {
	@Inject
	BoardService service;

	@Inject
	MemberService memberService;

	@Inject
	ReplyService replyService;

	// 공지사항 뷰 1
	@GetMapping("boardList")
	public ModelAndView boardList(String searchKey,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "pageCount", required = false, defaultValue = "10") int pageCount,
			@RequestParam(value = "searchWord", required = false, defaultValue = "") String searchWord) {
		ModelAndView mav = new ModelAndView();

		PagingVO pvo = new PagingVO();
		// 검색어가 있을 경우
		if (!searchWord.equals("")) {
			pvo.setSearchWord(searchWord);
			pvo.setSearchKey(searchKey);
		}
		// 전체 게시글 업데이트
		pvo.setOnePageRecord(pageCount);
		pvo.setTotalRecord(service.totalRecord(pvo));
		pvo.setPageNum(pageNum);

		// 총 페이지 수
		pvo.setTotalRecord(service.totalRecord(pvo));

		// DB연결
		mav.addObject("boardList", service.boardList(pvo));

		// 페이지 정보
		mav.addObject("pvo", pvo);

		mav.setViewName("board/boardList");
		return mav;
	}

	// 공지사항 등록 뷰 2

	@GetMapping("boardWrite")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("board/boardWrite");
		return mav;
	}

	// 공지사항 게시글 생성 요청 db 3
	@PostMapping("/boardWrite")
	public int boardWrite(BoardVO vo, HttpServletRequest request) {
		vo.setUser_id((String) request.getSession().getAttribute("logId"));

		int result = service.boardInsert(vo);
		return result;
	}
	// 공지 삭제요청 3
	@DeleteMapping("/board/boardList")
	public ResponseEntity<HashMap<String, String>> boardDelete(int board_num, HttpServletRequest request,
			HttpSession session) {
		ResponseEntity<HashMap<String, String>> entity = null;
		HashMap<String, String> result = new HashMap<String, String>();
		String user_id = (String) session.getAttribute("logId");

		try {
			BoardVO bvo = service.boardSelectByNo(board_num);
			// 작성자가 다른경우
			if (bvo.getUser_id().equals(user_id) == false) {
				result.put("status", "200");
				result.put("msg", "잘못된 접근입니다");
				result.put("redirect", "/boardList");

				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			} else {
				service.boardDelete(bvo.getBoard_num(), bvo.getUser_id());

				result.put("status", "200");
				result.put("msg", "글 삭제 완료.");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			}
		} catch (Exception e) {
			// 삭제할 게시글이 존재하지 않을 경우
			// user_id가 null일 경우
			e.printStackTrace();
			result.put("status", "400");
			result.put("msg", "글 삭제 요청 Error...");
			result.put("redirect", "/boardList");
			entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 공지사항 상세보기 5
	@GetMapping("board/boardList/{board_num}")
	public ModelAndView boardInfoView(@PathVariable(value = "board_num") int board_num) {
		ModelAndView mav = new ModelAndView();

		service.hitCount(board_num);

		mav.addObject("bvo", service.boardSelect(board_num));
		mav.setViewName("board/boardView");
		return mav;
	}

	// 수정 뷰 7
	@GetMapping("/board/boardEdit/{board_num}")
	public ModelAndView boardEditView(@PathVariable(value = "board_num") int board_num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String user_id = (String) session.getAttribute("logId");
			BoardVO bvo = service.boardSelectByNo(board_num);
			// 작성자 본인 확인
			if (user_id != null && bvo.getUser_id().equals(user_id) == true) {
				mav.setViewName("/board/boardEdit");
				mav.addObject("bvo", service.boardSelectByNo(board_num));
			} else {

				mav.setViewName("/board/boardList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("/board/boardList");
		}
		return mav;
	}

	// 수정하기 요청 8
	@PutMapping("/board/boardList")
	public ResponseEntity<HashMap<String, String>> boardUpdate(BoardVO bvo, HttpServletRequest request,
			HttpSession session) {
		ResponseEntity<HashMap<String, String>> entity = null;
		HashMap<String, String> result = new HashMap<String, String>();
		String user_id = (String) session.getAttribute("logId");

		try {
			if (service.boardSelectByNo(bvo.getBoard_num()) == null) {
				// 수정할 게시글이 존재하지 않는 경우
				result.put("status", "200");
				result.put("msg", "존재하지 않는 게시물 입니다.");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			}
			// 작성자가 다른경우
			if (bvo.getUser_id().equals(user_id) == false) {
				result.put("status", "200");
				result.put("msg", "잘못된 접근입니다");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			} else {

				service.boardUpdate(bvo);
				result.put("status", "200");
				result.put("msg", "글 수정 완료.");
				result.put("redirect", "/boardList");
				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			}
		} catch (Exception e) {
			result.put("status", "400");
			result.put("msg", "글 수정 요청 Error...");
			result.put("redirect", "/boardList");
			entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 자유게시판 9
	@GetMapping("board/suggestionList")
	public ModelAndView suggestionList(String searchKey,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "pageCount", required = false, defaultValue = "10") int pageCount,
			@RequestParam(value = "searchWord", required = false, defaultValue = "") String searchWord) {
		ModelAndView mav = new ModelAndView();

		SuggestionPagingVO spvo = new SuggestionPagingVO();
		// 검색어가 있을 경우
		if (!searchWord.equals("")) {
			spvo.setSearchWord(searchWord);
			spvo.setSearchKey(searchKey);
		}
		// 전체 게시글 업데이트
		spvo.setOnePageRecord(pageCount);
		spvo.setSuggestionTotalRecord(service.suggestiontotalRecord(spvo));
		spvo.setPageNum(pageNum);

		// 총 페이지 수
		spvo.setSuggestionTotalRecord(service.suggestiontotalRecord(spvo));

		// DB연결
		mav.addObject("suggestionList", service.suggestionList(spvo));

		// 페이지 정보
		mav.addObject("spvo", spvo);

		mav.setViewName("board/suggestionList");
		return mav;
	}

	// 상세보기 5
		@GetMapping("board/suggestionList/{board_num}")
		public ModelAndView suggsetionInfoView(@PathVariable(value = "board_num") int board_num) {
			ModelAndView mav = new ModelAndView();

			service.hitCount(board_num);

			mav.addObject("bvo", service.boardSelect(board_num));
			mav.setViewName("board/suggestionView");
			return mav;
		}

	//// 자유게시판 수정 뷰 12
	// @GetMapping("/board/suggestionEdit/{board_num}")
	// public ModelAndView suggestionEditView(@PathVariable(value="board_num")int
	//// board_num, HttpSession session) {
	// ModelAndView mav = new ModelAndView();
	// try {
	// String user_id = (String)session.getAttribute("logId");
	// BoardVO bvo = service.suggestionSelectByNo(board_num);
	// //작성자 본인 확인
	// if(user_id != null && bvo.getUser_id().equals(user_id) == true){
	// mav.setViewName("board/suggestionEdit");
	// mav.addObject("bvo",service.suggestionSelectByNo(board_num));
	// }
	// else {
	// mav.setViewName("redirect:/board/suggestionList");
	// }
	// }catch(Exception e) {
	// e.printStackTrace();
	// mav.setViewName("redirect:/board/suggestionList");
	// }
	// return mav;
	// }

	//// 13 자유게시판 수정 요청
	// @PutMapping("/board/suggestionList")
	// public ResponseEntity<HashMap<String,String>> suggestionUpdate(BoardVO bvo,
	//// HttpServletRequest request, HttpSession session){
	// ResponseEntity<HashMap<String,String>> entity = null;
	// HashMap<String,String> result = new HashMap<String,String>();
	// String user_id = (String)session.getAttribute("logId");
	//
	// try {
	// if(service.suggestionSelectByNo(bvo.getBoard_num()) == null) {
	// //수정할 게시글이 존재하지 않는 경우
	// result.put("status", "200");
	// result.put("msg", "존재하지 않는 게시물 입니다.");
	// result.put("redirect", "/board/suggestionList");
	// entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	// }
	// //작성자가 다른경우
	// if(bvo.getUser_id().equals(user_id)== false) {
	// result.put("status", "200");
	// result.put("msg", "잘못된 접근입니다");
	// result.put("redirect", "/board/suggestionList");
	// entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	// }
	// else {
	//
	// service.suggestionUpdate(bvo);
	// result.put("status", "200");
	// result.put("msg", "글 수정 완료.");
	// result.put("redirect", "/board/suggestionList");
	// entity = new ResponseEntity<HashMap<String,String>>(result, HttpStatus.OK);
	// }
	// }catch(Exception e) {
	// result.put("status", "400");
	// result.put("msg", "글 수정 요청 Error...");
	// result.put("redirect", "/board/suggestionList");
	// entity = new ResponseEntity<HashMap<String,String>>(result,
	//// HttpStatus.BAD_REQUEST);
	// }
	//
	//
	// return entity;
	// }

	// 자유게시판 글등록 폼으로 이동
	@GetMapping("suggestionWrite")
	public ModelAndView suggestionWrite() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("board/suggestionWrite");
		return mav;
	}

	// 자유게시판 글등록(DB)
	@PostMapping("/board/suggestionList")
	public int suggestionWrite(BoardVO vo, HttpServletRequest request) {
		vo.setUser_id((String) request.getSession().getAttribute("logId"));
		
		int result = service.suggestionInsert(vo);
		return result;
	}

	// 자유게시판 수정폼으로 이동
	@GetMapping("/board/suggestionList/edit/{board_num}")
	public ModelAndView suggestionEditView(@PathVariable(value = "board_num") int board_num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String user_id = (String) session.getAttribute("logId");
			BoardVO bvo = service.suggestionSelectByNo(board_num);
			// 작성자 본인 확인
			if (user_id != null && bvo.getUser_id().equals(user_id) == true) {
				mav.setViewName("board/suggestionEdit");
				mav.addObject("bvo", service.suggestionSelectByNo(board_num));
			} else {
				mav.setViewName("redirect:/board/suggestionList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/board/suggestionList");
		}
		return mav;
	}

	// 자유게시판 삭제 14
	@GetMapping("/suggestionDelete")
	public ResponseEntity<HashMap<String,String>> suggestionDelete(int board_num, HttpServletRequest request, HttpSession session){
    	ResponseEntity<HashMap<String,String>> entity = null;
    	HashMap<String,String> result = new HashMap<String,String>();
    	String user_id = (String)session.getAttribute("logId");

		try {
			BoardVO bvo = service.suggestionSelectByNo(board_num);
			// 작성자가 다른경우
			if (bvo.getUser_id().equals(user_id) == false) {
				result.put("status", "200");
				result.put("msg", "잘못된 접근입니다");
				result.put("redirect", "board/suggestionList");

				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			} else {
				service.suggestionDelete(bvo.getUser_id(), bvo.getBoard_num());

				result.put("status", "200");
				result.put("msg", "글 삭제 완료.");
				result.put("redirect", "board/suggestionList");
				entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.OK);
			}
		} catch (Exception e) {
			// 삭제할 게시글이 존재하지 않을 경우
			// user_id가 null일 경우
			e.printStackTrace();
			result.put("status", "400");
			result.put("msg", "글 삭제 요청 Error...");
			result.put("redirect", "/suggestionList");
			entity = new ResponseEntity<HashMap<String, String>>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 성공 스토리 리스트
	@GetMapping("successList")
	public ModelAndView boardList(SuccessPagingVO ssVO) {
		ModelAndView mav = new ModelAndView();

		ssVO.setSuccessTotalRecord(service.successtotalRecord(ssVO));

		mav.addObject("list", service.successList(ssVO));
		mav.addObject("SSVO", ssVO);

		mav.setViewName("board/successList");
		return mav;
	}

	// 성공스토리 글등록 폼으로 이동
	@GetMapping("successWrite")
	public ModelAndView successWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/successWrite");
		return mav;
	}

	// 성공스토리 글등록(DB)
	@PostMapping("successWriteOk")
	public int successWriteOk(BoardVO vo, HttpServletRequest request) {
		System.out.println("성공스토리 글등록하기");
		vo.setUser_id((String) request.getSession().getAttribute("logId"));

		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;

		// mr에 파일의 수만큼 MultipartFile객체가 존재한다.
		List<MultipartFile> files = mr.getFiles("filename");
		System.out.println("업로드 파일수 = " + files.size());

		int cnt = 1;
		for (int i = 0; i < files.size(); i++) {
			// MultipartFile객체 얻어오기
			MultipartFile mf = files.get(i);

			String orgFileName = mf.getOriginalFilename();
			System.out.println("orgFileName->" + orgFileName);

			// 파일명 중복되지 않게 처리
			UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + orgFileName;

			String path = request.getSession().getServletContext().getRealPath("/successImg");

			File f = new File(path, filename);

			// 파일업로드
			try {
				mf.transferTo(f); // 실제업로드가 발생함.
			} catch (Exception ee) {
				ee.printStackTrace();
			}

			if (cnt == 1) {
				vo.setImg_file1(filename);
			}
			if (cnt == 2) {
				vo.setImg_file2(filename);
			}
			cnt++;
		}

		service.suggestionInsert(vo);
		int result = service.acheiveInsert(vo);
		return result;
	}

	// 성공스토리 뷰
	@GetMapping("/successView")
	public ModelAndView view(int board_num) {
		ModelAndView mav = new ModelAndView();

		// 조회수 증가
		service.hitCount(board_num);
		mav.addObject("bvo", service.successView(board_num));
		mav.setViewName("board/successView");
		return mav;
	}

	// 성공스토리 수정하기 폼
	@GetMapping("successEdit")
	public ModelAndView successEdit(int board_num) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("bvo", service.successView(board_num));
		mav.setViewName("board/successEdit");
		return mav;
	}

	// 성공스토리 수정(DB)
	@PostMapping("successEditOk")
	public int successEditOk(BoardVO vo,HttpServletRequest request) {
		System.out.print("성공스토리 수정!");
		
		String newBeforeImg = vo.getImg_file1();
		String newAfterImg = vo.getImg_file2();
		System.out.println(newBeforeImg + "    " + newAfterImg);
		
		String originBeforeImg = vo.getOriginBeforeImg();
		String originAfterImg = vo.getOriginAfterImg();
		System.out.println(originBeforeImg + "     " + originAfterImg);
		
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;

		// mr에 파일의 수만큼 MultipartFile객체가 존재한다.
		List<MultipartFile> files = mr.getFiles("filename");
		System.out.println("업로드 파일수 = " + files.size());
		
		
		
		// before 이미지 수정된 경우
		if(!newBeforeImg.equals(originBeforeImg)) {
			vo.setImg_file1(originBeforeImg);
			MultipartFile mf = files.get(0);
			String path = request.getSession().getServletContext().getRealPath("successImg");
			File uploadFile = new File(path, vo.getImg_file1());
			
			// 덮어쓰기
			try {
				mf.transferTo(uploadFile);
				System.out.println("성공");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("실패");
			}
		}
		
		// after 이미지 수정된 경우
		if(!newAfterImg.equals(originAfterImg)) {
			vo.setImg_file2(originAfterImg);
			MultipartFile mf = files.get(1);
			String path = request.getSession().getServletContext().getRealPath("successImg");
			File uploadFile = new File(path, vo.getImg_file2());
			
			// 덮어쓰기
			try {
				mf.transferTo(uploadFile);
				System.out.println("성공");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("실패");
			}
		}
		
		vo.setUser_id((String) request.getSession().getAttribute("logId"));
		service.successUpdate(vo);
		int result = service.achieveUpdate(vo);
		
		return result;
	}
	

	@GetMapping("successDel")
	public ResponseEntity<String> successDel(int board_num, String img_file1, String img_file2, HttpSession session, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		// 이미지 파일 삭제
		String path = request.getSession().getServletContext().getRealPath("/successImg");

		File file1 = new File(path, img_file1);
		file1.delete();

		File file2 = new File(path, img_file2);
		file2.delete();


		String id = (String)request.getSession().getAttribute("logId");
		int result = service.successDelete(board_num, id);


		try {
			if (result > 0) {
				String msg = "<script>alert('삭제가 완료되었습니다.'); location.href='/successList';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글삭제를 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}