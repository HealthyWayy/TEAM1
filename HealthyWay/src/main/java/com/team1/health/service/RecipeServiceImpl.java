package com.team1.health.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.RecipeDAO;
import com.team1.health.vo.IngredientVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	@Inject
	RecipeDAO dao;

	@Override
	public List<IngredientVO> searchIngred(String searchKey, String searchValue) {
		return dao.searchIngred(searchKey, searchValue);
	}
}
