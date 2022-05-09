package com.team1.health.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.RecipeDAO;
import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.RecipePagingVO;
import com.team1.health.vo.Recipe_IngredVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	@Inject
	RecipeDAO dao;
	
	//재료 검색
	@Override
	public List<IngredientVO> searchIngred(RecipePagingVO vo) {
		return dao.searchIngred(vo);
	}
	//재료 선택
	@Override
	public List<IngredientVO> addIngred(String gred_num) {
		return dao.addIngred(gred_num);
	}
	//재료 추가
	@Override
	public int insertIngred(String gred_num, int board_num, double gred_gram) {
		return dao.insertIngred(gred_num, board_num, gred_gram);
	}
	//재료 추가 목록
	@Override
	public List<Recipe_IngredVO> ingredList() {
		return dao.ingredList();
	}
	//재료 삭제
	@Override
	public int deleteIngred(String gred_num) {
		return dao.deleteIngred(gred_num);
	}

}
