package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.RecipePagingVO;
import com.team1.health.vo.Recipe_IngredVO;

@Mapper
@Repository
public interface RecipeDAO {
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
