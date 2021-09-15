package userlist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import userlist.entity.Userlist;

public interface UserlistMapper {

	void insertUserlist(Userlist userlist);
	
	List<Userlist> findLikeUserlistRemotehost(@Param("remotehost") String remotehost);

	List<Userlist> findLikeUserlistlistid(@Param("listid") Integer listid);

	List<Userlist> findLikeUserlistusername(@Param("username") String username);

	List<Userlist> findLikeUserlistremoteaddress(@Param("remoteaddress") String remoteaddress);

	List<Userlist> findLikeUserlistserverport(@Param("serverport") String serverport);

	List<Userlist> findLikeUserlistactives(@Param("actives") String actives);

	void delAll();
	
	List<Userlist> queryAllByListIDAsc();
	
	List<Userlist> queryLimitListidByDesc(@Param("startpage") int startpage, @Param("count") int count);

	List<Userlist> queryByAddress(@Param("remoteaddress") String remoteaddress);

	List<Userlist> queryByactives(@Param("actives") String actives);

	List<Userlist> queryByHost(@Param("remotehost") String remotehost);

	List<Userlist> queryByUsername(@Param("username") String username);

	List<Userlist> queryByCreatetime(@Param("createtime") String createtime);

	Userlist findByListID(@Param("listid") Integer listid);

	Userlist findBySessionID(@Param("sessionid") String sessionid);

	Integer findAllCount();

	Integer CountCheck(@Param("createtime") String createtime, @Param("actives") String actives,
			@Param("remoteaddress") String remoteaddress);

}
