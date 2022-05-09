package com.team1.health.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.BoardService;


@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	@GetMapping("/board")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("/board/notice");
		return mav;
	}
}
	
	

	
	
	

