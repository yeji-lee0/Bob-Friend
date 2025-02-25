package team_project.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

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
import team_project.food.DTO.FoodDto;
import team_project.member.DAO.MemberDao;
import team_project.member.DTO.MemberDto;
import team_project.post.DTO.CommDto;
import team_project.post.DTO.PostDto;

@Controller
public class MemberController {
	@Autowired
	MemberDao dao;
	@Autowired
	AdminDao adminDao;


	// 회원정보  보기---------------------------------------------------------------------
		@GetMapping("/member/profile")
		public String viewProfile(	@RequestParam(defaultValue = "1") int p_page,
																@RequestParam(defaultValue = "1") int c_page,
																@RequestParam(required = false) String id,
																HttpSession session, 
																Model model) {
			MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");	// 세션에서 사용자 정보 가져오기
			String loginUserId = loginUser.getId();
			
			if (id == null || id.equals(loginUserId)) {
				id = loginUserId;
			}
			MemberDto memberDto = dao.selectOneMember(id);
			model.addAttribute("user", memberDto); // 회원정보
			
			List<FoodDto> likeFoodList = dao.getLikeList(id);	// 회원이 좋아요한 음식 목록
			model.addAttribute("likeFoodList", likeFoodList);
			
			List<PostDto> posts = dao.selectPost(id, p_page);		// 글 목록 가져오기
			int countPost = dao.countPost(id);
			int p_totalPages = (int) Math.ceil((double) countPost / 5);	// 글 총 페이지 수
			
			model.addAttribute("posts", posts);
			model.addAttribute("p_currentPage", p_page);
			model.addAttribute("p_totalPages", p_totalPages);
			
			List<CommDto> comments = dao.selectComm(id, c_page);	// 댓글 목록 가져오기
			int countComm = dao.countComm(id);
			int c_totalPages = (int) Math.ceil((double) countComm / 5);	// 댓글 총 페이지 수
			
			model.addAttribute("comments", comments);
			model.addAttribute("c_currentPage", c_page);
			model.addAttribute("c_totalPages", c_totalPages);
			
			// 회원정보 페이지 보여주기
			return "member/profile";
		}
	
	@PostMapping("/member/likeFood") // 음식 좋아요 취소 기능
	public String likeFood(	@RequestParam String member_id,
							@RequestParam String f_name
							) {
		
		
			dao.deleteLikeFood(member_id, f_name);
		
		
		return "redirect:profile";
	}
	
	@GetMapping("/member/profile_update")
	public String viewProfileUpdate() {
		// 회원정보 수정하는 페이지 보여주기
		return "member/profile_update";
	}

	@PostMapping("/member/updateForm")
	public String updateProfile(@ModelAttribute MemberDto memDto, HttpSession session) {
		// 회원정보 수정 요청 처리
		dao.updateMember(memDto);

		// 수정된 회원정보를 세션에 업데이트
		session.setAttribute("loginUser", memDto);

		return "redirect:profile";
	}
	
	@PostMapping("/member/delete")
	public String deleteMember(@RequestParam String id,
			 					HttpSession session,
								RedirectAttributes redirectAttributes) {
		
		dao.deleteMember(id); // 탈퇴 처리
		session.invalidate(); // 세션 무효화
		redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다."); // Flash scope에 메시지 저장
		return "redirect:/country";
	}
	

	// 로그인 ---------------------------------------------------------------------
	@GetMapping("/member/login") // 로그인 페이지 보여주기
	public String memberLogin() {
		return "member/login";
	}

	
	@PostMapping("/member/loginCheck") // 로그인 확인 
	public String memberLoginCheck(@RequestParam String id,
			@RequestParam String pw, 
			Model model, 
			HttpSession session) { 

		MemberDto memDto = dao.login(id, pw); 

		if (memDto != null) { // 로그인 성공, 세션에 회원 정보 저장
			session.setAttribute("loginUser", memDto); 
			session.setMaxInactiveInterval(30 * 60); // 세션 유효 기간을 30분으로 설정
			return "redirect:/country"; // 로그인 후이동할 페이지 
		}else { // 로그인 실패, 에러 메시지 추가 
			model.addAttribute("loginError","아이디 또는 비밀번호가 틀렸습니다."); 
			return "member/login"; // 로그인 페이지로 돌아가기 
		}

	}
	 

	// 로그아웃---------------------------------------------------------------------
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "redirect:/country"; // 로그아웃 후 이동할 페이지
	}

	// 회원가입--------------------------------------------------------------------
	@RequestMapping("/member/join")
	public String memberJoin() {
		// 회원가입 페이지 보여주기
		return "member/join";
	}

	@GetMapping("/member/idCheck")
	public String idCheck(@RequestParam String id, Model model) {
		// 아이디 중복 확인
		String result = (dao.isIdDuplicate(id) || adminDao.isIdDuplicate(id)  )? "중복된 아이디입니다." : "사용가능한 아이디입니다.";
		model.addAttribute("idCheckResult", result);
		return "member/join";
	}

	@PostMapping("/member/joinForm")
	public String memberJoinOk(@ModelAttribute MemberDto memDto,
								RedirectAttributes redirectAttributes) {
		// 회원가입 처리
		dao.insertOneMember(memDto);
		
		redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다."); 
		return "redirect:/member/login";
	}
}
