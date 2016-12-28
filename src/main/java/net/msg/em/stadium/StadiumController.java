package net.msg.em.stadium;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("stadium")
public class StadiumController {

	@Autowired
	private StadiumService stadiumService;
	
	
}
