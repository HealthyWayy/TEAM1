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
	public String checkId(String user_id) {
		return dao.checkId(user_id);
	}

	@Override
	public String checkNick(String user_nickname) {
		return dao.checkNick(user_nickname);
	}

	@Override
	public String checkTel(String tel) {
		return dao.checkTel(tel);
	}

	@Override
	public String checkEmail(String user_email) {
		return dao.checkEmail(user_email);
	}

	// 찾기
	@Override
	public String findId(String user_id) {
		return dao.findId(user_id);
	}

	@Override
	public String findPw(String user_pw) {
		return dao.findPw(user_pw);
	}

	@Override
	public String updatePw(String user_id) {
		return dao.updatePw(user_id);
	}

}
