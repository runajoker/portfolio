package net.msg.em.comment;

import java.util.List;
import java.util.Map;

import net.msg.em.vo.CommentVO;

public interface CommentDAO {

	void insertComment(CommentVO commentVO);

	List<CommentVO> getCommentList(long art_no);

	void insertBoardReply(CommentVO commentVO);

	void deleteComment(long com_no);

}
