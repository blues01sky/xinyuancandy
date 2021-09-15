package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import goods.entity.Goods;
import goods.services.GoodsService;
import liuyan.entity.Liuyan;
import liuyan.services.LiuyanServices;
import order.entity.Order;
import order.services.OrderServices;
import setting.entity.Setting;
import setting.services.SettingService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.UsersIp;
import xiaoshoue.entity.Xioashoue;

@Controller
@RequestMapping("/aftermain")
public class AfterMain {

	UsersIp usersIp = new UsersIp();
	private static Logger logger = Logger.getLogger(AfterMain.class);

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrderServices orderServices;
	@Autowired
	private SettingService settingService;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private LiuyanServices liuyanServices;
	
	@RequestMapping(value = "/liuyan", method = RequestMethod.GET)
	public String liuyan(HttpServletRequest request,HttpSession session) {
		List<Liuyan> list = liuyanServices.queryAll();
		request.setAttribute("list", list);
		return "admin/liuyan/list";
	}
	
	@RequestMapping(value = "/xiaoshoue", method = RequestMethod.GET)
	public String xiaoshoue(HttpServletRequest request,HttpSession session) {
		List<Xioashoue> list = orderServices.findxiaoshoue();
		request.setAttribute("list", list);
		return "admin/dingdan/xiaoshoue";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(HttpServletRequest request,HttpSession session) {
		List<Order> list = orderServices.queryAll(0,200);
		request.setAttribute("list", list);
		return "admin/dingdan/list";
	}
	
	@RequestMapping(value = "/rizhi", method = RequestMethod.GET)
	public String rizhi(HttpServletRequest request) {
		List<Userlist> list = userlistService.queryLimitListidByDesc(0, 50); 
		request.setAttribute("list", list);
		return "admin/rizhi/list";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "admin/index";
	}
	
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String goods(HttpServletRequest request) {
		logger.info("访问了商品！");
		int startpage = 0;
		int count = 12;
		
		List<Goods> lists = goodsService.queryAll(startpage,count);
		int goodsnum = goodsService.findgoodsNum();
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		request.setAttribute("lists", lists);
		request.setAttribute("pagenum", startpage);
		request.setAttribute("count", count);
		request.setAttribute("pagesize", (int)Math.ceil(goodsnum/count));
		return "show/product_list";
	}
	
}
