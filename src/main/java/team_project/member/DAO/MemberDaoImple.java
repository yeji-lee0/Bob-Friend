package team_project.member.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import team_project.food.DTO.FoodDto;
import team_project.member.DTO.MemberDto;
import team_project.post.DTO.CommDto;
import team_project.post.DTO.PostDto;

public class MemberDaoImple implements MemberDao{
	
	SqlSession ss;
	private static final String NameSpace = "memberMapper.";

	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	@Override // 회원의 즐겨찾기 목록
	public List<FoodDto> getLikeList(String member_id){
		List<FoodDto> foodList = ss.selectList(NameSpace+"getLikeList", member_id);
		
		for (FoodDto foodDto : foodList) {
			foodDto.setLiked(true);
		}
		return foodList;
	}
	
	
	@Override // 회원이 음식 즐겨찾기를 했는지 안했는지 확인. 했으면 true
	public boolean checkLikeFood(String member_id, String f_name) {
		Map<String, String> params = new HashMap<>();
		params.put("member_id", member_id);
		params.put("f_name", f_name);
		
		int result = ss.selectOne(NameSpace+"ChecklikeFood", params);
		if (result > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override // 음식 즐겨찾기 등록
	public void likeFood(String member_id, String f_name) {
		Map<String, String> params = new HashMap<>();
		params.put("member_id", member_id);
		params.put("f_name", f_name);
		ss.insert(NameSpace+"likeFood", params);
	}
	
	@Override // 음식 즐겨찾기 취소
	public void deleteLikeFood(String member_id, String f_name) {
		Map<String, String> params = new HashMap<>();
		params.put("member_id", member_id);
		params.put("f_name", f_name);
		ss.delete(NameSpace+"deleteLikeFood", params);
	}
	
	@Override // 회원목록
	public List<MemberDto> selectMembers(int page){
		int startRow = (page - 1) * 10;
		int endRow = startRow + 10;
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		
		return ss.selectList(NameSpace+"selectMembersWithCounts", params);
	}
	
	@Override // 회원 수
	public int countMembers() {
		return ss.selectOne(NameSpace+"countMembers");
	}
	
	@Override // 사용자가 쓴 글 가져오기(페이징 구현)
	public List<PostDto> selectPost(String id, int page){
		int startRow = (page - 1) * 5;
		int endRow = startRow + 5;
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("writer_id", id);
		
		return ss.selectList(NameSpace+"selectPost", params);
	}
	
	@Override // 사용자가 쓴 글 개수
	public int countPost(String id) {
		return ss.selectOne(NameSpace+"countPost", id);
	}
	
	@Override // 사용자가 쓴 댓글 가져오기(페이징 구현)
	public List<CommDto> selectComm(String id, int page){
		
		int startRow = (page - 1) * 5;
		int endRow = startRow + 5;
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("writter", id);
		
		return ss.selectList(NameSpace+"selectComm", params);
	}
	
	@Override // 사용자가 쓴 댓글 개수
	public int countComm(String id) {
		return ss.selectOne(NameSpace+"countComm", id);
	}
	
	@Override // 회원 탈퇴
	public void deleteMember(String id) {
		ss.delete(NameSpace+"deleteMember", id);
	}
	
	@Override // 회원정보 수정
	public void updateMember(MemberDto dto) {
		ss.update(NameSpace+"updateMember", dto);
	}
	
	@Override //로그인
	public MemberDto login(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		
		return ss.selectOne(NameSpace+"checkLogin", map);
	}
	
	@Override // 아이디 중복 확인. true면 중복.
	public boolean isIdDuplicate(String id) {
		int result = ss.selectOne(NameSpace+"checkIdDuplicate", id);
		
		return result > 0 ? true : false;
	}
	
	@Override // 회원가입
	public void insertOneMember(MemberDto dto) {
		ss.insert(NameSpace+"insertOneMember", dto);
	}
	
	@Override // 아이디로 회원정보 가져오기
	public MemberDto selectOneMember(String id) {
		return ss.selectOne(NameSpace+"selectOneMember", id);
	}
}
