package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.health.vo.ReplyVO;


@Mapper
@Repository
public interface ReplyDAO {
	
	public int replyWrite(ReplyVO vo);

	public List<ReplyVO> replyList(int no);
	
	public int replyEdit(ReplyVO vo);
	
	public int replyDel(int replyno, String userid);	
}
