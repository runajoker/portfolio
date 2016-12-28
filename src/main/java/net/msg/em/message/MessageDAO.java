package net.msg.em.message;

import java.util.List;

import net.msg.em.vo.MessageVO;

public interface MessageDAO {

	List<MessageVO> getMessageList(long m_no);

	MessageVO getDetailMessage(MessageVO vo);

	void checkMessageRefreshReadTime(long g_no);

	void messageInsertAction(MessageVO messageVO);

	void messageInsertAction2(MessageVO messageVO);

	void oneMessageDelete(String g_no);

	List<MessageVO> getSendMessageList(long m_no);

	MessageVO getDetailSendMessage(MessageVO messageVO);

	void checkboxSelectMessageDelete(List<String> list);

}
