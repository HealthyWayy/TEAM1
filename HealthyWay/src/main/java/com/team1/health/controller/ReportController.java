package com.team1.health.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.health.service.ReportService;
import com.team1.health.vo.ReportVO;

@Controller
public class ReportController {
	@Inject
	ReportService service;
	
	@GetMapping("/reportTest")
	public String reportTest () {
		return "/inc/reportTest";
	}
	@PostMapping("/master/reportProcess")
	@ResponseBody
	public int report(ReportVO vo,HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		service.userReportCount(vo.getWrite_id());
		int result = service.reportInsert(vo);
		return result;
	}
}
