package net.msg.em.myPage;

import java.util.List;

import net.msg.em.vo.MemberVO;

public interface MyPageDAO {
	void updateMember(MemberVO memberVO) throws Exception;

	void memberInfo(MemberVO memberVO) throws Exception;

	MemberVO getMember(long m_no) throws Exception;

	void deleteMem(MemberVO memberVO) throws Exception;

	MemberVO returnToMemberNumber(String m_id);

}
