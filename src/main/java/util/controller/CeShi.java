package util.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import order.services.OrderServices;
import userlist.entity.Userlist;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Controller
public class CeShi {

	DateUtil dateUtil = new DateUtil();
	UsersIp usersIp = new UsersIp();

	@Autowired
	private UserlistService userlistService;
	@Autowired
	private OrderServices orderServices;

	@RequestMapping(value = "/ceshi", method = RequestMethod.GET)
	@ResponseBody
	public void qiegezifuchuan() {
		String footquicklink = "http://localhost:8089/courseSale/main/operate@登录";
		String[] strings = footquicklink.split("@");

		System.out.println(strings);
		System.out.println(strings.toString());
	}

	public int CreateRecordAction() {
		String orderid = "";
		int list = orderServices.findOrderidCount(orderid);
		System.out.println(list);
		System.out.println(orderServices.findOrderidCount(orderid));
		return list;
	}

	public static String getOrderIdByTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String newDate = sdf.format(new Date());
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
			result += random.nextInt(10);
		}
		return newDate + result;
	}

	public void CreateRecordAction(HttpServletRequest request, String name, String actives) {

		Userlist userlist = new Userlist();
		String address = request.getRemoteAddr();// 取得客户端的IP
		String remotehost = request.getRemoteHost();// 取得客户端的主机名
		String port = String.valueOf(request.getRemotePort());// 取得客户端的端口
		String username = request.getRemoteUser(); // 取得客户端的用户
		Timestamp timestamp = dateUtil.getDateTimeTypeSql();

		System.out.println(userlistService.findAllCount());
		int count = userlistService.findAllCount().intValue() + 1;
		System.out.println(count);
		userlist.setActives(actives);
		userlist.setCreatetime(timestamp);
		userlist.setListid(count);
		userlist.setServerport(port);
		userlist.setRemoteaddress(address);
		userlist.setRemotehost(remotehost);
		userlist.setUserid(name);
		userlist.setUsername(username);

		System.out.println(userlist);

		userlistService.insertUserlist(userlist);
		System.out.println("记录下了这条数据!时间是" + timestamp);
	}

	public void checkCount(HttpServletRequest request) {
		// TODO Auto-generated method stub

		String createtime = dateUtil.getDateNow();
		String actives = "usernameNoExist";
		String remoteaddress = usersIp.findOneMessage(request).getRemoteaddress();

		System.out.println(createtime);
		System.out.println(actives);
		System.out.println(remoteaddress);

		System.out.println(usersIp.findOneMessage(request).getRemoteaddress() + "address");

		System.out.println("userNotExist");

		int userNotExist = userlistService.CountCheck(createtime, actives, remoteaddress);

		System.out.println(userNotExist + "userNotExist");
	}

	public String getUserIp() throws UnknownHostException {

		InetAddress addr = InetAddress.getLocalHost();
		String ip = addr.getHostAddress();// 获得本机IP
		String address = addr.getHostName();// 获得本机名称
		String con = addr.getCanonicalHostName();
		System.out.println(con);
		System.out.println(ip);
		return address + "ip是：" + ip;
	}
}
