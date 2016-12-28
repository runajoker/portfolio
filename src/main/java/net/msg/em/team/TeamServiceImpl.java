package net.msg.em.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.TeamVO;

@Service
public class TeamServiceImpl implements TeamService{

	@Autowired
	private TeamDAO teamDAO;

	@Override
	public int insertTeam(TeamVO teamVO) throws Exception {
		return teamDAO.insertTeam(teamVO);
	}
	@Override
	public int updateCaptain(long m_no) throws Exception {
		return teamDAO.updateCaptain(m_no);
	}
	@Override
	public TeamVO getTeam(long t_no) throws Exception {
		return teamDAO.getTeam(t_no);
	}
	@Override
	public MemberVO getMember(long m_no) throws Exception {
		return teamDAO.getMember(m_no);
	}
	@Override
	public void updateTeam(TeamVO teamVO) throws Exception {
		teamDAO.updateTeam(teamVO);
		
	}
	@Override
	public void deleteTeam(TeamVO teamVO) throws Exception {
		teamDAO.deleteTeam(teamVO);
		
	}
	@Override
	public int delchangememTeam(MemberVO memberVO) throws Exception {
		
		return teamDAO.delchangememTeam(memberVO);
	}
	@Override
	public TeamVO getTeam2(MemberVO memberVO) throws Exception {
		return teamDAO.getTeam2(memberVO);
		
	}
	@Override
	public int checkDelTeam(MemberVO memberVO) throws Exception {
		
		return teamDAO.checkDelTeam(memberVO);
	}
	
	
	@Override
	public List<MatchVO> getTeamMatchingList(long t_no) throws Exception {
		return teamDAO.getTeamMatchingList(t_no);
	}
	
	@Override
	public List<TeamVO> getTeamList() throws Exception {
		return teamDAO.getTeamList();
	}

	@Override
	public void joinTeam(MemberVO memberInfo) throws Exception {
		teamDAO.joinTeam(memberInfo);
		
	}
	@Override
	public void withdrawTeam(long m_no) throws Exception {
		teamDAO.withdrawTeam(m_no);
		
	}
	
	@Override
	public List<TeamVO> getTeamMemList(MemberVO memberVO) throws Exception {
		return teamDAO.getTeamMemList(memberVO);
	}
	@Override
	public void entrustTeam(MemberVO memberVO) throws Exception {
		teamDAO.entrustTeam(memberVO);
		
	}
	@Override
	public void upAdminTeam(int m_no) throws Exception {
		teamDAO.upAdminTeam(m_no);
		
	}
	@Override
	public void downAdminTeam(long m_no) throws Exception {
		teamDAO.downAdminTeam(m_no);
	}

	@Override
	public void updateCaptain2(int t_no) throws Exception {
		teamDAO.updateCaptain2(t_no);
	}
}