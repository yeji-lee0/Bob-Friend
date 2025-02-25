package team_project.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import team_project.admin.DAO.AdminDao;


@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	
	@Autowired
	AdminDao dao;
	
	// 관리자 홈
	@GetMapping({"","/"})
	public String adminHome() {
		return "admin/home";
	}
	
	
}
