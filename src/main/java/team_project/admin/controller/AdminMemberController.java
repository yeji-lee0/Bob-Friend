package team_project.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team_project.admin.DAO.AdminDao;
import team_project.admin.DTO.AdminDto;
import team_project.member.DAO.MemberDao;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired
	AdminDao dao;
	@Autowired
	MemberDao memberDao;
	
	// 관리자 정보 수정-----------------------------------------------------
	@GetMapping("/updateProfile")
	public String adminUpdateProfile() {
		return "admin/member/updateProfile";
	}

	@PostMapping("/updateProfileConfirm")
	public String adminUpdateProfileConfirm(@ModelAttribute AdminDto adminDto,
			HttpSession session) {
		dao.updateAdmin(adminDto);
		session.setAttribute("loginAdmin", adminDto);

		return "admin/member/updateProfile";
	}


	

	// 관리자 회원가입 페이지 보여주기--------------------------------------
	@GetMapping("/join")
	public String adminJoin() {
		return "admin/member/join";
	}

	// 아이디 중복 확인
	@GetMapping("/idCheck")
	public String adminJoinIdCheck(@RequestParam String id, Model model) {
		// 아이디 중복 확인
		String result = (dao.isIdDuplicate(id) || memberDao.isIdDuplicate(id) )? "중복된 아이디입니다." : "사용가능한 아이디입니다.";
		model.addAttribute("idCheckResult", result);
		return "admin/member/join";
	}

	// 관리자 회원가입 처리
	@PostMapping("/joinConfirm")
	public String adminJoinConfirm(@ModelAttribute AdminDto adminDto,
			RedirectAttributes redirectAttributes) {
		dao.insertOneAdmin(adminDto);
		redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다. 관리자 승인 후 로그인이 가능합니다."); 
		return "redirect:/admin/member/login";
	}

	// 로그인-------------------------------------------
	@GetMapping("/login")// 관리자 로그인 페이지 보여주기
	public String adminLogin() {
		return "admin/member/login";
	}

	@PostMapping("/loginConfirm") // 로그인 확인 
	public String adminLoginConfirm(@RequestParam String id,
			@RequestParam String pwd, 
			Model model, 
			HttpSession session) { 

		AdminDto adminDto = dao.login(id, pwd); 


		if (adminDto == null) {// 로그인 실패, 에러 메시지 추가 
			model.addAttribute("loginError","아이디 또는 비밀번호가 틀렸습니다."); 
			return "admin/member/login"; // 로그인 페이지로 돌아가기 
		}else if (adminDto.getApproval()  == 0) {
			model.addAttribute("loginError","관리자 승인이 되지 않았습니다."); 
			return "admin/member/login"; // 로그인 페이지로 돌아가기
		}else if (adminDto != null) { // 로그인 성공, 세션에 회원 정보 저장
			session.setAttribute("loginAdmin", adminDto); 
			session.setMaxInactiveInterval(30 * 60); // 세션 유효 기간을 30분으로 설정
			return "redirect:/admin"; // 로그인 후이동할 페이지 
		}

		return "admin/member/login";

	}

	// 로그아웃----------------------------------------------------
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "redirect:/admin"; // 로그아웃 후 이동할 페이지
	}
}
