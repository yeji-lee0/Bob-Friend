package team_project.aspect;

import java.nio.file.AccessDeniedException;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import team_project.admin.DTO.AdminDto;
import team_project.member.DTO.MemberDto;
import team_project.post.DAO.PostDao;
import team_project.post.DTO.PostDto;

@Aspect
@Component
public class PostAspect {
	
	@Autowired
	private PostDao postDao;
	
	@Pointcut("execution(* team_project.post.controller.PostController.postUpdate*(..)) "
			+ "|| execution(* team_project.post.controller.PostController.postDelete(..))")
    public void postModification() {}
	
	
	@Before("postModification()")
    public void checkPostWriter(JoinPoint joinPoint) throws AccessDeniedException {
		
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser"); // 세션에서 로그인한 회원 정보 가져오기
		
		Object[] args = joinPoint.getArgs(); 	// 메서드의 매개변수들
	    int post_id = (int) args[0]; 			// 메서드의 첫번째 매개변수가 post_id
	    PostDto post = postDao.selectOnePost(post_id); // 글번호에 해당하는 글 정보 가져오기
        
	    // 삭제 요청 처리
	    if (joinPoint.getSignature().getName().startsWith("postDelete")) {
	        // 일반 회원의 경우
	        if (post == null || !post.getWriter_id().equals(loginUser.getId())) {
	            throw new AccessDeniedException("작성자만 삭제할 수 있습니다.");
	        }
	    }
	    
	    // 수정 요청 처리
	    if (joinPoint.getSignature().getName().startsWith("postUpdate")) {
	        // 일반 회원
	        if (post == null || !post.getWriter_id().equals(loginUser.getId())) {
	            throw new AccessDeniedException("작성자만 수정할 수 있습니다.");
	        }
	    }
    }
	
	
	
	
}
