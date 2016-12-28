package net.msg.em.regist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.msg.em.vo.MemberVO;

@Service
public class RegistServiceImpl implements RegistService{

	@Autowired
	private RegistDAO registDAO;

	@Override
	public int insertMember(MemberVO memberVO) throws Exception {
		return registDAO.insertMember(memberVO);
	}

	@Override
	public int insertKakaoMember(MemberVO memberVO) throws Exception {
		return registDAO.insertKakaoMember(memberVO);
	}
	
}
