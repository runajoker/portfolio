package net.msg.em.team;

import java.util.List;

import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.TeamVO;

public interface TeamDAO {

	int insertTeam(TeamVO teamVO) throws Exception;

	int updateCaptain(long m_no) throws Exception;

	TeamVO getTeam(long t_no) throws Exception;

	MemberVO getMember(long m_no) throws Exception;

	void updateTeam(TeamVO teamVO) throws Exception;

	void deleteTeam(TeamVO teamVO) throws Exception;

	int delchangememTeam(MemberVO memberVO) throws Exception;

	TeamVO getTeam2(MemberVO memberVO) throws Exception;

	int checkDelTeam(MemberVO memberVO) throws Exception;

	List<TeamVO> getTeamList() throws Exception;

	List<MatchVO> getTeamMatchingList(long t_no) throws Exception;

	void joinTeam(MemberVO memberInfo) throws Exception;

	void withdrawTeam(long m_no) throws Exception;

	List<TeamVO> getTeamList(MemberVO memberVO) throws Exception;

	List<TeamVO> getTeamMemList(MemberVO memberVO) throws Exception;

	void entrustTeam(MemberVO memberVO) throws Exception;

	void upAdminTeam(int m_no) throws Exception;

	void downAdminTeam(long m_no) throws Exception;

	void updateCaptain2(int t_no) throws Exception;


}
