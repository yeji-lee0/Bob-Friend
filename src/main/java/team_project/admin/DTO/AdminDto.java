package team_project.admin.DTO;

import java.util.Date;

public class AdminDto {
	String id;
	String pwd;
	String name;
	String gender;
	String part;
	String email;
	String phone;
	Date reg_date;
	int approval=0;

	public AdminDto() {
		// TODO Auto-generated constructor stub
	}

	public AdminDto(String id, String pwd, String name, String gender, String part, String email, String phone,
			Date reg_date, int approval) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.part = part;
		this.email = email;
		this.phone = phone;
		this.reg_date = reg_date;
		this.approval = approval;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getApproval() {
		return approval;
	}

	public void setApproval(int approval) {
		this.approval = approval;
	}
	
}
