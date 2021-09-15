package user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import setting.entity.Setting;
import setting.services.SettingService;
import user.entity.User;
import user.services.UserService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/user")
public class UserController {

	DateUtil dateUtil = new DateUtil();
	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private SettingService settingService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/login";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String userupdate(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.findUserByname(username);
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String consign = request.getParameter("consignee");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");

		user.setSex(sex);
		user.setAddress(address);
		user.setConsignee(consign);
		user.setUpdatetime(dateUtil.getDateTimeTypeSql());
		user.setPassword(password);
		user.setPhone(phone);

		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserUpdateUser");
		logger.info("UserUpdateUser");

		userlistService.insertUserlist(userlist);
		userService.updateuserById(user);
		return "redirect:/main/index";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.findUserByname(username);
		request.setAttribute("user", user);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/xiugai";
	}

	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public String regist(@Param("username") String username, @Param("password") String password, 
			@Param("consignee") String consignee, @Param("sex") String sex, 
			@Param("address") String address, @Param("phone") String phone, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		int count = userService.IfNameExist(username);
		/* 这里优化为count（*）来查询是否存在 */
		if (count == 0) {
			User user = new User();
			user.setName(username);
			user.setConsignee(consignee);
			user.setSex(sex);
			user.setAddress(address);
			user.setPhone(phone);
			user.setPassword(password);
			user.setCreatetime(dateUtil.getDateTimeTypeSql());
			userService.tianjiaUser(user);
			logger.info("成功新增一个用户,用户名称为：" + username);
		} else {
			logger.error("用户已经存在，请重新命名！");
			return "repeat";
		}
		return "AddSuccess";
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset(HttpServletRequest request, HttpSession session, @Param("userid") String userid) {
		String AdminName;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			AdminName = "";
		} else {
			AdminName = (String) AdminName1;
		}
		if (AdminName.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		User user = userService.findUserById(Integer.valueOf(userid));
		user.setPassword("1234");
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminResetUser");
		logger.info("AdminResetUser");

		userlistService.insertUserlist(userlist);
		userService.updateuserById(user);
		return "redirect:/user/index";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String useredit(HttpServletRequest request, HttpSession session) {
		String AdminName = (String) session.getAttribute("AdminName");
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminEditUser");
		logger.info("AdminEditUser");

		String password = request.getParameter("password");
		String userid = request.getParameter("userid");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String consignee = request.getParameter("consignee");
		String sex = request.getParameter("sex");
		String username = request.getParameter("username");

		User user = new User();
		user.setId(Integer.valueOf(userid));
		user.setAddress(address);
		user.setConsignee(consignee);
		user.setCreatetime(userService.findUserById(Integer.valueOf(userid)).getCreatetime());
		user.setUpdatetime(dateUtil.getDateTimeTypeSql());
		user.setName(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setSex(sex);
		userlistService.insertUserlist(userlist);
		userService.updateuserById(user);

		return "redirect:/user/index";
	}

	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String userEditpage(HttpServletRequest request, HttpSession session, @Param("userid") String userid) {
		String AdminName;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			AdminName = "";
		} else {
			AdminName = (String) AdminName1;
		}
		if (AdminName.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminOpenEditUserPage");
		logger.info("AdminOpenEditUserPage");

		User user = userService.findUserById(Integer.valueOf(userid));
		userlistService.insertUserlist(userlist);
		request.setAttribute("user", user);
		return "admin/user/edit";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session) {
		String AdminName;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			AdminName = "";
		} else {
			AdminName = (String) AdminName1;
		}
		if (AdminName.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		List<User> list = userService.queryAll(0, 30);

		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminVisitUserList");
		logger.info("AdminVisitUserList");
		userlistService.insertUserlist(userlist);
		request.setAttribute("list", list);
		return "admin/user/list";
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(HttpServletRequest request, @Param("userid") String userid, HttpSession session) {
		String AdminName;
		Object AdminName1 = session.getAttribute("AdminName");
		if (AdminName1 == null) {
			AdminName = "";
		} else {
			AdminName = (String) AdminName1;
		}
		if (AdminName.equals("")) {
			logger.info("请先登录后再访问管理系统！");
			return "redirect:/main/index";
		}
		userService.deleteByUserId(Integer.valueOf(userid));
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminDelUserSuccess");
		logger.info("AdminDelUserSuccess");
		logger.info(AdminName + "删除了id为：" + userid + "用户" + "!");
		userlistService.insertUserlist(userlist);
		return "redirect:/user/index";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@Param("name") String name, @Param("password") String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info(name + "登录系统！");
		int userNotExist = userlistService.CountCheck(dateUtil.getDateNow(), "UserNameNotExist",
				usersIp.findOneMessage(request).getRemoteaddress());
		if (userNotExist > 5) {
			return Integer.toString(userNotExist);
		} else if (userNotExist > 1) {
			logger.error("今天已用户名不存在错误次数：" + userNotExist + "当日用户不存在的次数达到10次将不能登录系统！");
		}
		int count = userService.IfNameExist(name);
		System.out.println(count + dateUtil.getDateTimeNow());
		if (count == 0) {
			Userlist userlist = new Userlist();
			userlist.setUsername(name);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "UserNameNotExist");
			logger.info("UserNameNotExist");
			logger.info(userlist + "userlist");
			userlistService.insertUserlist(userlist);
			return "UserNameNotExist";
		} else {
			int passwordcount = userlistService.CountCheck(dateUtil.getDateNow(), "UserLoginPasswordError",
					usersIp.findOneMessage(request).getRemoteaddress());
			logger.info(passwordcount + "UserLoginPasswordError");
			if (passwordcount > 5) {
				return Integer.toString(passwordcount);
			} else if (passwordcount > 1) {
				logger.error("今天已输入密码错误次数：" + passwordcount + "当日密码错误次数达到5次将不能登录系统！");
			}
			System.out.println("查询密码" + dateUtil.getDateTimeNow());

			User user = userService.findUserByname(name);

			String DBUserName = user.getName();
			String DBpassword = user.getPassword();
			if (password.equals(DBpassword)) {
				logger.info("密码正确！");
				UsersIp usersIp = new UsersIp();

				Userlist userlist = new Userlist();
				userlist.setUsername(DBUserName);
				userlist.setListid(userlistService.findAllCount().intValue() + 1);
				usersIp.CreateRecordAction(request, userlist, "UserLoginSuccess");
				logger.info("UserLoginSuccess");
				userlistService.insertUserlist(userlist);
				session.setAttribute("username", DBUserName);
				return "LoginSuccess";
			} else {
				logger.info("密码错误！");
				Userlist userlist = new Userlist();
				userlist.setUsername(DBUserName);
				userlist.setListid(userlistService.findAllCount().intValue() + 1);
				usersIp.CreateRecordAction(request, userlist, "UserLoginPasswordError");
				logger.info("UserLoginPasswordError");
				userlistService.insertUserlist(userlist);
				logger.info(userlist + "userlist");
				logger.error("密码错误，请重新登录！");
				return "UserLoginPasswordError";
			}
		}
	}
	
}