package net.msg.em;

import java.util.List;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.MatchVO;
import net.msg.em.vo.TeamVO;

public interface MainDAO {

	String getCountNewMesssage(long m_no);

	List<MatchVO> getMatchingList() throws Exception;

	List<TeamVO> getTeamList() throws Exception;

	List<ArticleVO> getArticleList() throws Exception;

	List<ArticleVO> getArticleList2() throws Exception;
	List<ArticleVO> getArticleList3() throws Exception;
}
