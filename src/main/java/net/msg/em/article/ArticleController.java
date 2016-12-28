package net.msg.em.article;

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
@RequestMapping("community/{b_no}/{pg}/{art_no}")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
		
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value="/")
	public ModelAndView getDetail(@PathVariable long art_no){
		
		try {
			ArticleVO articleVO = articleService.getArticleDetail(art_no);
			
			articleService.updateReadcount(art_no);
			
			ModelAndView mav = new ModelAndView("article/detailArticle");
			mav.addObject("articleVO", articleVO);
			return mav;
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "게시물이 없습니다..");
			mav.addObject("url", "../");
			return mav;
		}
	}
	@RequestMapping(value="update")
	public ModelAndView updateGET(@PathVariable long art_no, HttpSession session){
		try {
			ArticleVO articleVO = articleService.getArticleDetail(art_no);
			MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
			if(articleVO.getM_no()==memberInfo.getM_no()){
				ModelAndView mav = new ModelAndView("article/updateArticle");
				mav.addObject("articleVO", articleVO);
				return mav;
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "글쓴이가 아니에요~");
				mav.addObject("url", "../");
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "수정 실패");
			mav.addObject("url", "../");
			return mav;
		}
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public ModelAndView updatePOST(@PathVariable long art_no, ArticleVO articleVO, HttpSession session){
		try {
			MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
				int up_check = articleService.updateArticle(articleVO);
					if(up_check==1){
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "수정완료");
						mav.addObject("url", "../");
						return mav;
					}else{
						throw new RuntimeException();
					}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "수정 실패");
			mav.addObject("url", "../");
			return mav;
		}
	}
	@RequestMapping(value="delete")
	public ModelAndView delete(@PathVariable long art_no, HttpSession session){
		try {
			ArticleVO articleVO = articleService.getArticleDetail(art_no);
			MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
			if(articleVO.getM_no()==memberInfo.getM_no()){
				int del_check = articleService.deleteArticle(art_no);
				if(del_check==1){
					ModelAndView mav = new ModelAndView("result");
					mav.addObject("msg", "삭제되었습니다");
					mav.addObject("url", "../");
					return mav;
				}else{
					throw new RuntimeException();
				}
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "글쓴이가 아니에요~");
				mav.addObject("url", "../");
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "삭제 실패");
			mav.addObject("url", "../");
			return mav;
		}
	}
}
