package liuyan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import liuyan.entity.Liuyan;
import liuyan.services.LiuyanServices;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/liuyan")
public class LiuyanController {
	
	UsersIp usersIp = new UsersIp();
	DateUtil dateUtil = new DateUtil();
	private static Logger logger = Logger.getLogger(LiuyanController.class);
	
	@Autowired
	private LiuyanServices liuyanServices;
	@Autowired
	private UserlistService userlistService;
	
	@RequestMapping(value="/read",method = RequestMethod.GET)
	public String add(HttpServletRequest request,HttpSession session,@Param("id") String id) {
		String adminname;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			adminname = "";
		} else {
			adminname = (String) AdminName1;
		}
		if (adminname.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		Userlist userlist = new Userlist();
		userlist.setUsername(adminname);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminReadLiuyan");
		logger.info(adminname + ":AdminReadLiuyan");
		userlistService.insertUserlist(userlist);
		logger.info("将留言设置为已读");
		Liuyan liuyan = liuyanServices.findById(id);
		liuyan.setIsread("yes");
		liuyan.setUpdatetime(dateUtil.getDateTimeTypeSql());
		liuyanServices.updateLiuyanById(liuyan);
		
		return "redirect:/aftermain/liuyan";
	}
	
	@RequestMapping(value="/del",method = RequestMethod.GET)
	public String del(HttpServletRequest request,HttpSession session,@Param("id") String id) {
		String adminname;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			adminname = "";
		} else {
			adminname = (String) AdminName1;
		}
		if (adminname.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		Userlist userlist = new Userlist();
		userlist.setUsername(adminname);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminDelLiuyan");
		logger.info(adminname + ":AdminDelLiuyan");
		userlistService.insertUserlist(userlist);
		logger.info("删除了一个留言");
		liuyanServices.deleteByLiuyanId(id);
		
		return "redirect:/aftermain/liuyan";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String index(HttpServletRequest request,HttpSession session) {
			String username = (String)session.getAttribute("AdminName");
			Userlist userlist = new Userlist();
			userlist.setUsername(username);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "UserAddLiuyan");
			logger.info(username + ":UserAddLiuyan");
			userlistService.insertUserlist(userlist);
		logger.info("新增一个留言");
		String liuyanming =  request.getParameter("username");
		String email =  request.getParameter("email");
		String address =  request.getParameter("address");
		String neirong =  request.getParameter("neirong");
		String phone =  request.getParameter("phone");
		
		Liuyan liuyan = new Liuyan();
		liuyan.setName(liuyanming);
		liuyan.setCreatetime(dateUtil.getDateTimeTypeSql());
		liuyan.setEmail(email);
		liuyan.setNeirong(neirong);
		liuyan.setIsread("no");
		liuyan.setAddress(address);
		liuyan.setTemp1(phone);
		liuyanServices.addLiuyan(liuyan);
		
		return "redirect:/main/index";
	}
}
