package net.msg.em.message;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.myPage.MyPageService;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.MessageVO;

@Controller
@RequestMapping("message")
public class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private MessageService messageService;
	@Autowired
	private MyPageService myPageService;

	/** 메세지 받기 **/
	@RequestMapping(value = "/reciveMsg/")
	public ModelAndView getMessageList(HttpSession session) {

		MemberVO vo = (MemberVO) session.getAttribute("memberInfo");
		List<MessageVO> list = new ArrayList<MessageVO>();
		list = messageService.getMessageList(vo.getM_no());

		return new ModelAndView("message/message", "list", list);
		
	}

	/** 메세지 상세보기 **/
	@RequestMapping(value = "/reciveMsg/{g_no}")
	public ModelAndView getDetailMessage(@PathVariable long g_no, HttpSession session) {
		messageService.checkMessageRefreshReadTime(g_no);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		MessageVO messageVO = new MessageVO();
		long tmp = memberVO.getM_no();
		messageVO.setM_no(Long.toString(memberVO.getM_no()));
		messageVO.setG_no(Long.toString(g_no));

		messageVO = messageService.getDetailMessage(messageVO);

		memberVO.setM_no(tmp);
		return new ModelAndView("/message/messagebody", "messageVO", messageVO);
	}

	/** 보낸 메세지 리스트 확인 **/
	@RequestMapping(value = "/sendMsg/")
	public ModelAndView getSendMessageList(HttpSession session) {
		logger.info("sendMsg process");

		MemberVO vo = (MemberVO) session.getAttribute("memberInfo");
		List<MessageVO> list = new ArrayList<MessageVO>();
		list = messageService.getSendMessageList(vo.getM_no());

		return new ModelAndView("message/sendmessage", "list", list);

	}

	/** 보낸 메세지 상세보기 **/
	@RequestMapping(value = "/sendMsg/{g_no}")
	public ModelAndView getDetailSendMessage(@PathVariable long g_no, HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		MessageVO messageVO = new MessageVO();
		long tmp = memberVO.getM_no();
		messageVO.setM_no(Long.toString(memberVO.getM_no()));
		messageVO.setG_no(Long.toString(g_no));

		messageVO = messageService.getDetailSendMessage(messageVO);

		memberVO.setM_no(tmp);
		return new ModelAndView("/message/sendmessagebody", "messageVO", messageVO);
	}

	/** 메세지 입력폼 이동 **/
	@RequestMapping(value = "/insert/{m_no}")
	public ModelAndView messageInserting(@PathVariable long m_no, HttpSession session, HttpServletRequest request) {
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		MessageVO messageVO = new MessageVO();

		if (request.getParameter("m_id") == null) {

		} else {
			messageVO.setM_no(Long.toString(m_no));
			messageVO.setG_send_no(Long.toString(memberVO.getM_no()));
			messageVO.setM_name(request.getParameter("m_name"));
			messageVO.setM_id(request.getParameter("m_id"));
			messageVO.setG_no(request.getParameter("g_no"));
		}

		return new ModelAndView("/message/insertform", "messageVO", messageVO);
	}
	
	@RequestMapping(value = "/write/")
	public ModelAndView messageInsert(HttpSession session, HttpServletRequest request) {

		return new ModelAndView("/message/insertform2");
	}
	
	@RequestMapping(value="/search")
	public ModelAndView searchMemberId(HttpSession session) {
		
		logger.info("search");
		return new ModelAndView("/message/searchform");
	}
	
	@RequestMapping(value="/searchId/")
	@ResponseBody
	public MemberVO searchMemberId(HttpServletRequest request) {
		String m_id = request.getParameter("m_id");
		
		MemberVO memVO= new MemberVO();
		try {
		memVO = myPageService.returnToMemberNumber(m_id);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return memVO;
		
		
	}
	/** 메세지 입력 **/
	@RequestMapping(value = "/insert/action")
	public ModelAndView messageInsertAction(HttpSession session, HttpServletRequest request) {
		MessageVO messageVO = new MessageVO();
		ModelAndView mav = new ModelAndView("result");
		try {
			messageVO.setG_no(request.getParameter("g_no"));
			messageVO.setM_no(request.getParameter("m_no"));
			messageVO.setG_content(request.getParameter("g_content"));
			messageVO.setG_send_no(request.getParameter("g_send_no"));
			
			messageService.messageInsertAction(messageVO);
			messageService.messageInsertAction2(messageVO);
			
			if(messageVO.getG_no() != null) {
			mav.addObject("msg", "쪽지 전송 성공");
			mav.addObject("url", "../reciveMsg"+"/"+messageVO.getG_no());
			} else {
				mav.addObject("msg", "쪽지 전송 성공");
				mav.addObject("url", "../reciveMsg"+"/");
				
			}
		} catch (Exception e) {
			mav.addObject("msg", "쪽지 전송 실패.");
			mav.addObject("url", "../");
		}
		return mav;
	}

	/** 메세지 삭제 **/
	@RequestMapping(value = "/deleteMsg/{g_no}")
	public ModelAndView oneMessageDelete(@PathVariable String g_no, HttpSession session, HttpServletRequest request) {

		messageService.oneMessageDelete(g_no);
		String status = request.getParameter("status");
		if(status.equals("recive")) {
			return new ModelAndView("redirect:../reciveMsg/");
		} else {
			return new ModelAndView("redirect:../sendMsg/");

		}
		
	}

	/** 체크박스 메세지 삭제	  
	 * @throws IOException **/
	@RequestMapping(value = "/deleteMsg/", method = RequestMethod.POST)
	public ModelAndView checkboxSelecMessageDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String status = request.getParameter("status");
		String[] chbox = request.getParameterValues("chk");
		List<String> list = Arrays.asList(chbox);
		messageService.checkboxSelectMessageDelete(list);
		if(status.equals("recive")) {
			return new ModelAndView("redirect:../reciveMsg/");
		} else {
			return new ModelAndView("redirect:../sendMsg/");

		}
		
		
	}

}