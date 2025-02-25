package team_project.admin.controller;

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

import team_project.post.DAO.CommDao;
import team_project.post.DAO.PostDao;
import team_project.post.DTO.CommDto;
import team_project.post.DTO.PostDto;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
	@Autowired
	PostDao dao;
	@Autowired
	CommDao commdao;
	
//게시판-------------------------------------------------------------------------
	@RequestMapping("/list")
	public String postList(
							@RequestParam(defaultValue = "") String city,
							@RequestParam(defaultValue = "") String f_name,
							@RequestParam(defaultValue = "1") int page,
							Model model,
							HttpSession session) {

		 
		// 검색어 포함 페이징 구현해 전체 글 목록 보기
		List<PostDto> posts = dao.getPosts(city, f_name, page);
		
		int countPosts = dao.getCountPosts(city, f_name);
		int totalPages = (int) Math.ceil((double) countPosts / 10);
		
		model.addAttribute("posts", posts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		
		return "admin/post/list";
	}
	
//글쓰기-------------------------------------------------------------------------
	@RequestMapping("/insert")
	public String insertPost() {
		// 글 작성 페이지로 가기
		return"admin/post/insert";
	}
	
	@PostMapping("/insertForm")
	public String postInsertForm(@ModelAttribute PostDto postDto) {
		// 작성한 글 받아서 처리
		postDto.setNotice(postDto.getNotice() != null ? "1" : "0");
		dao.insertPost(postDto);
		Long post_id = (long) postDto.getPost_id();
		return "redirect:detail?post_id="+post_id;
	}
	
//글 수정------------------------------------------------------------------------
	@GetMapping("/update")
	public String postUpdate(@RequestParam int post_id, 
							Model model) {
		
		// 글 수정 페이지 보여주기
		model.addAttribute("postData", dao.selectOnePost(post_id));
		return "admin/post/update";
	}
	
	
	@PostMapping("/updateForm")
	public String postUpdateForm(@RequestParam int post_id,
								@ModelAttribute PostDto postDto,
		                        HttpSession session) {
		
		// 수정된 글 받아서 처리
		postDto.setNotice(postDto.getNotice() != null ? "1" : "0");
		dao.updatePost(postDto);
		return "redirect:detail?post_id="+post_id;
	}
	
//글 삭제----------------------------------------------------------------------------
	@GetMapping("/delete")
	public String postDelete(@RequestParam int post_id) {
		// 글 삭제
		dao.deletePost(post_id);
		return "redirect:list";
	}
	// 글 보기------------------------------------------------------------------------
	@GetMapping("/detail")
	public String postDetail(@RequestParam int post_id, Model model) {
		// 글아이디에 해당하는 게시글과 댓글 가져오기

		model.addAttribute("postData", dao.selectOnePost(post_id));  
		model.addAttribute("comments", commdao.getCommentsByPostId(post_id));

		return "admin/post/detail";
	}
	
	//댓글 추가
	@PostMapping("/commadd")
	public String addComm(@RequestParam int post_id,
							@ModelAttribute CommDto commdto,
							@ModelAttribute PostDto dto) {
		commdto.setPost_id(post_id);
		commdao.addComm(commdto);

		return "redirect:/admin/post/detail?post_id=" + commdto.getPost_id(); 
	}
	//댓글 수정
	@PostMapping("/commedit")
	public String editComm(@RequestParam int post_id,
							@RequestParam int comm_id,
							@ModelAttribute CommDto commdto,
	                        HttpSession session) {

		commdto.setPost_id(post_id);
		commdao.updateComm(commdto);
		return "redirect:/admin/post/detail?post_id=" + commdto.getPost_id(); 
	}
	//댓글 삭제
	@PostMapping("/deleteComm")
	public String deleteComm(@RequestParam int comm_id,
							@RequestParam int post_id,
							@RequestParam String writter,
							@ModelAttribute CommDto commdto ) {
		commdto.setPost_id(post_id);
		commdao.deleteComm(post_id, writter, comm_id);
		return "redirect:/admin/post/detail?post_id=" + commdto.getPost_id();
	}
	
	
	
}
