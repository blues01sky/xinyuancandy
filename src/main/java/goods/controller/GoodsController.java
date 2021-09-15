package goods.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goods.entity.Goods;
import goods.services.GoodsService;
import setting.entity.Setting;
import setting.services.SettingService;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	DateUtil dateUtil = new DateUtil();
	UsersIp usersIp = new UsersIp();
	protected static Logger logger = Logger.getLogger(GoodsController.class);

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private SettingService settingService;
	
	@RequestMapping(value = "/editnum", method = RequestMethod.GET)
	private String editnum(@Param("goodsid") String goodsid,HttpServletRequest request,HttpSession session) {
		String AdminName = (String) session.getAttribute("AdminName");
		if (AdminName == null) {
			Userlist userlist = new Userlist();
			userlist.setUsername(AdminName);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoAdminNameToAddGoods");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		Goods goods = goodsService.findGoodsById(goodsid);
		request.setAttribute("goods", goods);
		return "admin/product/editnum";
	}
	
	@RequestMapping(value = "/editnum", method = RequestMethod.POST)
	private String editnum(HttpServletRequest request, HttpSession session) {
		String AdminName = (String) session.getAttribute("AdminName");
		if (AdminName == null) {
			Userlist userlist = new Userlist();
			userlist.setUsername(AdminName);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoAdminNameToAddGoods");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		String goodsid = request.getParameter("goodsid");
		String goodsnum = request.getParameter("goodsnum");
		Goods goods = goodsService.findGoodsById(goodsid);
		goods.setUpdatetime(dateUtil.getDateTimeTypeSql());
		goods.setKucunliang(Integer.valueOf(goodsnum)+goods.getKucunliang());
		goodsService.updategoodsById(goods);
		
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserAddGoodsSuccess");
		logger.info(userlist + "userlist");
		logger.info("UserAddGoodsSuccess"+goods.getCoursename()+"库存量增加了："+goodsnum);
		userlistService.insertUserlist(userlist);
		return "redirect:/goods/index";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	private String search(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String newgoodsname = "";
		String oldgoodsname = request.getParameter("goodsname");
		
		List<String> list1= Stream.iterate(0, n -> ++n).limit(oldgoodsname.length()).map(n -> "" + oldgoodsname.charAt(n)).collect(Collectors.toList());
		int i = 0;
		   for(String str:list1){
			   if (i==0) {
				   newgoodsname = str ;
			}else {
				 newgoodsname = newgoodsname+"%%"+str ;
			}
			  i++;
		   }
		   int startpage = 0;
			int count = 12;
		List<Goods> lists = goodsService.findLikename(newgoodsname,startpage,count);
		request.setAttribute("lists", lists);
		
		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserSearchGoodsSuccess");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		
		request.setAttribute("pagenum", 0);
		request.setAttribute("count", 12);
		request.setAttribute("pagesize", 1);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/product_list";
	}	
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String goods(@Param("count") String count,@Param("pagenum") String pagenum,HttpServletRequest request) {
		if (Integer.valueOf(pagenum)<=1) {
			return "redirect:/aftermain/goods";
		}
		List<Goods> lists = goodsService.queryAll((Integer.valueOf(pagenum)-1)*Integer.valueOf(count),Integer.valueOf(count));
		int goodsnum = goodsService.findgoodsNum();
		request.setAttribute("lists", lists);
		request.setAttribute("pagenum", Integer.valueOf(pagenum));
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("pagesize", (int)Math.ceil(goodsnum/Integer.valueOf(count))+1);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/product_list";
	}
	
	@RequestMapping(value = "/goodsdetail", method = RequestMethod.GET)
	private String goodsDetail(HttpServletRequest request, HttpSession session, @Param("goodsid") String goodsid) {
		String username = (String) session.getAttribute("username");

		Userlist userlist = new Userlist();
		userlist.setUsername(username);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "UserListGoodsSuccess");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		Goods goods = goodsService.findGoodsById(goodsid);
		
		request.setAttribute("goods", goods);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "show/product_info";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private String index(HttpServletRequest request, HttpSession session) {
		String AdminName = (String) session.getAttribute("AdminName");
		if (AdminName == null) {
			Userlist userlist = new Userlist();
			userlist.setUsername(AdminName);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoAdminNameToAddGoods");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/index";
		}
		List<Goods> lists = goodsService.queryAll(0, 30);
		request.setAttribute("lists", lists);
		Setting setting = settingService.queryone();
		request.setAttribute("setting", setting);
		return "admin/product/list";
	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(HttpServletRequest request, @Param("goodsid") String goodsid, HttpSession session) {
		String adminname = (String) session.getAttribute("AdminName");
		goodsService.deleteByGoodsId(goodsid);
		Userlist userlist = new Userlist();
		userlist.setUsername(adminname);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminDelGoodsSuccess");
		logger.info(adminname + "删除了id为：" + goodsid + "商品" + "!userlist");
		userlistService.insertUserlist(userlist);
		return "redirect:/goods/index";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	private String edit(@Param("goodsid") String goodsid, HttpServletRequest request, HttpSession session) {
		String AdminName = (String) session.getAttribute("AdminName");
		if (AdminName == null) {
			Userlist userlist = new Userlist();
			userlist.setUsername(AdminName);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "NoAdminNameToUpdateGoods");
			userlistService.insertUserlist(userlist);
			return "redirect:/main/operate";
		}
		Goods goods = goodsService.findGoodsById(goodsid);
		List<Goods> list = goodsService.findAllFenlei();
		Userlist userlist = new Userlist();
		userlist.setUsername(AdminName);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminUpdateGoods");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		logger.info(goods);
		logger.info(list);
		request.setAttribute("goods", goods);
		request.setAttribute("list", list);
		return "admin/product/edit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String updateGoods(HttpServletRequest request, HttpSession session) {
		String adminname = (String) session.getAttribute("AdminName");
		Goods goods = new Goods();

		String goodsid = request.getParameter("goodsid");
		String goodsname = request.getParameter("goodsname");
		double singleprice = Double.valueOf(request.getParameter("saleprice"));
		double youhui = Double.valueOf(request.getParameter("youhui"));
		String fenlei = request.getParameter("type");
		String temp1 = request.getParameter("temp1");
		String jianjie = request.getParameter("jianjie");
		double jinjia = Double.valueOf(request.getParameter("jinjia"));
		String temp4 = request.getParameter("temp4");
		String temp2 = request.getParameter("temp2");
		String temp3 = request.getParameter("temp3");
		String temp5 = request.getParameter("temp5");
		
		/*
		 * Goods goods = new Goods(); goods.setId("uuid()"); goods.setFenlei(fenlei);
		 * goods.setCreatetime(dateUtil.getDateTimeTypeSql());
		 * goodsService.AddGoods(goods);
		 */

		goods.setId(goodsid);
		goods.setCoursename(goodsname);
		goods.setSingleprice(singleprice);
		goods.setImg(goodsService.findGoodsById(goodsid).getImg());
		goods.setYouhui(youhui);
		goods.setFenlei(fenlei);
		goods.setJinjia(jinjia);
		goods.setJianjie(jianjie);
		goods.setTemp1(temp1);
		goods.setTemp2(temp2);
		goods.setTemp3(temp3);
		goods.setTemp4(temp4);
		goods.setTemp5(temp5);
		goods.setCreatetime(goodsService.findGoodsById(goodsid).getCreatetime());
		goods.setUpdatetime(dateUtil.getDateTimeTypeSql());
		Userlist userlist = new Userlist();
		userlist.setUsername(adminname);
		userlist.setListid(userlistService.findAllCount().intValue() + 1);
		usersIp.CreateRecordAction(request, userlist, "AdminUpdateGoodsSuccess");
		logger.info(userlist + "userlist");
		userlistService.insertUserlist(userlist);
		goodsService.updategoodsById(goods);
		logger.info("成功修改一个商品,商品名称为：" + goodsname);

		return "redirect:/goods/index";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request, HttpSession session) {
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
		List<Goods> fenlei = goodsService.findAllFenlei();
		request.setAttribute("list", fenlei);
		return "admin/product/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addGoods(HttpServletRequest request, HttpSession session,@RequestParam("imglocation") MultipartFile file) {
		String adminname = (String) session.getAttribute("AdminName");
		
		String goodsname = request.getParameter("goodsname");
		double singleprice = Double.valueOf(request.getParameter("saleprice"));
		double youhui = Double.valueOf(request.getParameter("youhui"));
		String fenlei = request.getParameter("type");
		String temp1 = request.getParameter("temp1");
		
		/*
		 * Goods goods = new Goods(); goods.setId("uuid()"); goods.setFenlei(fenlei);
		 * goods.setCreatetime(dateUtil.getDateTimeTypeSql());
		 * goodsService.AddGoods(goods);
		 */
		
		String di = file.getOriginalFilename();
		String imgname = dateUtil.getOrderIdByTime();
		
		String shujukulufilename = "tupian/" + imgname + "." + di.substring(di.lastIndexOf(".") + 1);
		System.out.println(shujukulufilename);
		String filePath = "C:/Users/Mr.jiang/git/xinyuancandy/src/main/webapp/static/";
		try {
			usersIp.uploadFile(file.getBytes(), filePath, shujukulufilename);
		} catch (Exception e) {
		}
		String jianjie = request.getParameter("jianjie");
		int kucunliang = Integer.valueOf(request.getParameter("goodsnum"));
		double jinjia = Double.valueOf(request.getParameter("jinjia"));
		String temp4 = request.getParameter("temp4");
		String temp2 = request.getParameter("temp2");
		String temp3 = request.getParameter("temp3");
		String temp5 = request.getParameter("temp5");
		
		int count = goodsService.IfNameExist(goodsname);
		 /*这里优化为count（*）来查询是否存在 */
		if (count == 0) {
			Goods goods = new Goods();
			goods.setId("uuid()");
			goods.setCoursename(goodsname);
			goods.setSingleprice(singleprice);
			goods.setYouhui(youhui);
			goods.setFenlei(fenlei);
			goods.setTemp1(temp1);
			goods.setImg(shujukulufilename);
			goods.setKucunliang(kucunliang);
			goods.setJinjia(jinjia);
			
			goods.setTemp2(temp2);
			goods.setTemp3(temp3);
			goods.setTemp4(temp4);
			goods.setTemp5(temp5);
			goods.setJianjie(jianjie);
			goods.setCreatetime(dateUtil.getDateTimeTypeSql());
			
			Userlist userlist = new Userlist();
			userlist.setUsername(adminname);
			userlist.setListid(userlistService.findAllCount().intValue() + 1);
			usersIp.CreateRecordAction(request, userlist, "AdminAddGoodsSuccess");
			logger.info(userlist + "userlist");
			userlistService.insertUserlist(userlist);
			goodsService.AddGoods(goods);
			logger.info("成功新增一个商品,商品名称为：" + goodsname);
		} else {
			logger.error("商品已经存在，请重新命名！");
			return "redirect:/goods/index";
		}
		return "redirect:/goods/index";
	}
}