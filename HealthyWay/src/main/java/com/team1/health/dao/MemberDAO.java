package com.team1.health.dao;

import com.team1.health.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
	public MemberVO loginCheck(MemberVO vo);
	
	public int memberInsert(MemberVO vo);
	public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
}
