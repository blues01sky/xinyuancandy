package user.services;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import user.entity.User;

public interface UserService {
	List<User> findLikeNameUser(@Param("name") String name);
	
	List<User> findLikeaddressUser(@Param("address") String address);
	
	List<User> findLikeconsigneeUser(@Param("consignee") String consignee);
	
	List<User> findLikephoneUser(@Param("phone") String phone);

	List<User> queryAll(@Param("startpage") Integer startpage, @Param("count") Integer count);

	User findByPassword(@Param("name") String name);

	User findUserById(@Param("id") Integer id);

	User findUserByname(@Param("name") String name);

	void deleteByname(@Param("name") String name);

	void deleteByUserId(@Param("id") Integer id);

	void tianjiaUser(User user);

	User chaByname(@Param("name") String name);

	void updateuserById(User user);

	void updateUserByname(User user);

	void reset(User user);

	Integer findUserNum();

	Integer IfNameExist(@Param("name") String name);

}
