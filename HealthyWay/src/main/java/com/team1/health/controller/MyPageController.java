package com.team1.health.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.MyPageService;
import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;
import com.team1.health.vo.MyPagePagingVO;
import com.team1.health.vo.PagingVO;
import com.team1.health.vo.TrainVO;

@Controller
public class MyPageController {
	@Inject
	MyPageService service;
	@GetMapping("/mypage")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView ();
		//임시 데이터 입력
		
		String user = (String)session.getAttribute("logId");
		MemberVO userData = service.userData(user);
		List<BoardVO> PTboardData = service.PTboard(user);
		//pt그룹 데이터
		mav.addObject("PTboardData",PTboardData);
		//유저 데이터
		mav.addObject("userData",userData);
		mav.setViewName("/mypage/myPage");
		return mav;
	}
	@DeleteMapping("/mypage/heart")
	@ResponseBody
	public int reciepeHeartDel(int board_num) {
		return service.reciepeHeartDel(board_num);
	}
	@PostMapping("/mypage/weightAll")
	@ResponseBody
	public Map<String,Object> weightAll(MemberVO vo, HttpSession session) {
		String user = (String)session.getAttribute("logId");
		List<MemberVO> list = service.weightAll(user);
		double [] weight = new double [list.size()]; 
		String [] write_date = new String [list.size()];
		Map<String,Object>map=new HashMap<String,Object>();
		for(int i=0; i<list.size();i++) {
			weight[i] = list.get(i).getWeight();
			write_date[i] = list.get(i).getWrite_date();
		}
		System.out.println(weight[0]);
		System.out.println(write_date[0]);
		map.put("weight", weight);
		map.put("writeDate", write_date);
		return map;
	}
	@GetMapping("/mypage/groupPageNagion")
	@ResponseBody
	public MyPagePagingVO groupPageNagion(MyPagePagingVO vo, HttpSession session) {
		String user = (String)session.getAttribute("logId");
		vo.setTotalRecord(service.groupCount(user));
		return vo;
	}
	@PostMapping("/mypage/routineListAll")
	@ResponseBody
	public Map<String,Object> routineListAll(HttpSession session){
		String user = (String)session.getAttribute("logId");
		List<TrainVO> userRList = service.userRoutineListAll(user);
		List<TrainVO> module;
		int [] trainNum = new int[userRList.size()];
		for(int i=0; i<userRList.size(); i++) {
			trainNum[i] = userRList.get(i).getTrain_num();
		}
		Map<String,Object>map=new HashMap<String,Object>();
		module = service.trainModuleListAll(trainNum);
		map.put("userRList", userRList);
		map.put("module", module);
		return map;
	}
	@GetMapping("/mypage/groupListAll")
	@ResponseBody
	public List<BoardVO> groupListAll(MyPagePagingVO vo, HttpSession session){
		//임시 데이터 입력
		String user = (String)session.getAttribute("logId");
		return service.groupListAll(user, vo);
	}
	@GetMapping("/mypage/achieveList")
	@ResponseBody
	public List<BoardVO> achieveList(MyPagePagingVO vo, HttpSession session){
		String user = (String)session.getAttribute("logId");
		return service.achieveListAll(user, vo);
	}
	@GetMapping("/mypage/achievePageNagion")
	@ResponseBody
	public MyPagePagingVO achievePageNagion(MyPagePagingVO vo, HttpSession session) {
		String user = (String)session.getAttribute("logId");
		vo.setTotalRecord(service.achieveCount(user));
		return vo;
	}
	@GetMapping("/mypage/foodListAll")
	@ResponseBody
	public List<BoardVO> foodListAll(MyPagePagingVO vo, HttpSession session){
		String user = (String)session.getAttribute("logId");
		return service.foodListAll(user,vo);
	}
	@GetMapping("/mypage/foodPageNation")
	@ResponseBody
	public MyPagePagingVO foodPageNation(MyPagePagingVO vo,HttpSession session) {
		String user = (String)session.getAttribute("logId");
		vo.setTotalRecord(service.foodCount(user));
		return vo;
	}
	@PostMapping("/mypage/reciepeHeart")
	@ResponseBody
	public List<BoardVO> reciepeHeart(HttpSession session){
		//임시 데이터 입력
		String user = (String)session.getAttribute("logId");
		return service.recipeHeart(user);
	}
	@PostMapping("/mypage/reciepeInfor")
	@ResponseBody
	public BoardVO reciepeInfor(int board_num) {
		return service.reciepeInfor(board_num);
	}
	//마이페이지 개인정보 삭제
	@DeleteMapping("/mypage/user")
	@ResponseBody
	public int delUser(@RequestParam("user") String user) {
		System.out.println(user+"삭제");
		return service.userDelete(user);
	}
	//마이페이지 개인정보 업데이트
	@PostMapping("/mypage/userUpdate")
	@ResponseBody
	public int updateUser(MemberVO vo,HttpServletRequest request) {
		//나중에 배포를 위해서라도 링크 외부 파일로 돌리기!
		String path = request.getSession().getServletContext().getRealPath("/img");
		System.out.println(path);
		String orgFileName = "";
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			List<MultipartFile> files = mr.getFiles("profile_img");
			System.out.println("업로드 파일수 = "+files.size());
			System.out.println(vo.getUser_id());
			if(files!=null) {
				System.out.println("실행!!!");
				for (int i=0; i<files.size();i++) {
					MultipartFile mf = files.get(i);
					orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName = "+orgFileName);
					if(orgFileName!=null && !orgFileName.equals("")) {
						File f = new File(path,orgFileName);
						System.out.println("if1"+f.exists());
						if(f.exists()) {
							for(int renameNum=0;;renameNum++) {
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0,point);
								String ext = orgFileName.substring(point+1);
								f = new File(path,fileName+"-"+renameNum+"."+ext);
								System.out.println("if2"+!f.exists());
								if(!f.exists()) {
									orgFileName = f.getName();
									break;
								}
							}
						}
						try {
							System.out.println("파일 업로드 실행");
							mf.transferTo(f);//실제 업로드됨
							if(!vo.getProfie_img().equals("noprofile.png")) {
								fileDelete(path,vo.getProfie_img());
							}
							vo.setProfie_img(orgFileName);
						}catch(Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			if(!orgFileName.equals("noprofile.png")) {
				fileDelete(path,orgFileName);
			}
			System.out.println("삭제 실행");
		}
		//수정 DAO작성
		int result = service.userUpdate(vo);
		System.out.println(result+"결과");
		return result;
	}
	public void fileDelete(String path, String fileName) {
		if(fileName!=null) {//파일명이 존재하면
			File file = new File(path,fileName);
			file.delete();
		}
	}
}
