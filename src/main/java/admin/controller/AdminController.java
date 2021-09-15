package admin.controller;

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

import admin.entity.Admin;
import admin.services.AdminServices;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/admin")
public class AdminController {

	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(AdminController.class);
	DateUtil dateUtil = new DateUtil();

	@Autowired
	private UserlistService userlistService;
	@Autowired
	private AdminServices adminServices;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	private String adminAdd(HttpServletRequest request, HttpSession session) {
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String adminname = request.getParameter("adminname");
		
		int count = adminServices.IfNameExist(adminname);
		if(count==1) {
			logger.info("该用户已存在请重命名！");
			Userlist userlist = new Userlist();
			userlist.setUsername(adminname);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "AdminHasExit");
			logger.info(adminname + ":AdminHasExit");
			userlistService.insertUserlist(userlist);
		}
		Admin admin = new Admin();
		admin.setAddress(address);
		admin.setAdminname(adminname);
		admin.setPassword(password);
		admin.setPhone(phone);
		admin.setCreatetime(dateUtil.getDateTimeTypeSql());

		String AdminName = (String) session.getAttribute("AdminName");
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminAddOneAdmin");
		logger.info(AdminName + ":AdminAddOneAdmin");
		userlistService.insertUserlist(userlist);
		adminServices.addAdmin(admin);
		return "redirect:/admin/list";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private String logout(HttpServletRequest request, HttpSession session) {
		String adminname = (String) session.getAttribute("AdminName");
		logger.info(adminname + "准备退出管理系统！");
		Userlist userlist = new Userlist();
		userlist.setUsername(adminname);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminExitSuccess");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		session.removeAttribute("AdminName");
		logger.info(adminname + "已经退出管理系统！");
		return "redirect:/main/index";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpSession session) {
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
		
		List<Admin> list = adminServices.queryAll(0, 30);
		request.setAttribute("list", list);
		
		 return "admin/admin/list";
	}
	
	@RequestMapping(value = "/addpage", method = RequestMethod.GET)
	private String addpage(HttpSession session, HttpServletRequest request) {
		return "admin/admin/add";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	private String adminEdit(HttpServletRequest request, HttpSession session) {
		
		
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int adminid = Integer.valueOf(request.getParameter("adminid"));

		System.out.println(adminid);
		Admin admin = adminServices.findAdminById(adminid);
		admin.setAddress(address);
		admin.setId(Integer.valueOf(adminid));
		admin.setPassword(password);
		admin.setPhone(phone);
		admin.setUpdatetime(dateUtil.getDateTimeTypeSql());
		
		logger.info(admin);

		String AdminName = (String) session.getAttribute("AdminName");
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminEditOneAdmin");
		logger.info(AdminName + ":AdminEditOneAdmin");
		userlistService.insertUserlist(userlist);
		admin.setAdminname(AdminName);
		adminServices.updateAdminById(admin);
		return "redirect:/admin/list";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	private String adminEditPage(HttpSession session, HttpServletRequest request,
			@Param("adminnameid") int adminnameid) {
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
		usersIp.CreateRecordAction(request, userlist, "AdminEditOneAdminPage");
		logger.info(AdminName + ":AdminEditOneAdminPage");
		userlistService.insertUserlist(userlist);
		Admin admin = adminServices.findAdminById(adminnameid);
		request.setAttribute("Admin", admin);
		return "admin/admin/edit";
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	private String adminDel(HttpSession session, HttpServletRequest request, @Param("adminid") int adminid) {
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
		usersIp.CreateRecordAction(request, userlist, "AdminDelOneAdmin");
		logger.info(userlist + "!" + AdminName + ":AdminDelOneAdmin");
		adminServices.deleteByAdminId(adminid);
		userlistService.insertUserlist(userlist);
		return "redirect:/admin/list";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpSession session) {
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
		 return "admin/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String AdminLogin(@Param("adminname") String adminname, @Param("password") String password,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("名字为：" + adminname + "的管理员访问登录系统！");
		logger.info("名字为：" + password + "的管理员访问登录系统！");
		
		
		int userNotExist = userlistService.CountCheck(dateUtil.getDateNow(), "AdminNameNotExist",
				usersIp.findOneMessage(request).getRemoteaddress());
		if (userNotExist > 5) {
			return Integer.toString(userNotExist);
		} else if (userNotExist > 1) {
			logger.error("今天用户名不存在错误次数：" + userNotExist + "当日用户不存在的次数达到5次将不能登录系统！");
		}
		int count = adminServices.IfNameExist(adminname);
		logger.info(count + dateUtil.getDateTimeNow());
		if (count == 0) {
			Userlist userlist = new Userlist();
			userlist.setUsername(adminname);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "AdminNameNotExist");
			userlistService.insertUserlist(userlist);
			logger.info(userlist + "userlist");
			return "AdminNameNotExist";
		} else {
			int passwordcount = userlistService.CountCheck(dateUtil.getDateNow(), "AdminLoginPasswordError",
					usersIp.findOneMessage(request).getRemoteaddress());
			logger.info(passwordcount + "AdminLoginPasswordError");
			if (passwordcount > 5) {
				return Integer.toString(passwordcount);
			} else if (passwordcount > 1) {
				logger.error("今天已输入密码错误次数：" + passwordcount + "当日密码错误次数达到5次将不能登录系统！");
			}
			logger.info("查询密码" + dateUtil.getDateTimeNow());

			Admin admin = adminServices.findByAdminname(adminname);

			String DBAdminName = admin.getAdminname();
			String DBpassword = admin.getPassword();
			if (password.equals(DBpassword)) {
				logger.info("密码正确！");

				Userlist userlist = new Userlist();
				userlist.setUsername(DBAdminName);
				userlist.setListid(userlistService.findAllCount().intValue() + 1);
				usersIp.CreateRecordAction(request, userlist, "AdminLoginSuccess");
				logger.info(userlist + "userlist");
				userlistService.insertUserlist(userlist);
				session.setAttribute("AdminName", DBAdminName);
				return "AdminLoginSuccess";
			} else {
				logger.info("密码错误！");
				Userlist userlist = new Userlist();
				userlist.setUsername(DBAdminName);
				userlist.setListid(userlistService.findAllCount().intValue() + 1);
				usersIp.CreateRecordAction(request, userlist, "AdminLoginPasswordError");
				userlistService.insertUserlist(userlist);
				logger.info(userlist + "userlist");
				logger.error("密码错误，请重新登录！");
				return "AdminLoginPasswordError";
			}
		}
	}
}
