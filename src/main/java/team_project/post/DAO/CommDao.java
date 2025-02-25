package team_project.post.DAO;

import java.util.List;

import team_project.post.DTO.CommDto;

public interface CommDao {	                
	   List<CommDto> getCommentsByPostId(int post_id); 
	   void addComm(CommDto comm);					
	   void updateComm(CommDto comm);           
	   void deleteComm(int post_id,String writter,int comm_id);              
	
}
