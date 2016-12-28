package net.msg.em.comment;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.community.CommunityService;
import net.msg.em.vo.CommentVO;

@Controller
@RequestMapping("community/{b_no}/{pg}/{art_no}/comment")
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Autowired
	private CommentService commentService;

	@Autowired
	private CommunityService communityService;

	@RequestMapping(value = "/insert",method=RequestMethod.POST)
	@ResponseBody
	public void insertComment(HttpServletRequest request) {
		CommentVO commentVO = new CommentVO();
		long art_no = Integer.parseInt(request.getParameter("art_no"));
		commentVO.setArt_no(art_no);
		commentVO.setCom_comment(request.getParameter("com_comment"));
		commentVO.setM_no(Long.parseLong(request.getParameter("m_no")));
		
		logger.info("comment insert 수행중");
		logger.info("commentVO : "+commentVO.toString());
		try {
			commentService.insertComment(commentVO);
			communityService.increaseCommentCount(art_no);
		} catch (Exception e) {
			logger.info("에러 : "+e.toString());
		}
	}

	@RequestMapping(value="/list",method=RequestMethod.POST,
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<CommentVO> getCommentList(HttpServletRequest request){
		int art_no = Integer.parseInt(request.getParameter("art_no"));
		logger.info("comment list 수행중 art_no : "+art_no);
		List<CommentVO> com_list = null;
		try {
			com_list = commentService.getCommentList(art_no);
			logger.info("com_list : "+com_list.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return com_list;
	}	
	
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public void deleteComment(HttpServletRequest request) {
		long art_no = Integer.parseInt(request.getParameter("art_no"));
		long com_no = Long.parseLong(request.getParameter("com_no"));
		logger.info("comment delete 수행중");
		logger.info("commentVO : "+request.getParameter("com_no"));
		try {
			commentService.deleteComment(com_no);
			communityService.decreaseCommentCount(art_no);
			
		} catch (Exception e) {
			logger.info("에러 : "+e.toString());
		}
		
	}
	
}
