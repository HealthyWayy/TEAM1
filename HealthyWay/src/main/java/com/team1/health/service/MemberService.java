package com.team1.health.service;

import com.team1.health.vo.MemberVO;

public interface MemberService {
	public MemberVO loginCheck(MemberVO vo);
	
	public int memberInsert(MemberVO vo);
	public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
}
