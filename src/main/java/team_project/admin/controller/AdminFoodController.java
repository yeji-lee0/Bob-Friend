package team_project.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import team_project.admin.DAO.AdminDao;
import team_project.admin.DTO.AdminDto;
import team_project.food.DTO.FoodDto;

@Controller
public class AdminFoodController {

	@Autowired
	AdminDao dao;
	
	public void setDao(AdminDao dao) {
		this.dao = dao;
		
	}
	
	
	//관리자음식권한 게시판
	
	@GetMapping("admin/food")
	public String allList(Model model) {
	    List<FoodDto> list = dao.getAllList();

	    // 중복 제거를 위한 Set 사용
	    Set<String> countriesSet = new HashSet<>();
	    Map<String, Set<String>> countryCitiesMap = new HashMap<>(); // 도시도 중복 제거를 위해 Set 사용

	    // 국가와 도시 정보 정리
	    for (FoodDto food : list) {
	        countriesSet.add(food.getCountry());

	        // 도시 목록 추가
	        countryCitiesMap
	            .computeIfAbsent(food.getCountry(), k -> new HashSet<>())
	            .add(food.getCity());
	    }

	    // 국가 목록을 List로 변환
	    List<String> uniqueCountries = new ArrayList<>(countriesSet);
	    
	    // 모델에 데이터 추가
	    model.addAttribute("uniqueCountries", uniqueCountries);
	    model.addAttribute("countryCitiesMap", countryCitiesMap);
	    model.addAttribute("list", list); // 갤러리 정보를 위해 list 추가

	    return "admin/food/list";
	}

	
	//나라와 도시에 따른 음식 출력
	@GetMapping("/admin/food/region") 
	public String getFoodByRegion(@RequestParam String country, @RequestParam String city, Model model) {
		
	    List<FoodDto> foodList = dao.getFoodByRegion(country, city); // 도시와 관련된 음식 목록 가져오기
	    model.addAttribute("list", foodList);
	    
	    return "admin/food/list"; 
	}
	
	//나라, 도시 추가 
	@PostMapping("/admin/addregion")
	public String insertRegion(@ModelAttribute FoodDto dto) {
		
		dao.insertRegion(dto);
		return "redirect:/admin/food";
	}
	
	@PostMapping("/admin/addfood") //음식추가
	public String insertFood(@ModelAttribute FoodDto dto) {
		dao.insertFood(dto);
		return "redirect:/admin/food";
	}
	
	@PostMapping("/admin/updatefood") //음식수정
	public String editFood(@ModelAttribute FoodDto dto,Model model) {
		
		String f_name = dto.getF_name();
		dao.updateFood(dto);
		model.addAttribute("f_name", f_name);
		return "redirect:/admin/food";
	}
	
	@PostMapping("/admin/deletefood") // 음식 삭제
	public String deleteFood(@RequestParam String f_name) {
	    dao.deleteFood(f_name);
	    return "redirect:/admin/food";
	}
	
	@PostMapping("/admin/deletecity") // 음식 삭제
	public String deletecity(@RequestParam String city) {
	    dao.deleteCity(city);
	    return "redirect:/admin/food";
	}
	
}
