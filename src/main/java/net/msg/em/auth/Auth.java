package net.msg.em.auth;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Auth implements Filter {
	private static Logger logger = LoggerFactory.getLogger(Auth.class);

	public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain chain) throws IOException, ServletException {
		logger.info("Auth.doFilter()가 수행되었습니다.");
		
		HttpServletRequest request = (HttpServletRequest) srequest;//다운 캐스팅
		HttpServletResponse response = (HttpServletResponse) sresponse;//다운 캐스팅
		
		HttpSession session = request.getSession();
		logger.info(session.toString());
		logger.info("uri : "+request.getRequestURI().trim());
		if(request.getRequestURI().trim().substring(request.getContextPath().length()).equals("/") || 
				//request.getRequestURI().trim().substring(0, "/resources/".length()).equals("/resources/") ||
				request.getRequestURI().trim().substring(request.getContextPath().length()).equals("/login/") || 
				request.getRequestURI().trim().substring(request.getContextPath().length()).equals("/regist/") || 
				request.getRequestURI().trim().substring(request.getContextPath().length()).equals("/login/kakaoLogin") || 
				request.getRequestURI().trim().substring(request.getContextPath().length()).equals("/regist/kakaoRegist") || 
				session.getAttribute("memberInfo") != null){
			chain.doFilter(request, response); 
			return;
		}else{
			request.setAttribute("msg", "먼저 로그인을 하십시오");
			request.setAttribute("url", "/em/");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/result.jsp");
			dispatcher.forward(request, response);
			return;
		}
	}

	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
}
