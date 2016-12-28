package net.msg.em.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO commentDAO;

	@Override
	public void insertComment(CommentVO commentVO) {
		commentDAO.insertComment(commentVO);
	}

	@Override
	public List<CommentVO> getCommentList(long art_no) {
		return commentDAO.getCommentList(art_no);
	}

	@Override
	public void insertBoardReply(CommentVO commentVO) {
		commentDAO.insertBoardReply(commentVO);
	}

	@Override
	public void deleteComment(long com_no) {
		commentDAO.deleteComment(com_no);		
	}

}
