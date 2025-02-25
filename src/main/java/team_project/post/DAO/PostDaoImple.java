package team_project.post.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import team_project.post.DTO.PostDto;



public class PostDaoImple implements PostDao{
	
	
	SqlSession ss;
	private static final String NameSpace = "postMapper.";

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	

	@Override// 원하는 개수만큼 글 가져오기(페이징 구현)
	public List<PostDto> getPosts(String city, String f_name, int page) {
		int startRow = (page - 1) * 10;
		int endRow = startRow + 10;
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("city", city);
		params.put("f_name", f_name);
		
		return ss.selectList(NameSpace+"getPostsByCityF_nameIndex", params);
	}
	
	@Override // 게시글 총 개수
	public int getCountPosts(String city, String f_name ) {
		
		Map<String, String> params = new HashMap<>();
		params.put("city", city);
		params.put("f_name", f_name);
		return ss.selectOne(NameSpace+"countPostsBySearch", params);
	}
	
	@Override //지역과 메뉴로 글 검색
	public List<PostDto> selectPostByCityF_name(PostDto postDto) {
		return ss.selectList(NameSpace+"selectPostByCityF_name", postDto);
	}
	@Override // 지역으로 글 검색
	public List<PostDto> selectPostByCity(String city){
		return ss.selectList(NameSpace+"selectPostByCity", city);
	}
	
	@Override // 메뉴로 글 검색
	public List<PostDto> selectPostByF_name(String f_name) {
		return ss.selectList(NameSpace+"selectPostByF_name", f_name);
	}

	@Override // 모든 글 가져오기
	public List<PostDto> selectAll() {
		return ss.selectList(NameSpace + "selectAllPost");
	}
	@Override // 글 하나 가져오기
	public PostDto selectOnePost(int post_id) {
		return ss.selectOne(NameSpace+"selectOnePost", post_id);
	}
	@Override // 글 쓰기
	public int insertPost(PostDto postDto) {
		int result = ss.update(NameSpace+"insertPost", postDto);
		return result;
	}
	@Override // 글 수정
	public int updatePost(PostDto postDto) {
		int result = ss.update(NameSpace+"updatePost", postDto);
		return result;
	}
	@Override //글 삭제
	public int deletePost(int post_id) {
		int result = ss.delete(NameSpace+"deletePost", post_id);
		return result;
	}

	


}
