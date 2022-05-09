package com.team1.health.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.health.service.RecipeService;
import com.team1.health.vo.IngredientVO;
import com.team1.health.vo.RecipePagingVO;
import com.team1.health.vo.Recipe_IngredVO;

@Controller
public class RecipeController {

	@Inject
	RecipeService service;

	// 메인 페이지
	@GetMapping("/recipe/main")
	public String main() {
		return "/recipe/recipe_main";
	}

	// 레시피 목록 페이지(게시판)
	@GetMapping("/recipe/list")
	public String list() {
		return "/board/recipe/recipe_list";
	}

	// 레시피 등록 페이지
	@GetMapping("/recipe/write")
	public String write() {
		return "/board/recipe/recipeWrite";
	}
	//재료 추가 관련-----------------------------------------
	// 재료 검색
	@PostMapping("/recipe/searchIngred")
	@ResponseBody
	public List<IngredientVO> searchIngred(RecipePagingVO vo) {
		return service.searchIngred(vo);
	}

	// 재료 선택
	@PostMapping("/recipe/addIngred")
	@ResponseBody
	public List<IngredientVO> addIngred(String gred_num) {
		return service.addIngred(gred_num);
	}
	
	//레시피_재료 테이블에 추가
	@PostMapping("/recipe/insertIngred")
	@ResponseBody
	public int insertIngred(String gred_num, int board_num, double gred_gram) {
		//board_num은 아직 생성되지 않았기 때문에 0으로 설정
		return service.insertIngred(gred_num, board_num, gred_gram);
	}
	
	//레시피 리스트 출력
	@GetMapping("/recipe/ingredList")
	@ResponseBody
	public List<Recipe_IngredVO> ingredList(){
		return service.ingredList();
	}
	
	//재료 삭제
	@PostMapping("/recipe/deleteIngred")
	@ResponseBody
	public int deleteIngred(String gred_num) {
		return service.deleteIngred(gred_num);
	}
	
	//글 등록 관련-----------------------------------------
	@PostMapping("/recipe/insertRecipe")
	public ModelAndView insertRecipe() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recipe/list");
		return mav;
	}

}
