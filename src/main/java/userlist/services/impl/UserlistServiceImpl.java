package userlist.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import userlist.entity.Userlist;
import userlist.mapper.UserlistMapper;
import userlist.services.UserlistService;
import util.DateUtil;
import util.UsersIp;

@Service("userlistService")
public class UserlistServiceImpl implements UserlistService {

	DateUtil date = new DateUtil();
	UsersIp usersIp = new UsersIp();

	@Autowired
	private UserlistMapper userlistMapper;

	@Override
	public void insertUserlist(Userlist userlist) {
		// TODO Auto-generated method stub
		userlistMapper.insertUserlist(userlist);
	}

	@Override
	public List<Userlist> queryAllByListIDAsc() {
		// TODO Auto-generated method stub
		return userlistMapper.queryAllByListIDAsc();
	}

	@Override
	public List<Userlist> queryByAddress(String remoteaddress) {
		// TODO Auto-generated method stub
		return userlistMapper.queryByAddress(remoteaddress);
	}

	@Override
	public List<Userlist> queryByHost(String remotehost) {
		// TODO Auto-generated method stub
		return userlistMapper.queryByHost(remotehost);
	}

	@Override
	public List<Userlist> queryByUsername(String username) {
		// TODO Auto-generated method stub
		return userlistMapper.queryByUsername(username);
	}

	@Override
	public List<Userlist> queryByCreatetime(String createtime) {
		// TODO Auto-generated method stub
		return userlistMapper.queryByCreatetime(createtime);
	}

	@Override
	public Userlist findByListID(Integer listid) {
		// TODO Auto-generated method stub
		return userlistMapper.findByListID(listid);
	}

	@Override
	public Userlist findBySessionID(String sessionid) {
		// TODO Auto-generated method stub
		return userlistMapper.findBySessionID(sessionid);
	}

	@Override
	public Integer findAllCount() {
		// TODO Auto-generated method stub
		return userlistMapper.findAllCount();
	}

	@Override
	public List<Userlist> queryByactives(String actives) {
		// TODO Auto-generated method stub
		return userlistMapper.queryByactives(actives);
	}

	@Override
	public Integer CountCheck(String createtime, String action, String remoteaddress) {
		// TODO Auto-generated method stub
		return userlistMapper.CountCheck(createtime, action, remoteaddress);
	}

	@Override
	public List<Userlist> queryLimitListidByDesc(int startpage, int count) {
		// TODO Auto-generated method stub
		return userlistMapper.queryLimitListidByDesc(startpage, count);
	}

	@Override
	public List<Userlist> findLikeUserlistRemotehost(String remotehost) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistRemotehost(remotehost);
	}

	@Override
	public List<Userlist> findLikeUserlistlistid(Integer listid) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistlistid(listid);
	}

	@Override
	public List<Userlist> findLikeUserlistusername(String username) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistusername(username);
	}

	@Override
	public List<Userlist> findLikeUserlistremoteaddress(String remoteaddress) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistremoteaddress(remoteaddress);
	}

	@Override
	public List<Userlist> findLikeUserlistserverport(String serverport) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistserverport(serverport);
	}

	@Override
	public List<Userlist> findLikeUserlistactives(String actives) {
		// TODO Auto-generated method stub
		return userlistMapper.findLikeUserlistactives(actives);
	}

	@Override
	public void delAll() {
		// TODO Auto-generated method stub
		userlistMapper.delAll();
	}


}
