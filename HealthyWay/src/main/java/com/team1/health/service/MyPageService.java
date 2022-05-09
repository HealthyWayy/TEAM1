package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.BoardVO;
import com.team1.health.vo.MemberVO;

public interface MyPageService {
	public MemberVO userData(String user);
	public List<BoardVO> PTboard(String user);
	public int userUpdate(MemberVO vo);
	public int userDelete(String user);
}
