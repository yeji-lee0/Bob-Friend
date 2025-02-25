package team_project.food.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import team_project.food.DTO.FoodDto;

public class FoodDao implements DAO {

	SqlSession ss;
	private static final String NameSpace = "foodMapper.";
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<FoodDto> getCountrylist() {
		
		return ss.selectList(NameSpace+"getCountrylist");
		
	}

	@Override
	public List<String> getCitylistByCountry(String country) {
		
		return ss.selectList(NameSpace+"getCitylistByCountry",country);
	}

	@Override
	public List<FoodDto> getFoodlistByCity(String country, String city) {
		 Map<String, Object> params = new HashMap<>();
		 params.put("country", country);
		 params.put("city",city);
		 return ss.selectList(NameSpace+"getFoodlistByCity",params);
	}

	

	@Override
	public void deleteFood(String f_name) {
		
		ss.delete(NameSpace+"deletefood",f_name);
		
	}

	
	
	

}

	

	
	

	

