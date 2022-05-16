package com.team1.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.vo.MemberVO;
import com.team1.health.vo.TrainVO;

@Controller
public class TrainController {
	//트레이닝 홈페이지
	@GetMapping("/trainning/trainningHome")
	public ModelAndView trainningHome(HttpSession session) {
		MemberVO mvo = new MemberVO();
		TrainVO vo = new TrainVO();
				
		ModelAndView mav = new ModelAndView();
		session.getAttribute(mvo.getUser_id());
		mav.addObject("vo", vo);
		mav.setViewName("/trainning/trainningHome");
		return mav;
	}
	
	//나만의 트레이닝 홈페이지
	@GetMapping("/trainning/myTrainning")
	public ModelAndView myTrainning() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/trainning/myTrainning");
		return mav;
	}
	//추천 트레이닝 홈페이지
	@GetMapping("/trainning/recommendTrainning")
	public ModelAndView recommendTrainning() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/trainning/recommendTrainning");
		return mav;
	}	
	//테스트중
	@GetMapping("/trainning/testTrain")
	public ModelAndView testTrain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/trainning/testTrain");
		return mav;
	}
}