package com.team1.health.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.health.service.MemberService;

@Controller
@RequestMapping("/member/")
@Service
public class MemberController {

	@GetMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@GetMapping("memberForm")
    public String memberForm() {
        return "member/memberForm";
    }
}
