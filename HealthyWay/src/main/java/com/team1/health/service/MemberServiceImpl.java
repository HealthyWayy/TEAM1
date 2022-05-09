package com.team1.health.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.health.dao.MemberDAO;
import com.team1.health.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}
	
	@Override
    public int memberInsert(MemberVO vo) {
        return dao.memberInsert(vo);
    }
	
	@Override
	public MemberVO checkId(MemberVO vo) {
		return dao.checkId(vo);
	}

	@Override
	public MemberVO checkNick(MemberVO vo) {
		return dao.checkNick(vo);
	}

	@Override
	public MemberVO checkTel(MemberVO vo) {
		return dao.checkTel(vo);
	}

}
