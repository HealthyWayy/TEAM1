package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.RecipePagingVO;
import com.team1.health.vo.Recipe_IngredVO;

public interface RecipeService {
	//재료 검색
	public List<IngredientVO> searchIngred(RecipePagingVO vo);
	//재료 선택
	public List<IngredientVO> addIngred(String gred_num);
	//재료 추가
	public int insertIngred(String gred_num, int board_num, double gred_gram);
	//재료 추가 목록
	public List<Recipe_IngredVO> ingredList();
	//재료 삭제
	public int deleteIngred(String gred_num);
}
