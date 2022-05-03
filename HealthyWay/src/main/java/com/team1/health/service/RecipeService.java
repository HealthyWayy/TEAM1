package com.team1.health.service;

import java.util.List;

import com.team1.health.vo.IngredientVO;

public interface RecipeService {
	public List<IngredientVO> searchIngred(String searchKey, String searchValue);
}
