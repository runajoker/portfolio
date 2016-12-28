package net.msg.em.stadium;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
	private StadiumDAO stadiumDAO;
	
}
