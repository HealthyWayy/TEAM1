package com.team1.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecipeController {

	@GetMapping("/recipe/main")
	public String main() {
		return "/recipe/recipe_main";
	}
}
