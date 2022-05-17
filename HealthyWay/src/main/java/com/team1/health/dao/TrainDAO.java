package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.health.vo.TrainVO;

@Mapper
@Repository
public interface TrainDAO {
	
	//운동 목록
	public List<TrainVO> train_list();
	//내운동 추가
	public List<TrainVO> mytrain_list(int module_num);
}
