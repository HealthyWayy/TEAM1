package com.team1.health.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team1.health.vo.IngredientVO;

@Controller
public class RecipeController {
	
	@Inject
	RecipeService service;
	
	//메인 페이지
	@GetMapping("/recipe/main")
	public String main() {
		return "/recipe/recipe_main";
	}
	//레시피 목록 페이지(게시판)
	@GetMapping("/recipe/list")
	public String list() {
		return "/board/recipe/recipe_list";
	}
	//레시피 등록
	@GetMapping("/recipe/write")
	public String write() {
		return "/board/recipe/recipeWrite";
	}
	//재료 검색
	@PostMapping("/recipe/searchIngred")
	public List<IngredientVO> searchIngred(){
		
		retrun;
	}
}
