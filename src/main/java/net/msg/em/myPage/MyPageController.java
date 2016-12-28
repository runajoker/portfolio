package net.msg.em.myPage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.vo.MemberVO;


@Controller
@RequestMapping("myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class); 

	@Autowired
	private MyPageService myPageService;
	
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public ModelAndView myPageGet(HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		MemberVO memberVO = myPageService.getMember(memberInfo.getM_no());
		logger.info("get : " + memberInfo.toString());
		
		return new ModelAndView("myPage/myPage", "memberVO", memberVO);
	}
	

	@RequestMapping(value = "/", method=RequestMethod.POST)
	public ModelAndView myPagepost(HttpSession session){
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		try{
			MemberVO memberVO = myPageService.getMember(memberInfo.getM_no());
			logger.info("post : " + memberVO.toString());
			//myPageService.memberInfo(memberVO);
			
			
			
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "성공");
			mav.addObject("url", "../");
			return mav;
			
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "실패");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	
	
	@RequestMapping(value = "update", method=RequestMethod.GET)
	public ModelAndView myPageUpdateGet(HttpSession session) throws Exception{
		
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		MemberVO memberVO = myPageService.getMember(memberInfo.getM_no());
		memberVO.setM_no(memberInfo.getM_no());
		logger.info("update get : " + memberVO.toString());
		
		return new ModelAndView("myPage/myPageUpdate", "memberVO", memberVO);
		
		/*
		logger.info("update!#@!#$!#$@!#");
		logger.info(memberVO.toString());
		return new ModelAndView("myPage/myPageUpdate", "memberVO", memberVO);*/
	}
	
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public ModelAndView myPageUpdatePost(@ModelAttribute MemberVO memberVO, HttpSession session,@RequestParam String m_id){
		try{
			
			/*
			MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
			
			MemberVO memberVO = myPageService.getMember(memberInfo.getM_no());
			
			*/
			logger.info(m_id.toString());
			MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
			memberVO.setM_no(memberInfo.getM_no());
			logger.info(memberInfo.toString());
	
			logger.info("update post : " + memberVO.toString());
			
			myPageService.updateMember(memberVO);
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "수정 성공");
			mav.addObject("url", "../myPage/");
			return mav;
			/*
			UserVO userInfo = (UserVO) session.getAttribute("userInfo");
			UserVO userVO = new UserVO();
			userVO.setUser_id(userInfo.getUser_id());
			memoVO.setUserVO(userVO);
			
			memoService.insertMemo(memoVO);
			*/
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "수정 실패");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	@RequestMapping(value = "delete", method=RequestMethod.GET)
	public ModelAndView myPageDeleteGet(HttpSession session) throws Exception{
		
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		MemberVO memberVO = myPageService.getMember(memberInfo.getM_no());
		memberVO.setM_no(memberInfo.getM_no());
		logger.info("delete get : " + memberVO.toString());
		
		return new ModelAndView("myPage/myPageDelete", "memberVO", memberVO);
		
		/*
		logger.info("update!#@!#$!#$@!#");
		logger.info(memberVO.toString());
		return new ModelAndView("myPage/myPageUpdate", "memberVO", memberVO);*/
	}
	
	@RequestMapping(value = "delete", method=RequestMethod.POST)
	public ModelAndView myPageDeletePost(@ModelAttribute MemberVO memberVO, HttpSession session,@RequestParam int m_no, @RequestParam String m_pw){
		logger.info("aa : " + memberVO.toString());
		try{
			
			memberVO.setM_no(m_no);
			memberVO.setM_pw(m_pw);
			
			
			logger.info("memberVO : " + memberVO.toString());
			myPageService.deleteMem(memberVO);
		
			
			session.invalidate();
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "탈퇴 성공");
			mav.addObject("url", "../");
			return mav;
		
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "비밀번호를 확인하세요");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
}
