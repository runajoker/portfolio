package net.msg.em.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.BoardVO;
import net.msg.em.vo.PageVO;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List<ArticleVO> getArticlePageList(PageVO pageVO) throws Exception {
		return communityDAO.getArticlePageList(pageVO);
	}

	@Override
	public long getTotalCount(int b_no) throws Exception {
		return communityDAO.getTotalCount(b_no);
	}

	@Override
	public BoardVO getBoard(int b_no) throws Exception {
		return communityDAO.getBoard(b_no);
	}

	@Override
	public int insertArticle(ArticleVO articleVO) throws Exception {
		return communityDAO.insertArticle(articleVO);
	}

	@Override
	public void increaseCommentCount(long art_no) throws Exception {
		communityDAO.increaseCommentCount(art_no);
	}

	@Override
	public void decreaseCommentCount(long art_no) throws Exception {
		communityDAO.decreaseCommentCount(art_no);
	}

}
