package user.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.entity.User;
import user.mapper.UserMapper;
import user.services.UserService;
import util.DateUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

	DateUtil date = new DateUtil();

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> queryAll(Integer startpage, Integer count) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了查看所有用户的方法"
				+ "------------------");
		return userMapper.queryAll(startpage, count);
	}

	@Override
	public User findByPassword(String name) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过查找密码信息的的方法"
				+ "------------------");
		return userMapper.findByPassword(name);
	}

	@Override
	public User findUserById(Integer id) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过id查找用户信息的方法"
				+ "------------------");
		return userMapper.findUserById(id);
	}

	@Override
	public User findUserByname(String name) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过用户名查找用户信息的方法"
				+ "------------------");
		return userMapper.findByname(name);
	}

	@Override
	public void deleteByname(String name) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过用户名删除一个用户的方法"
				+ "------------------");
		userMapper.deleteByname(name);
	}

	@Override
	public void deleteByUserId(Integer id) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过id删除一个用户的方法"
				+ "------------------");
		userMapper.deleteByUserId(id);
	}

	@Override
	public void updateuserById(User user) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过id更新用户信息的方法"
				+ "------------------");
		userMapper.updateuserById(user);
	}

	@Override
	public void updateUserByname(User user) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过用户名更新用户信息的方法"
				+ "------------------");
		userMapper.updateUserByname(user);
	}

	@Override
	public void reset(User user) {
		// TODO Auto-generated method stub
		System.out.println(
				"----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了重置密码的方法" + "------------------");
		userMapper.reset(user);
	}

	@Override
	public void tianjiaUser(User user) {
		// TODO Auto-generated method stub

		userMapper.tianjiaUser(user);
	}

	@Override
	public User chaByname(String name) {
		// TODO Auto-generated method stub
		System.out.println("----------" + date.getDateTimeTypeSql() + "-------------------" + "执行了通过用户名查找用户信息的方法"
				+ "------------------");
		return userMapper.chaByname(name);
	}

	@Override
	public Integer IfNameExist(String name) {
		// TODO Auto-generated method stub
		return userMapper.IfNameExist(name);
	}

	@Override
	public Integer findUserNum() {
		// TODO Auto-generated method stub
		return userMapper.findUserNum();
	}

	@Override
	public List<User> findLikeNameUser(String name) {
		// TODO Auto-generated method stub
		return userMapper.findLikeNameUser(name);
	}

	@Override
	public List<User> findLikeaddressUser(String address) {
		// TODO Auto-generated method stub
		return userMapper.findLikeaddressUser(address);
	}

	@Override
	public List<User> findLikeconsigneeUser(String consignee) {
		// TODO Auto-generated method stub
		return userMapper.findLikeconsigneeUser(consignee);
	}

	@Override
	public List<User> findLikephoneUser(String phone) {
		// TODO Auto-generated method stub
		return userMapper.findLikephoneUser(phone);
	}

}
