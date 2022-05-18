package com.team1.health.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.AdminService;
import com.team1.health.service.BoardService;
import com.team1.health.service.MemberService;
import com.team1.health.service.PtService;
import com.team1.health.service.TrainService;
import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.PagingVO;

@Controller
public class AdminController {

	@Inject
	AdminService service;
	
	// 회원 관리자 페이지------------------------------------
	@GetMapping("/master/member")
	public ModelAndView masterMember(PagingVO pvo) {
		ModelAndView mav = new ModelAndView();
		pvo.setTotalRecord(service.totalRecord(pvo));
		mav.addObject("pVO", service.totalRecord(pvo));
		mav.addObject("vo", service.memberList());
		mav.setViewName("/admin/master_member");
		
		return mav;
	}

	
	// 운동 관리자 페이지------------------------------------
	@GetMapping("/master/trainning")
	public String masterTrainning() {
		return "/admin/master_trainning";
	}

	
	// 레시피 관리자 페이지------------------------------------
	@GetMapping("/master/recipe")
	public String masterRecipe() {
		return "/admin/master_recipe";
	}

	// 재료 추가
	@PostMapping("/master/ingredInsert")
	@ResponseBody
	public int ingredInsert(IngredientVO vo) {

		// 마지막 gred_num id값
		String id = service.lastIngred();

		// id값에서 숫자만 뽑아온 후 1증가(새로 추가될 아이디 값)
		int num = Integer.parseInt(id.substring(1)) + 1;

		// R로 시작하고 6자리 공백은 0으로 채우는 자릿수 세팅
		String gred_num = String.format("R%06d", num);
		vo.setGred_num(gred_num);

		return service.ingredInsert(vo);
	}

	// 재료 삭제
	@PostMapping("/master/ingredDelete")
	@ResponseBody
	public int ingredDelete(String gred_num) {
		return service.ingredDelete(gred_num);
	}

	
	// PT그룹 관리자 페이지------------------------------------
	@GetMapping("/master/ptGroup")
	public String masterptGroup() {
		return "/admin/master_pt";
	}

	
	// 커뮤니티 관리자 페이지------------------------------------
	@GetMapping("/master/community")
	public String masterCommunity() {
		return "/admin/master_community";
	}
}
