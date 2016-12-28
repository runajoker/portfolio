package net.msg.em.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MemberVO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		myPageDAO.updateMember(memberVO);
		
	}

	@Override
	public void memberInfo(MemberVO memberVO) throws Exception {
		myPageDAO.memberInfo(memberVO);
		
	}

	@Override
	public MemberVO getMember(long m_no) throws Exception {
		return myPageDAO.getMember(m_no);
	}

	@Override
	public void deleteMem(MemberVO memberVO) throws Exception {
		myPageDAO.deleteMem(memberVO);
		
	}

	@Override
	public MemberVO returnToMemberNumber(String m_id) {
		return myPageDAO.returnToMemberNumber(m_id);
	}

	
}
