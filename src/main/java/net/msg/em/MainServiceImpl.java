package net.msg.em;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.ArticleVO;
import net.msg.em.vo.MatchVO;
import net.msg.em.vo.TeamVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;

	@Override
	public String getCountNewMessage(long m_no) {
		
		return mainDAO.getCountNewMesssage(m_no);
		
	}

	@Override
	public List<MatchVO> getMatchingList() throws Exception {
		return mainDAO.getMatchingList();
	}

	@Override
	public List<TeamVO> getTeamList() throws Exception {
		return mainDAO.getTeamList();
	}

	@Override
	public List<ArticleVO> getArticleList() throws Exception {
		return mainDAO.getArticleList();
	}

	@Override
	public List<ArticleVO> getArticleList2() throws Exception {
		return mainDAO.getArticleList2();
	}

	@Override
	public List<ArticleVO> getArticleList3() throws Exception {
		return mainDAO.getArticleList3();
	}
}
