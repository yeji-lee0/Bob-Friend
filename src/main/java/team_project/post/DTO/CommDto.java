package team_project.post.DTO;

import java.util.Date;

public class CommDto {
	private int post_id;
	private int comm_id;
	private String writter;
	private String content;
	private Date uploadtime;


	public CommDto() {}

	public CommDto(int post_id,int comm_id,String writter,String content,Date uploadtime) {
		super();
		this.post_id=post_id;
		this.comm_id=comm_id;
		this.writter=writter;
		this.content=content;
		this.uploadtime=uploadtime;			
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int postid) {
		this.post_id = postid;
	}

	public int getComm_id() {
		return comm_id;
	}

	public void setComm_id(int comm_id) {
		this.comm_id = comm_id;
	}

	public String getWritter() {
		return writter;
	}

	public void setWritter(String writter) {
		this.writter = writter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpload_time() {
		return uploadtime;
	}

	public void setUpload_time(Date uploadtime) {
		this.uploadtime = uploadtime;
	}
}