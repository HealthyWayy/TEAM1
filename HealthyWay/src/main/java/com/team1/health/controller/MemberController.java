package com.team1.health.controller;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


import com.team1.health.service.MemberService;
import com.team1.health.vo.MemberVO;


@Controller
@RequestMapping("/member/")
@Service
public class MemberController {
	@Autowired
    MemberService service;

	@GetMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	@PostMapping("loginOk")
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		MemberVO vo2 = service.loginCheck(vo);
		ModelAndView mav = new ModelAndView();
		if (vo2 != null) {// 로그인 성공
			session.setAttribute("logId", vo2.getUser_id());
			session.setAttribute("nickName", vo2.getUser_nickname());
			session.setAttribute("logStatus", "Y");
			// 컨트롤러에서 다른 컨트롤러 매핑주소를 바로 호출한다.
			mav.setViewName("redirect:/");
		} else {// 로그인 실패
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	
	// 로그아웃
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }
	
    // 회원가입 폼
	@GetMapping("memberForm")
    public String memberForm() {
        return "member/memberForm";
    }
	
	// 회원가입 확인
	@PostMapping("memberOk")
    public String memberFormOk(MemberVO vo, Model model) {
        int cnt = service.memberInsert(vo);
        model.addAttribute("cnt", cnt);
        return "member/memberResult";
    }
	
	// ---중복검사
	@PostMapping("checkId")
    @ResponseBody
    public String checkId (String user_id) {
		user_id = service.checkId(user_id);
		return user_id;
    }
	
    @PostMapping("checkNick")
    @ResponseBody
    public String checkNick (String user_nickname) {
    	user_nickname = service.checkNick(user_nickname);
		return user_nickname;
    }
    @PostMapping("checkTel")
    @ResponseBody
    public String checkTel (String tel) {
    	tel = service.checkTel(tel);
		return tel;
    }
    
    @PostMapping("checkEmail")
    @ResponseBody
    public String checkEmail (String user_email) {
    	user_email = service.checkEmail(user_email);
		return user_email;
    }
    // ---중복검사 끝
	    
	// 아이디 찾기
    @GetMapping("idSearch")
    public String idSearch() {
        return "member/idSearch";
    }
    
 // 비밀번호 찾기
    @GetMapping("pwSearch")
    public String pwSearch() {
        return "member/pwSearch";
    }
    
}
 