package team_project.admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.transaction.annotation.Transactional;

import team_project.admin.DTO.AdminDto;
import team_project.food.DTO.FoodDto;

public class AdminDaoImple implements AdminDao{
	SqlSession ss;
	private static final String NameSpace = "adminMapper.";

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	@Override // 관리자정보 수정
	public void updateAdmin(AdminDto dto) {
		ss.update(NameSpace+"updateAdmin", dto);
	}
	
	@Override //관리자 승인
	public void setApproval(String id) {
		ss.update(NameSpace+"setApproval", id);
	}
	
	@Override // 관리자 목록 가져오기(페이징 구현)
	public List<AdminDto> selectAdmins(int page){
		int startRow = (page - 1) * 10;
		int endRow = startRow + 10;
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		
		return ss.selectList(NameSpace+"selectAdmins", params);
	}
	
	@Override // 관리자 수
	public int countAdmins() {
		return ss.selectOne(NameSpace+"countAdmins");
	}
	
	@Override //로그인
	public AdminDto login(String id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		return ss.selectOne(NameSpace+"checkLogin", map);
	}

	@Override // 아이디 중복 확인. true면 중복.
	public boolean isIdDuplicate(String id) {
		int result = ss.selectOne(NameSpace+"checkIdDuplicate", id);
		
		return result > 0 ? true : false;
	}
	
	@Override // 회원가입
	public void insertOneAdmin(AdminDto dto) {
		if (dto.getId().equals("superAdmin")) {
			dto.setApproval(1);
		}
		
		ss.insert(NameSpace+"insertOneAdmin", dto);
	}

	
	@Override //음식 전체 목록
	public List<FoodDto> getAllList() {
		return ss.selectList(NameSpace + "getAllList");
	}


	@Override //카테고리선택에 따른 음식 목록
	public List<FoodDto> getFoodByRegion(String country, String city) {
		 Map<String, Object> params = new HashMap<>();
		 params.put("country", country);
		 params.put("city",city);
		 return ss.selectList(NameSpace+"getFoodByRegion",params);
	}

	@Override //나라,도시 추가
	public int insertRegion(FoodDto dto) {	
		int result = ss.update(NameSpace+"insertRegion",dto);
		return result;
	}


	@Override //음식추가
	public int insertFood(FoodDto dto) {	
		 return ss.update(NameSpace+"insertFood",dto);
	}

	@Transactional
	@Override //음식정보수정
	public void updateFood(FoodDto dto) {
		ss.update(NameSpace + "updateFoodRegion", dto);
		ss.update(NameSpace + "updateFood", dto);
	}

	@Override
	public void deleteFood(String f_name) {
		ss.delete(NameSpace + "deleteFood", f_name);
		
	}

	@Override
	public void deleteCity(String city) {
		ss.delete(NameSpace + "deleteCity", city);
		
	}

	

	
	
	
}
