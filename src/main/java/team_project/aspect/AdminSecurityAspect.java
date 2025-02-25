package team_project.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import team_project.admin.DTO.AdminDto;
import team_project.exception.AdminSecurityException;
import team_project.exception.SuperAdminSecurityException;

@Aspect
@Component
public class AdminSecurityAspect {
		// 관리자 로그인하지 않으면 관리자 홈, 로그인, 회원가입만 들어갈 수 있다.
	    @Before("!execution(* team_project.admin.controller.AdminMemberController.*Join*(..))"
	    	+ "&& !execution(* team_project.admin.controller.AdminMemberController.*Login*(..))"
	       + "&& execution(* team_project.admin.controller.AdminMemberController.*(..))"
	       + "|| execution(* team_project.admin.controller.AdminPostController.*(..))"
	       + "|| execution(* team_project.admin.controller.AdminManageController.*(..))"
	       + "|| execution(* team_project.admin.controller.AdminFoodController.*(..))"  )
	    public void checkAdminLogin(JoinPoint joinPoint) {
	        // HttpSession을 요청에서 가져오기
	        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
	        HttpSession session = attributes.getRequest().getSession(false);

	        if (session == null || session.getAttribute("loginAdmin") == null) {
	            throw new AdminSecurityException("관리자 로그인 후 접근 가능합니다.");
	        }
	    }
	    
	    private boolean isSuperAdmin(HttpSession session) {
	        // 세션에서 로그인한 관리자 정보를 가져와서 확인
	    	AdminDto loginAdmin = (AdminDto) session.getAttribute("loginAdmin");
	        return loginAdmin.getId().equals("superAdmin");
	    }
	    
	    // 최고 관리자만 들어갈 수 있게 함
	    @Before("execution(* team_project.admin.controller.AdminMemberController.adminList(..))")
	    public void checkSuperAdmin(JoinPoint joinPoint) {
	        // HttpSession을 요청에서 가져오기
	        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
	        HttpSession session = attributes.getRequest().getSession(false);

	        if (session == null || !isSuperAdmin(session)) {
	            throw new SuperAdminSecurityException("최고 관리자만 접근 가능합니다.");
	        }
	    }
}
