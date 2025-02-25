package team_project.post.DTO;

import java.util.Date;

public class PostDto {
	private int post_id;
	private String writer_id;
	private String city;
	private String f_name;
	private String title;
	private String content;
	private Date upload_time;
	private String notice;
	private String flight_number;
	
	public PostDto() {
		// TODO Auto-generated constructor stub
	}

	

	


	public PostDto(int post_id, String writer_id, String city, String f_name, String title, String content,
			Date upload_time, String notice, String flight_number) {
		super();
		this.post_id = post_id;
		this.writer_id = writer_id;
		this.city = city;
		this.f_name = f_name;
		this.title = title;
		this.content = content;
		this.upload_time = upload_time;
		this.notice = notice;
		this.flight_number = flight_number;
	}






	public String getFlight_number() {
		return flight_number;
	}






	public void setFlight_number(String flight_number) {
		this.flight_number = flight_number;
	}






	public String getNotice() {
		return notice;
	}



	public void setNotice(String notice) {
		this.notice = notice;
	}



	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(Date upload_time) {
		this.upload_time = upload_time;
	}
	
	
}
