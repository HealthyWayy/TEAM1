package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.TrainVO;

public interface TrainService {

	//운동 목록
	public List<TrainVO> train_list();
	//내운동 추가
	public List<TrainVO> mytrain_list(int module_num);
}
