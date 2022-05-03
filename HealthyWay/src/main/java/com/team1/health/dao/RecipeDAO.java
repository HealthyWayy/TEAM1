package com.team1.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.health.vo.IngredientVO;

@Mapper
@Repository
public interface RecipeDAO {
	public List<IngredientVO> searchIngred(String searchKey, String searchValue);
}
