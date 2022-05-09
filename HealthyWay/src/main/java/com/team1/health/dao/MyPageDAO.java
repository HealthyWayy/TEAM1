package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;

@Mapper
@Repository
public interface MyPageDAO {
	public MemberVO userData(String user);
	public List<BoardVO> PTboard(String user);
	public int userUpdate(MemberVO vo);
	public int userDelete(String user);
}
