package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.ReplyVO;

public interface ReplyService {
	
	public int replyWrite(ReplyVO vo);

	public List<ReplyVO> replyList(int no);
	
	public int replyEdit(ReplyVO vo);
	
	public int replyDel(int replyno, String userid);	
}
