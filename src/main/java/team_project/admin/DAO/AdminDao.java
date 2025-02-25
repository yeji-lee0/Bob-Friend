package team_project.admin.DAO;

import java.util.List;

import team_project.admin.DTO.AdminDto;
import team_project.food.DTO.FoodDto;

public interface AdminDao {

	boolean isIdDuplicate(String id);

	void insertOneAdmin(AdminDto dto);

	AdminDto login(String id, String pwd);

	int countAdmins();

	List<AdminDto> selectAdmins(int page);

	void setApproval(String id);

	void updateAdmin(AdminDto dto);
	
	//음식 관련 
	List<FoodDto> getAllList(); //전체목록
	
	List<FoodDto> getFoodByRegion(String country, String city); //카테고리 목록
	
	int insertRegion(FoodDto dto); //나라,도시추가
	
	int insertFood(FoodDto dto); //음식추가

	void updateFood(FoodDto dto); // 음식정보수정

	void deleteFood(String f_name);
	
	void deleteCity(String city);
	

}
