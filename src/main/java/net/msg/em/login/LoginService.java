package net.msg.em.login;

import net.msg.em.vo.MemberVO;

public interface LoginService {

	MemberVO getMember(MemberVO memberVO) throws Exception;

	MemberVO getKaKaoMember(MemberVO memberVO) throws Exception;

}
