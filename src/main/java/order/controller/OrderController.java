package order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import goods.entity.Goods;
import goods.services.GoodsService;
import order.entity.Order;
import order.services.OrderServices;
import setting.entity.Setting;
import setting.services.SettingService;
import user.entity.User;
import user.services.UserService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/order")
public class OrderController {

	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(OrderController.class);
	DateUtil dateUtil = new DateUtil();

	@Autowired
	private OrderServices orderServices;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private UserService userService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private SettingService settingService;
	
	
	@RequestMapping(value = "/sure", method = RequestMethod.GET)
	public String sure(HttpSession session, HttpServletRequest request, @Param("id") String id) {
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
			usersIp.CreateRecordAction(request, userlist, "NoUserNameCartToSure");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		List<Order> orders = orderServices.finddingdanById(id, 0, 1);
		for (Order order : orders) {
			order.setStatus("8");
			order.setZhushi("用户已确认收货");
			orderServices.updatedingdanById(order);
		}
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserSureOrder");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/main/order";
	}
	
	@RequestMapping(value = "/adminsure", method = RequestMethod.GET)
	public String adminsure(HttpSession session, HttpServletRequest request, @Param("id") String id) {
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
			usersIp.CreateRecordAction(request, userlist, "NoUserNameCartToSure");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		List<Order> orders = orderServices.finddingdanById(id, 0, 1);
		for (Order order : orders) {
			Goods goods = goodsService.findGoodsById(order.getTemp5());
			goods.setKucunliang(goods.getKucunliang()-order.getGoodsnum());
			goodsService.updategoodsById(goods);
			order.setStatus("7");
			order.setZhushi("商家已发货");
			orderServices.updatedingdanById(order);
		}
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminSureOrder");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/aftermain/order";
	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(@Param("orderid") String orderid, HttpSession session, HttpServletRequest request) {
		Goods goods = goodsService.findGoodsById(orderServices.finddingdanById(orderid, 0, 1).get(0).getTemp5());
		goods.setKucunliang(orderServices.finddingdanById(orderid, 0, 1).get(0).getGoodsnum()+goods.getKucunliang());
		goodsService.updategoodsById(goods);
		logger.info("执行了删除订单号为：" + orderid + "的订单！");
		orderServices.deleteById(orderid);
		Userlist userlist = new Userlist();
		userlist.setUsername(session.getAttribute("AdminName").toString());
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminDelOrderId");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);

		return "redirect:/aftermain/order";
	}

	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String pay(HttpSession session, HttpServletRequest request,@Param("orderid") String orderid) {
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
		List<Order> list = orderServices.findOrderid(orderid);
		for (Order order : list) {
			order.setStatus("5");
			order.setZhushi("用户已付款");
			orderServices.updatedingdanById(order);
		}
		logger.info(username + "把订单付款了！");
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserPayOrder");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/main/order";
	}
	
	@RequestMapping(value = "/admindelorder", method = RequestMethod.GET)
	public String admindelorder(@Param("orderid") String orderid, HttpSession session, HttpServletRequest request) {
		String username = (String) session.getAttribute("username");
		List<Order> list1 = orderServices.findOrderid(orderid);
		for (Order order : list1) {
			order.setStatus("3");
			order.setZhushi("商家取消订单");
			orderServices.updatedingdanById(order);
		}

		logger.info("执行了删除订单号为：" + orderid + "的订单！");
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminDelOrderById");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/aftermain/order";
	}
	
	@RequestMapping(value = "/userdelorder", method = RequestMethod.GET)
	public String userdelorder(@Param("orderid") String orderid, HttpSession session, HttpServletRequest request) {
		String username = (String) session.getAttribute("username");
		List<Order> list1 = orderServices.findOrderid(orderid);
		for (Order order : list1) {
			order.setStatus("6");
			order.setZhushi("用户取消订单");
			orderServices.updatedingdanById(order);
		}

		logger.info("执行了删除订单号为：" + orderid + "的订单！");
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserDelOrderById");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/main/order";
	}
	
	@RequestMapping(value = "/carttocheckout", method = RequestMethod.GET)
	private String carttocheckout(HttpServletRequest request, HttpSession session) {
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
			usersIp.CreateRecordAction(request, userlist, "NoUserNameCartToCheck");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		String status = "2";
		List<Order> list1 = orderServices.findStatusAndName(status, 0,50, username);
		String orderid = dateUtil.getOrderIdByTime();
		for (Order order : list1) {
			order.setOrderid(orderid);
			order.setStatus("4");
			order.setZhushi("未付款");
			orderServices.updatedingdanById(order);
			System.out.println(order);
		}
		logger.info(username + "访问了订单！");

		List<Order> list = orderServices.findStatusAndName("4", 0,50, username);
		request.setAttribute("list", list);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/order_list";
	}
	
	@RequestMapping(value = "/addnum", method = RequestMethod.POST)
	@ResponseBody
	private String addnum(@Param("shuliang") String shuliang, @Param("goodsid") String goodsid, HttpServletRequest request, HttpSession session) {
		Goods goods = goodsService.findGoodsById(orderServices.finddingdanById(goodsid, 0, 1).get(0).getTemp5());
		if(Integer.valueOf(shuliang)<=Integer.valueOf(goods.getKucunliang())) {
			List<Order> orders = orderServices.finddingdanById(goodsid, 0, 1);
			Order order = orders.get(0);
			order.setGoodsnum(order.getGoodsnum()+1);
			order.setSumprice(Integer.valueOf(shuliang)*order.getSingleprice());
			orderServices.updatedingdanById(order);
			return "Success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/setnum", method = RequestMethod.POST)
	@ResponseBody
	private String setnum(@Param("shuliang") String shuliang, @Param("goodsid") String goodsid, HttpServletRequest request, HttpSession session) {
		Goods goods = goodsService.findGoodsById(orderServices.finddingdanById(goodsid, 0, 1).get(0).getTemp5());
		if(Integer.valueOf(shuliang)<=Integer.valueOf(goods.getKucunliang())) {
			List<Order> orders = orderServices.finddingdanById(goodsid, 0, 1);
			Order order = orders.get(0);
			order.setGoodsnum(Integer.valueOf(shuliang));
			order.setSumprice(Integer.valueOf(shuliang)*order.getSingleprice());
			orderServices.updatedingdanById(order);
			return "Success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/jiannum", method = RequestMethod.POST)
	@ResponseBody
	private String jiannum(@Param("shuliang") String shuliang, @Param("goodsid") String goodsid, HttpServletRequest request, HttpSession session) {
			List<Order> orders = orderServices.finddingdanById(goodsid, 0, 1);
			Order order = orders.get(0);
			order.setGoodsnum(order.getGoodsnum()-1);
			order.setSumprice(Integer.valueOf(shuliang)*order.getSingleprice());
			orderServices.updatedingdanById(order);
			return "Success";
	}
	
	@RequestMapping(value = "/userdelcart", method = RequestMethod.GET)
	public String userdelcart(@Param("orderid") String orderid, HttpSession session, HttpServletRequest request) {
		String username = (String) session.getAttribute("username");
		
		logger.info("执行了删除id为" + orderid + "的购物车！");
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserDelOrderById");
		logger.info(userlist + "userlist");
		orderServices.deleteById(orderid);
		userlistService.insertUserlist(userlist);
		return "redirect:/order/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	private String cart(HttpServletRequest request, HttpSession session) {
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
			usersIp.CreateRecordAction(request, userlist, "NoUserNameToListCart");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		String status = "2";
		List<Order> list = orderServices.findStatusAndName(status, 0, 30, username);
		logger.info(username + "访问了购物车！");
		request.setAttribute("list", list);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/cart";
	}
	
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	@ResponseBody
	private String AddCart(@Param("goodsid") String goodsid, @Param("goodsnum") String goodsnum,HttpServletRequest request, HttpSession session) {
		
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
			usersIp.CreateRecordAction(request, userlist, "NoUserNameToAddCart");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}

		User user = userService.findUserByname(username);
		if (user.getAddress() == null && user.getConsignee() == null && user.getPhone() == null) {
			Userlist userlist = new Userlist();
			userlist.setUsername(username);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoUserDetailToAddCart");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/regist";
		}

		Goods goods = goodsService.findGoodsById(goodsid);
		Order order = new Order();
		if (orderServices.IfStatusAndNameAndTemp5("2", username, goods.getId())==0) {
			order.setAddress(user.getAddress());
			order.setCreatetime(dateUtil.getDateTimeTypeSql());
			order.setGoodsnum(Integer.valueOf(goodsnum));
			order.setTemp5(goods.getId());
			order.setTemp3(username);
			order.setTemp4(goods.getImg());
			order.setGoodsname(goods.getCoursename());
			order.setName(user.getConsignee());
			order.setPhone(user.getPhone());
			order.setSingleprice(goods.getYouhui());
			order.setSumprice(Integer.valueOf(goodsnum) * goods.getYouhui());
			order.setZhushi("添加到购物车");
			order.setStatus("2");
			orderServices.adddingdan(order);
		}else if(orderServices.findStatusAndNameAndTemp5("2", username, goods.getId()).getStatus().equals("2") 
			&& orderServices.findStatusAndNameAndTemp5("2", username, goods.getId()).getTemp3().equals(username) 
			&& orderServices.findStatusAndNameAndTemp5("2", username, goods.getId()).getPhone().equals(user.getPhone())
			&& orderServices.findStatusAndNameAndTemp5("2", username, goods.getId()).getAddress().equals(user.getAddress())
			&& orderServices.findStatusAndNameAndTemp5("2", username, goods.getId()).getName().equals(user.getConsignee())
				) {
			int updatenum = Integer.valueOf(goodsnum);
			order = orderServices.findStatusAndNameAndTemp5("2", username, goods.getId());
			order.setGoodsnum(updatenum+order.getGoodsnum()>goodsService.findGoodsById(goodsid).getKucunliang()?goodsService.findGoodsById(goodsid).getKucunliang():updatenum+order.getGoodsnum());
			System.out.println(order.getGoodsnum());
			order.setSumprice(order.getGoodsnum()*order.getSingleprice());
			order.setUpdatetime(dateUtil.getDateTimeTypeSql());
			orderServices.updatedingdanById(order);
		}
		
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserAddGoodsToCart");
		userlistService.insertUserlist(userlist);
		logger.info("添加到数据库的信息为" + order);
		logger.info("用户" + username + "添加+" + goodsid + "到了购物车！");
		return "AddSuccess";
	}
}
