package com.team1.health.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team1.health.service.ReplyService;
import com.team1.health.vo.ReplyVO;

@RestController
public class ReplyController {
	@Inject
	ReplyService service;
	
	
	@RequestMapping(value="/reply/writeOk", method=RequestMethod.POST)
	public int writeOk(ReplyVO vo, HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		
		return service.replyWrite(vo);
	}	
	
	@RequestMapping("/reply/list")
	public List<ReplyVO> list(int reply_num){
		return service.replyList(reply_num);
	}
	
	@PostMapping("/reply/editOk")
	public int editOk(ReplyVO vo, HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		return service.replyEdit(vo);
	}
	
	@GetMapping("/reply/del")
	public int delOk(int reply_num, HttpSession session) {
		return service.replyDel(reply_num, (String)session.getAttribute("logId"));
	}
}