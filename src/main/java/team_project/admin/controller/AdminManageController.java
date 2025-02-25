package team_project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team_project.admin.DAO.AdminDao;
import team_project.admin.DTO.AdminDto;
import team_project.member.DAO.MemberDao;
import team_project.member.DTO.MemberDto;

@Controller
@RequestMapping("/admin/manage")
public class AdminManageController {
	@Autowired
	AdminDao adminDao;
	@Autowired
	MemberDao memberDao;
	
	// 회원 목록---------------------------------------------------
	@GetMapping("/memberList")
	public String memberList(@RequestParam(defaultValue = "1") int page,
							Model model) {
		// 회원정보, 글수, 댓글 수 
		List<MemberDto> members = memberDao.selectMembers(page);
		
		int countAdmins = adminDao.countAdmins();
		int totalPages = (int) Math.ceil((double) countAdmins / 10);

		model.addAttribute("members", members);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		return "admin/manage/memberList";
	}
	
	// 회원 탈퇴 기능
	@PostMapping("/deleteMember")
	public String deleteMember(@RequestParam String id) {
		memberDao.deleteMember(id); // 탈퇴 처리
		return "redirect:/admin/manage/memberList";
	}
	
//관리자 목록-----------------------------------------------------
	@GetMapping("/adminList")
	public String adminList(@RequestParam(defaultValue = "1") int page,
													Model model) {
		List<AdminDto> admins =  adminDao.selectAdmins(page);

		int countAdmins = adminDao.countAdmins();
		int totalPages = (int) Math.ceil((double) countAdmins / 10);

		model.addAttribute("admins", admins);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "admin/manage/adminList";
	}

	// 관리자 승인
	@PostMapping("/setApproval")	
	public String adminApproval(@RequestParam String id) {
		adminDao.setApproval(id);
		return "redirect:/admin/manage/adminList";
	}
}
