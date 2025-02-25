package team_project.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import team_project.exception.MemberSecurityException;

import javax.servlet.http.HttpSession;
 
@Aspect
@Component
public class MemberSecurityAspect {

	// 해당 컨트롤러의 메서드에 적용. 
	@Before(" ( execution(* team_project.post.controller.PostController.*(..)) && !execution(* team_project.post.controller.PostController.postList(..)) ) "
	        + "|| execution(* team_project.member.controller.MemberController.*Profile*(..)) "
	        + "|| execution(* team_project.member.controller.MemberController.likeFood(..)) ")
    public void checkLogin(JoinPoint joinPoint) {
		 //System.out.println("AOP Triggered: " + joinPoint.getSignature());
		 
        // HttpSession을 요청에서 가져오기
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = attributes.getRequest().getSession(false);

        if (session == null || session.getAttribute("loginUser") == null) {
            throw new MemberSecurityException("로그인 후 이용 가능합니다.");
        }
        
    }
}