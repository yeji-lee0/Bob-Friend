package team_project.post.DAO;

import java.util.List;

import team_project.post.DTO.PostDto;

public interface PostDao {

	List<PostDto> selectAll();

	PostDto selectOnePost(int post_id);

	int updatePost(PostDto postDto);

	int deletePost(int post_id);

	int insertPost(PostDto postDto);

	List<PostDto> selectPostByCity(String city);

	List<PostDto> selectPostByF_name(String f_name);

	List<PostDto> selectPostByCityF_name(PostDto postDto);

//	int getCountPosts() ;

//	List<PostDto> getPosts(int page, int size);

	List<PostDto> getPosts(String city, String f_name, int page);

	int getCountPosts(String city, String f_name);

}
