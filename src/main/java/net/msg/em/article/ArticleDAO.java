package net.msg.em.article;

import java.util.List;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.BoardVO;
import net.msg.em.vo.PageVO;

public interface ArticleDAO {

	ArticleVO getArticleDetail(long art_no) throws Exception;

	int updateReadcount(long art_no) throws Exception;

	int updateArticle(ArticleVO articleVO) throws Exception;

	int deleteArticle(long art_no) throws Exception;

}
