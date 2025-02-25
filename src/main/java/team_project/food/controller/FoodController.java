package team_project.food.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team_project.food.DAO.DAO;
import team_project.food.DTO.FoodDto;
import team_project.member.DAO.MemberDao;
import team_project.member.DTO.MemberDto;

@Controller
public class FoodController {
	@Autowired
	DAO dao;
	@Autowired
	MemberDao memberDao;


	public void setDao(DAO dao) {
		this.dao=dao;
	}
	
	@RequestMapping("/country")
	public String countryList(Model model) {
		List<FoodDto> list = dao.getCountrylist();
		
		model.addAttribute("coun",list);
		return "region/country";
	}
	
	
	@RequestMapping("/city")
	public String cityList(Model model, @RequestParam("country") String country) {
	    List<String> cityList = dao.getCitylistByCountry(country);
	    model.addAttribute("country", country); // country 정보를 JSP로 전달
	    model.addAttribute("cityList", cityList); // 도시 목록을 JSP로 전달
	    return "region/city"; // city.jsp 경로
	}
	
	@GetMapping("/food")
	public String foodList(	Model model, 
							@RequestParam("country") String country, 
							@RequestParam("city") String city,
							HttpSession session) {
		List<FoodDto> foodList = dao.getFoodlistByCity(country, city);
		
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			String id = loginUser.getId();
			
			for (FoodDto foodDto : foodList) {
				foodDto.setLiked(memberDao.checkLikeFood(id, foodDto.getF_name()));
			}
		}
	    model.addAttribute("country", country); // country 
	    model.addAttribute("city", city); // city 
	    model.addAttribute("foodList", foodList); // 음식 목록을 JSP로 전달	    
	    return "region/food"; // food.jsp 경로
	}
	 
	@PostMapping("/likeFood") // 음식 좋아요 기능
	public String likeFood(	@RequestParam String member_id,
							@RequestParam String f_name,
							@RequestParam String country, 
							@RequestParam String city) throws UnsupportedEncodingException{
		
		if(memberDao.checkLikeFood(member_id, f_name)) {// 좋아요된 상태면 좋아요 취소
			memberDao.deleteLikeFood(member_id, f_name);
		}else {// 아니면 좋아요 등록
			memberDao.likeFood(member_id, f_name);
		}
		
		return "redirect:/food?country=" + URLEncoder.encode(country, "UTF-8") + "&city=" + URLEncoder.encode(city, "UTF-8");
	}
	
	
}