package com.team1.health.dao;

import com.team1.health.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
	public MemberVO loginCheck(MemberVO vo);

	public int memberInsert(MemberVO vo);

	public String checkId(String user_id);
	public String checkNick(String user_nickname);
	public String checkTel(String tel);
	public String checkEmail(String user_email);
	
	public String findId(String user_id);
	public String findPw(String user_pw);
	public String updatePw(String user_id);
}
