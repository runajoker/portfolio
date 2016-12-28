package net.msg.em.regist;

import net.msg.em.vo.MemberVO;

public interface RegistService {

	int insertMember(MemberVO memberVO) throws Exception;//회원가입

	int insertKakaoMember(MemberVO memberVO) throws Exception;

}
