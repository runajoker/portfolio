package net.msg.em;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.TeamVO;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	// sh modify 2016.12.12 11:40
	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		
		
		List<MatchVO> list = new ArrayList<MatchVO>();
		List<TeamVO> teamList = new ArrayList<TeamVO>();
		List<ArticleVO> articleList = new ArrayList<ArticleVO>();
		List<ArticleVO> articleList2 = new ArrayList<ArticleVO>();
		List<ArticleVO> articleList3 = new ArrayList<ArticleVO>();
		
		try {
			list = mainService.getMatchingList();
			teamList = mainService.getTeamList();
			articleList = mainService.getArticleList();
			articleList2 = mainService.getArticleList2();
			articleList3 = mainService.getArticleList3();
			logger.info(list.toString());
			ModelAndView mav = new ModelAndView("main");
			mav.addObject("list", list);
			mav.addObject("teamList", teamList);
			logger.info(articleList.toString());
			mav.addObject("articleList", articleList);
			mav.addObject("articleList2", articleList2);
			mav.addObject("articleList3", articleList3);
			
			
			return mav;
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "리스트가 없습니다..");
			mav.addObject("url", "../");
			return mav;
		}
		/*
		
		if (session.getAttribute("memberInfo") == null) {
			return new ModelAndView("main");
		} else {
			MemberVO vo = (MemberVO) session.getAttribute("memberInfo");
			String cnt = mainService.getCountNewMessage(vo.getM_no());

			ModelAndView mav = new ModelAndView("main");
			mav.addObject("cnt", cnt);

			return mav;
		}*/
	}
}
