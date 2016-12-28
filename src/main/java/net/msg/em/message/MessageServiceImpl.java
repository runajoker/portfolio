package net.msg.em.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDAO messageDAO;

	@Override
	public List<MessageVO> getMessageList(long m_no) {

		return messageDAO.getMessageList(m_no);
	}


	@Override
	public MessageVO getDetailMessage(MessageVO vo) {
		return messageDAO.getDetailMessage(vo);
	}


	@Override
	public void checkMessageRefreshReadTime(long g_no) {
		messageDAO.checkMessageRefreshReadTime(g_no);
		
	}


	@Override
	public void messageInsertAction(MessageVO messageVO) {
		messageDAO.messageInsertAction(messageVO);
		
	}


	@Override
	public void messageInsertAction2(MessageVO messageVO) {
		messageDAO.messageInsertAction2(messageVO);
		
	}


	@Override
	public void oneMessageDelete(String g_no) {
		messageDAO.oneMessageDelete(g_no);
	}


	@Override
	public List<MessageVO> getSendMessageList(long m_no) {
		
		return messageDAO.getSendMessageList(m_no);
	}


	@Override
	public MessageVO getDetailSendMessage(MessageVO messageVO) {
		return messageDAO.getDetailSendMessage(messageVO);
	}


	@Override
	public void checkboxSelectMessageDelete(List<String> chbox) {
		messageDAO.checkboxSelectMessageDelete(chbox);
	}
	
}
