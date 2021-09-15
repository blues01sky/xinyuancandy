package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import goods.entity.Goods;
import goods.services.GoodsService;
import order.entity.Order;
import order.services.OrderServices;
import setting.entity.Setting;
import setting.services.SettingService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/main")
public class MainController {

	UsersIp usersIp = new UsersIp();
	DateUtil dateUtil = new DateUtil();
	private static Logger logger = Logger.getLogger(MainController.class);

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private OrderServices orderServices;
	@Autowired
	private SettingService settingService;
	
	@RequestMapping(value = "/liuyan", method = RequestMethod.GET)
	public String liuyan(HttpServletRequest request, HttpSession session) {
		String username;
		Object username1 = session.getAttribute("username");
		if (username1 == null) {
			username = "";
		} else {
			username = (String) username1;
		}
		if (username.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			Userlist userlist = new Userlist();
			userlist.setUsername(username);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoUserNameToLiuyan");
			userlistService.insertUserlist(userlist);
		}
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/liuyan";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(HttpServletRequest request, HttpSession session) {
		String username;
		Object username1 = session.getAttribute("username");
		if (username1 == null) {
			username = "";
		} else {
			username = (String) username1;
		}
		if (username.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			Userlist userlist = new Userlist();
			userlist.setUsername(username);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoUserNameCartToPay");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		List<Order> list = orderServices.queryAll(0, 30);
		request.setAttribute("list", list);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/order_list";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/login";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist(HttpSession session, HttpServletRequest request) {
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/register";
	}
	
	@RequestMapping(value = "/head", method = RequestMethod.GET)
	public String head(HttpSession session, HttpServletRequest request) {
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/header";
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(HttpSession session, HttpServletRequest request) {
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/footer";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpSession session, HttpServletRequest request) {
		
		logger.info(dateUtil.getDateTimeNow() + "访问主页");
		
		List<Goods> list = goodsService.findHot("hot", 0, 4);
		List<Goods> list2 = goodsService.findNew(0, 4);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		return "show/index";
		/*打开项目WEB-INF下的jsp文件夹下的before文件夹的index.jsp的页面*/
		
		/*before/index实际上等于打开了/WEB-INF/jsp/before/index.jsp*/
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private String logout(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		logger.info(username + "准备退出管理系统！");
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserExitSuccess");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		session.removeAttribute("username");
		logger.info(username + "已经退出管理系统！");
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "redirect:/main/index";
	}

}
