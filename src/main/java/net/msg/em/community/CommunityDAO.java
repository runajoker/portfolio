package net.msg.em.community;

import java.util.List;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.BoardVO;
import net.msg.em.vo.PageVO;

public interface CommunityDAO {

	List<ArticleVO> getArticlePageList(PageVO pageVO) throws Exception;

	long getTotalCount(int b_no) throws Exception;

	BoardVO getBoard(int b_no) throws Exception;

	int insertArticle(ArticleVO articleVO) throws Exception;

	void increaseCommentCount(long art_no) throws Exception;

	void decreaseCommentCount(long art_no) throws Exception;
}
