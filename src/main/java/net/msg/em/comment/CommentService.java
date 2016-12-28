package net.msg.em.comment;

import java.util.List;
import java.util.Map;

import net.msg.em.vo.CommentVO;

public interface CommentService {

	void insertComment(CommentVO commentVO) throws Exception;

	List<CommentVO> getCommentList(long art_no) throws Exception;

	void insertBoardReply(CommentVO commentVO) throws Exception;

	void deleteComment(long com_no) throws Exception;

}
