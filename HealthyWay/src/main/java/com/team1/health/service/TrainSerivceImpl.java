package com.team1.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team1.health.dao.TrainDAO;
import com.team1.health.vo.TrainVO;

@Service
public class TrainSerivceImpl implements TrainService{

	@Autowired
	TrainDAO dao;
	
	@Override
	public List<TrainVO> train_list() {
		// TODO Auto-generated method stub
		return dao.train_list();
	}

	@Override
	public List<TrainVO> mytrain_list(int module_num) {
		// TODO Auto-generated method stub
		return dao.mytrain_list(module_num);
	}

	@Override
	public int mytrain_insert(TrainVO vo) {
		// TODO Auto-generated method stub
		return dao.mytrain_insert(vo);
	}

	@Override
	public int mymodule_insert(TrainVO vo) {
		// TODO Auto-generated method stub
		return dao.mymodule_insert(vo);
	}

	@Override
	public int update_train_num(TrainVO vo) {
		// TODO Auto-generated method stub
		return dao.update_train_num(vo);
	}

	@Override
	public List<TrainVO> get_train_title(TrainVO vo) {
		// TODO Auto-generated method stub
		return dao.get_train_title(vo);
	}

	@Override
	public List<TrainVO> get_train_list(TrainVO vo) {
		// TODO Auto-generated method stub
		return dao.get_train_list(vo);
	}

	@Override
	public List<TrainVO> get_all_train_list(String user_id) {
		// TODO Auto-generated method stub
		return dao.get_all_train_list(user_id);
	}

}
