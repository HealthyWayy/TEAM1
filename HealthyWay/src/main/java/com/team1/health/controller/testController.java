package com.team1.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team1.health.vo.ReportVO;

@Controller
public class testController {
	@GetMapping("/reportTest")
	public String reportTest () {
		return "/inc/reportTest";
	}
	@PostMapping("/report")
	public int report(ReportVO vo) {
		System.out.println(vo.getReport_content());
		System.out.println(vo.getReport_title());
		System.out.println(vo.getBoard_num());
		System.out.println(vo.getReport_type());
		int result = 1;
		return result;
	}
}
