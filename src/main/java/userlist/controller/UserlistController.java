package userlist.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("userlist")
public class UserlistController {
	
	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(UserlistController.class);
	DateUtil dateUtil = new DateUtil();
	
}
