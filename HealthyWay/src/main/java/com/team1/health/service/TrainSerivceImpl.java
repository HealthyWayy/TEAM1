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

}
