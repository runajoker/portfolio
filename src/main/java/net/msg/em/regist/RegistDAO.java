package net.msg.em.regist;

import net.msg.em.vo.MemberVO;

public interface RegistDAO {

	int insertMember(MemberVO memberVO) throws Exception;

	int insertKakaoMember(MemberVO memberVO) throws Exception;

}
