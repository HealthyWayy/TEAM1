package com.team1.health.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.MyPageService;

@Controller
public class MyPageController {
	@Inject
	MyPageService service;
	@GetMapping("/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("/mypage/myPage");
		return mav;
	}
}
