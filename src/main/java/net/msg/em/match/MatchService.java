package net.msg.em.match;

import java.util.List;
import java.util.Map;

import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.T_MVO;
import net.msg.em.vo.TeamVO;

public interface MatchService {

	List<MatchVO> getMatchingList() throws Exception;

	MemberVO getMember(long m_no) throws Exception;

	int insertMatching(MatchVO matchVO) throws Exception;

	MatchVO getMatch(long mat_no) throws Exception;

	int awayTeamUpdate(Map<String, Object> map) throws Exception;

	TeamVO getTeam(long t_no) throws Exception;

	int countMatchingDay(String schedule) throws Exception;

	List<MatchVO> getMatchingDayList() throws Exception;

	List<MatchVO> getMatchingDayDetail(String schedule) throws Exception;

	List<MatchVO> getMatchingComplete() throws Exception;

	List<T_MVO> searchMatNo(long t_no) throws Exception;

	int insertTeam_Matching(Map<String, Long> map) throws Exception;

	int deleteHomeMatching(long mat_no) throws Exception;

	int deleteHomeMatchingTM(long mat_no) throws Exception;

	int updateAwayMatching(long mat_no) throws Exception;

	int deleteAwayMatchingTM(Map<String, Long> map) throws Exception;

}
