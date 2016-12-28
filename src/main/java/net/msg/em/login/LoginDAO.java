package net.msg.em.login;

import net.msg.em.vo.MemberVO;

public interface LoginDAO {

	MemberVO getMember(MemberVO memberVO) throws Exception;

	MemberVO getKaKaoMember(MemberVO memberVO) throws Exception;

}
