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
	
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }
	
	@GetMapping("memberForm")
    public String memberForm() {
        return "member/memberForm";
    }
	
	@PostMapping("memberOk")
    public String memberFormOk(MemberVO vo, Model model) {
        int cnt = service.memberInsert(vo);
        model.addAttribute("cnt", cnt);
        return "member/memberResult";
    }
	
	@PostMapping("checkId")
    @ResponseBody
    public MemberVO checkId (@RequestBody MemberVO vo) {
        return service.checkId(vo);
    }
    @PostMapping("checkNick")
    @ResponseBody
    public MemberVO checkNick (@RequestBody MemberVO vo) {
        return service.checkNick(vo);
    }
    @PostMapping("checkTel")
    @ResponseBody
    public MemberVO checkTel (@RequestBody MemberVO vo) {
        return service.checkTel(vo);
    }
}
 