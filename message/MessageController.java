package net.msg.em.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("message")
public class MessageController {
//asdasdasdasd
	@Autowired
	private MessageService messageService;
	
	
}
