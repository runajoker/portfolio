package net.msg.em.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.BoardVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.PageNation;

@Controller
@RequestMapping("community/{b_no}/{pg}")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
		
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private PageNation pageNation; 
	
	@RequestMapping(value="/")
	public ModelAndView boardGET(@PathVariable int b_no, @PathVariable long pg){
		try {
			
			BoardVO boardVO = communityService.getBoard(b_no);
			
			pageNation.process(b_no, pg);
			
			ModelAndView mav = new ModelAndView("community/board");
			mav.addObject("pageNation", pageNation);
			mav.addObject("boardVO", boardVO);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "해당페이지는 접속이 불가합니다.");
			mav.addObject("url", "../");
			return mav;
		}
	}
	
	@RequestMapping(value="insert")
	public String insertArticleGET(){
		return "community/insertArticle";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public ModelAndView insertArticlePOST(ArticleVO articleVO, HttpSession session){
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		articleVO.setM_no(memberInfo.getM_no());
		articleVO.setM_id(memberInfo.getM_id());
		articleVO.setM_name(memberInfo.getM_name());
		logger.info(articleVO.toString());
		try {
			int check = communityService.insertArticle(articleVO);

			if(check ==1){
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "입력 완료");
				mav.addObject("url", "../1/");
				return mav;
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "입력 실패..");
				mav.addObject("url", "../1/");
				return mav;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "입력 실패");
			mav.addObject("url", "../1/");
			return mav;
		}
	}
}
