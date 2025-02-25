package team_project.food.DAO;

import java.util.List;

import team_project.food.DTO.FoodDto;


public interface DAO {
	
	List<FoodDto> getCountrylist(); //나라 리스트
	List<String> getCitylistByCountry(String country); //나라안에 속한 도시리스트
	List<FoodDto> getFoodlistByCity(String country, String city);//도시안에 속한 음식 
	
	public void deleteFood(String f_name); //삭제
}
