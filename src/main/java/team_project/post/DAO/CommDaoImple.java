package team_project.post.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import team_project.post.DTO.CommDto;

public class CommDaoImple implements CommDao{
	
	SqlSession ss;
	private static final String Namespace = "commMapper.";
	
	public void setSs(SqlSession ss) {
		this.ss=ss;
	}

	
	public List<CommDto> getCommentsByPostId(int postid) {
		
		return ss.selectList(Namespace+ "getAllComments",postid);
		
	}

	
	public void addComm(CommDto comm) {
		ss.insert(Namespace+"insertComm",comm);
		
	}


	public void updateComm(CommDto comm) {
		ss.update(Namespace+"updateComm",comm);
		
	}


	@Override
	public void deleteComm(int post_id, String writter, int comm_id) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("post_id", post_id);	    
	    params.put("writter", writter);
	    params.put("comm_id", comm_id);
	    ss.delete(Namespace+"deleteComm", params);
	}

}
