package team_project.member.DTO;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String email;
	private String gender;
	private String passport_number;
	private Date reg_date;
	private int postCount;    // 글수
	private int commCount; // 댓글수
	

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	

	




	public MemberDto(String id, String pw, String name, Date birth, String email, String gender, String passport_number,
			Date reg_date, int postCount, int commCount) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.passport_number = passport_number;
		this.reg_date = reg_date;
		this.postCount = postCount;
		this.commCount = commCount;
	}







	public String getPassport_number() {
		return passport_number;
	}







	public void setPassport_number(String passport_number) {
		this.passport_number = passport_number;
	}







	public int getPostCount() {
		return postCount;
	}


	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}


	public int getCommCount() {
		return commCount;
	}


	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}


	public Date getReg_date() {
		return reg_date;
	}



	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
}