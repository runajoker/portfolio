package net.msg.em.match;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.T_MVO;
import net.msg.em.vo.TeamVO;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchDAO matchDAO;

	@Override
	public List<MatchVO> getMatchingList() throws Exception {
		return matchDAO.getMatchingList();
	}

	@Override
	public MemberVO getMember(long m_no) throws Exception {
		return matchDAO.getMember(m_no);
	}

	@Override
	public int insertMatching(MatchVO matchVO) throws Exception {
		return matchDAO.insertMatching(matchVO);
	}

	@Override
	public MatchVO getMatch(long mat_no) throws Exception {
		return matchDAO.getMatch(mat_no);
	}

	@Override
	public int awayTeamUpdate(Map<String, Object> map) throws Exception {
		return matchDAO.awayTeamUpdate(map);
	}

	@Override
	public TeamVO getTeam(long t_no) throws Exception {
		return matchDAO.getTeam(t_no);
	}

	@Override
	public int countMatchingDay(String schedule) throws Exception {
		return matchDAO.countMatchingDay(schedule);
	}

	@Override
	public List<MatchVO> getMatchingDayList() throws Exception {
		return matchDAO.getMatchingDayList();
	}

	@Override
	public List<MatchVO> getMatchingDayDetail(String schedule) throws Exception {
		return matchDAO.getMatchingDayDetail(schedule);
	}

	@Override
	public List<MatchVO> getMatchingComplete() throws Exception {
		return matchDAO.getMatchingComplete();
	}

	@Override
	public List<T_MVO> searchMatNo(long t_no) throws Exception {
		return matchDAO.searchMatNo(t_no);
	}

	@Override
	public int insertTeam_Matching(Map<String, Long> map) throws Exception {
		return matchDAO.insertTeam_Matching(map);
	}

	@Override
	public int deleteHomeMatching(long mat_no) throws Exception {
		return matchDAO.deleteHomeMatching(mat_no);
	}

	@Override
	public int deleteHomeMatchingTM(long mat_no) throws Exception {
		return matchDAO.deleteHomeMatchingTM(mat_no);
	}

	@Override
	public int updateAwayMatching(long mat_no) throws Exception {
		return matchDAO.updateAwayMatching(mat_no);
	}

	@Override
	public int deleteAwayMatchingTM(Map<String, Long> map) throws Exception {
		return matchDAO.deleteAwayMatchingTM(map);
	}

	

	

}
