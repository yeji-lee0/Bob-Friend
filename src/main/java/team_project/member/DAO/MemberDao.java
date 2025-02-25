package team_project.member.DAO;

import java.util.List;

import team_project.food.DTO.FoodDto;
import team_project.member.DTO.MemberDto;
import team_project.post.DTO.CommDto;
import team_project.post.DTO.PostDto;

public interface MemberDao {

	void insertOneMember(MemberDto dto);

	boolean isIdDuplicate(String id);

	MemberDto login(String id, String pw);

	void updateMember(MemberDto dto);

	void deleteMember(String id);

	List<CommDto> selectComm(String id, int page);

	int countComm(String id);

	List<PostDto> selectPost(String id, int page);

	int countPost(String id);

	List<MemberDto> selectMembers(int page);

	int countMembers();

	void likeFood(String member_id, String f_name);

	void deleteLikeFood(String member_id, String f_name);

	boolean checkLikeFood(String member_id, String f_name);

	List<FoodDto> getLikeList(String member_id);

	MemberDto selectOneMember (String id);

}
