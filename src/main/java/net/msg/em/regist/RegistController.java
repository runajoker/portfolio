package net.msg.em.regist;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.vo.MemberVO;

@Controller
@RequestMapping("regist")
public class RegistController {
	private static final Logger logger = LoggerFactory.getLogger(RegistController.class);
	@Autowired
	private RegistService registService;
	
	@RequestMapping("/")
	public String registGET(){
		return "regist/regist";
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ModelAndView registPOST(MemberVO memberVO){
		
		try {
			int check = registService.insertMember(memberVO);
			
			if(check == 0){
				throw new RuntimeException("회원가입 실패");
			}
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "회원가입 완료");
			mav.addObject("url", "/em/");
			return mav;
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "회원가입 실패..");
			mav.addObject("url", "/em/'");
			return mav;
		}
	}
	
	@RequestMapping(value="kakaoRegist", method=RequestMethod.POST)
	public ModelAndView kakaoRegist(MemberVO memberVO){
		try {
			int check = registService.insertKakaoMember(memberVO);
			if(check == 0){
				throw new RuntimeException("추가정보 삽입실패");
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "추가정보 적용 완료!!! 다시 로그인해주세요.");
				mav.addObject("url", "../");
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "회원가입 실패");
			mav.addObject("url", "/em/'");
			return mav;
		}
	}
}
