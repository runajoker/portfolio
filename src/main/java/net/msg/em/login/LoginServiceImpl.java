package net.msg.em.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDAO;

	@Override
	public MemberVO getMember(MemberVO memberVO) throws Exception {
		return loginDAO.getMember(memberVO);
	}

	@Override
	public MemberVO getKaKaoMember(MemberVO memberVO) throws Exception {
		return loginDAO.getKaKaoMember(memberVO);
	}
	
}
