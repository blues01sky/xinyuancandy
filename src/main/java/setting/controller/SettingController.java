package setting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import setting.entity.Setting;
import setting.services.SettingService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/setting")
public class SettingController {

	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(SettingController.class);
	DateUtil dateUtil = new DateUtil();

	@Autowired
	private SettingService settingService;
	@Autowired
	private UserlistService userlistService;

	@RequestMapping(value = "/addgonggaopage",method = RequestMethod.GET)
	public String addgonggaopage(HttpServletRequest request) {
		return "/admin/gonggao/add";
	}
	
	@RequestMapping(value = "/addgonggao",method = RequestMethod.POST)
	public String addgonggao(HttpServletRequest request,HttpSession session) {
		String AdminName = (String)session.getAttribute("AdminName");
		Setting setting = new Setting();
		String gonggao = request.getParameter("gonggao");
		setting.setGonggao(gonggao);
		setting.setAdminname(AdminName);
		setting.setCreatetime(dateUtil.getDateTimeTypeSql());
		settingService.AddSetting(setting);
		
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminAddGonggao");
		logger.info(AdminName + ":AdminAddGonggao");
		userlistService.insertUserlist(userlist);
		return "redirect:/setting/gonggaolist";
	}
	
	@RequestMapping(value = "/gonggaolist",method = RequestMethod.GET)
	public String gonggaolist(HttpServletRequest request,HttpSession session) {
		String AdminName = (String)session.getAttribute("AdminName");
		List<Setting> list = settingService.queryall();
		request.setAttribute("list", list);
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminListGonggao");
		logger.info(AdminName + ":AdminListGonggao");
		userlistService.insertUserlist(userlist);
		return "/admin/gonggao/list";
	}
}
