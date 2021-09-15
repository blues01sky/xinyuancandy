package util;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import userlist.entity.Userlist;

public class UsersIp {

	DateUtil dateUtil = new DateUtil();
	protected static Logger logger = Logger.getLogger(UsersIp.class);

	public void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
		System.out.println("开始上传图片！");
		System.out.println(filePath+fileName);
		File targetFile = new File(filePath);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		FileOutputStream out = new FileOutputStream(filePath + fileName);
		System.out.println("上传图片成功！");
		out.write(file);
		out.flush();
		out.close();
		System.out.println("上传图片结束！");
	}

	public Userlist findMessageReturnUserlist(HttpServletRequest request, Userlist userlist) {
		String address = request.getRemoteAddr();// 取得客户端的IP
		String remotehost = request.getRemoteHost();// 取得客户端的主机名
		String port = String.valueOf(request.getRemotePort());// 取得客户端的端口
		String username = request.getRemoteUser(); // 取得客户端的用户
		userlist.setServerport(String.valueOf(port));
		userlist.setRemoteaddress(address);
		userlist.setRemotehost(remotehost);
		userlist.setUsername(username);
		userlist.setCreatetime(dateUtil.getDateTimeTypeSql());
		return userlist;
	}

	public Userlist findOneMessage(HttpServletRequest request) {
		Userlist userlist = new Userlist();
		String address = request.getRemoteAddr();// 取得客户端的IP
		String remotehost = request.getRemoteHost();// 取得客户端的主机名
		String port = String.valueOf(request.getRemotePort());// 取得客户端的端口
		String username = request.getRemoteUser(); // 取得客户端的用户
		userlist.setServerport(String.valueOf(port));
		userlist.setRemoteaddress(address);
		userlist.setRemotehost(remotehost);
		userlist.setUsername(username);
		return userlist;
	}

	public Userlist CreateRecordAction(HttpServletRequest request, Userlist userlist, String actives) {

		String address = request.getRemoteAddr();// 取得客户端的IP
		String remotehost = request.getRemoteHost();// 取得客户端的主机名
		String port = String.valueOf(request.getRemotePort());// 取得客户端的端口
		String username = request.getRemoteUser(); // 取得客户端的用户
		Timestamp timestamp = dateUtil.getDateTimeTypeSql();
		userlist.setActives(actives);
		userlist.setCreatetime(timestamp);
		userlist.setServerport(port);
		userlist.setRemoteaddress(address);
		userlist.setRemotehost(remotehost);
		userlist.setTemp1(username);
		userlist.setSessionid("uuid()");

		logger.info("记录下了这条数据!时间是" + timestamp);
		return userlist;
	}

}
