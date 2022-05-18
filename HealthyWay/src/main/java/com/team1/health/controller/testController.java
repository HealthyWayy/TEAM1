package com.team1.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.health.vo.ReportVO;

@Controller
public class testController {
	@GetMapping("/reportTest")
	public String reportTest () {
		return "/inc/reportTest";
	}
	@PostMapping("/report")
	@ResponseBody
	public int report(ReportVO vo,HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		System.out.println(vo.getReport_content());
		System.out.println(vo.getReport_title());
		System.out.println(vo.getBoard_num());
		System.out.println(vo.getReport_type());
		System.out.println(vo.getUser_id());
		int result = 0;
		return result;
	}
}
