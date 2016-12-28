package net.msg.em.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.BoardVO;
import net.msg.em.vo.PageVO;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Autowired
	private ArticleDAO articleDAO;

	@Override
	public ArticleVO getArticleDetail(long art_no) throws Exception {
		return articleDAO.getArticleDetail(art_no);
	}

	@Override
	public int updateReadcount(long art_no) throws Exception {
		return articleDAO.updateReadcount(art_no);
	}

	@Override
	public int updateArticle(ArticleVO articleVO) throws Exception {
		return articleDAO.updateArticle(articleVO);
	}

	@Override
	public int deleteArticle(long art_no) throws Exception {
		return articleDAO.deleteArticle(art_no);
	}
}
