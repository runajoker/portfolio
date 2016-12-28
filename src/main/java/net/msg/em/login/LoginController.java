package net.msg.em.login;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.MainController;
import net.msg.em.vo.MemberVO;

@Controller
@RequestMapping("login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String loginGet(){
		return "login/login";
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ModelAndView loginPost(MemberVO memberVO, HttpSession session){
		try {
			
			MemberVO memberInfo = loginService.getMember(memberVO);
			
			if(memberInfo == null){
				throw new RuntimeException();
			}
			
			session.setAttribute("memberInfo", memberInfo);
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "로그인 성공");
			mav.addObject("url", "../");
			return mav;
			
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "아이디 혹은 비밀번호가 틀립니다.");
			mav.addObject("url", "./");
			return mav;
		}
	}
	
	@RequestMapping(value="kakaoLogin", method=RequestMethod.GET)
	public ModelAndView kakaologin(String id, String name, HttpSession session){
		
		MemberVO memberVO = new MemberVO();
		memberVO.setM_id(id); 
		memberVO.setM_name(name);
		
		try {
			MemberVO memberInfo = loginService.getKaKaoMember(memberVO);
			
			if(memberInfo == null){
				ModelAndView mav = new ModelAndView("regist/kakaoRegist");
				mav.addObject("memberVO", memberVO);
				return mav;
			}
			session.setAttribute("memberInfo", memberInfo);
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "로그인 성공");
			mav.addObject("url", "../");
			return mav;
			
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "아이디 혹은 비밀번호가 틀립니다.");
			mav.addObject("url", "./");
			
			return mav;
		}
	}
	@RequestMapping("out")
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		ModelAndView mav = new ModelAndView("result");
		mav.addObject("msg", "로그아웃되셨습니다");
		mav.addObject("url", "../");
		return mav;
	}
}
