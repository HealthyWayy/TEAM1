package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.TrainVO;

public interface TrainService {

	//운동 목록
	public List<TrainVO> train_list();
	//내운동 추가
	public List<TrainVO> mytrain_list(int module_num);
	//trainning_routine DB 추가
	public int mytrain_insert(TrainVO vo);
	//trainning_module DB 추가
	public int mymodule_insert(TrainVO vo);
	//training module train_num 변경
	public int update_train_num(TrainVO vo);
	//내 운동 리스트 제목 가져오기
	public List<TrainVO> get_train_title(TrainVO vo);
	//내 운동 리스트 운동 가져오기
	public List<TrainVO> get_train_list(TrainVO vo);
	//내 운동 리스트 목록 가져오기
	public List<TrainVO> get_all_train_list(String user_id);
}
