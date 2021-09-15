package order.services;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import order.entity.Order;
import xiaoshoue.entity.Xioashoue;

public interface OrderServices {
Integer findOrderstatus(@Param("status") String status);
	
	Order findStatusAndNameAndTemp5(@Param("status") String status, @Param("name") String name,@Param("temp5") String temp5);
	
	List<Xioashoue> findxiaoshoue();
	
	List<Order> findStatusOrder(@Param("status") String status);
	
	Integer IfStatusAndNameAndTemp5(@Param("status") String status, @Param("name") String name,@Param("temp5") String temp5);
	
	Integer IfStatusAndName(@Param("status") String status, @Param("name") String name);

	List<Order> findOrderid(@Param("orderid") String orderid);
	
	List<Order> findTemp5(@Param("temp5") String temp5);

	List<Order> findStatusAndNameNoLimit(@Param("status") String status, @Param("name") String name);

	void updatedingdanByOrderId(Order order);

	void updatedingdanById(Order order);

	void adddingdan(Order order);

	void deleteByOrderid(@Param("orderid") String orderid);

	void deleteById(@Param("id") String id);

	void deleteByName(@Param("name") String name);

	List<Order> finddingdanById(@Param("id") String id, @Param("startpage") int startpage, @Param("count") int count);

	List<Order> findLikeName(@Param("name") String name, @Param("startpage") int startpage, @Param("count") int count);

	List<Order> findLikeNameAndDate(@Param("name") String name, Date createtime, @Param("startpage") int startpage,
			@Param("count") int count);

	Integer findCountName(@Param("name") String name);

	List<Order> findStatus(@Param("status") String status, @Param("startpage") int startpage,
			@Param("count") int count);

	List<Order> findStatusAndName(@Param("status") String status, @Param("startpage") int startpage,
			@Param("count") int count, @Param("name") String name);

	List<Order> findByDate(Date createtime, @Param("startpage") int startpage, @Param("count") int count);

	List<Order> findByName(@Param("name") String name, @Param("startpage") int startpage, @Param("count") int count);

	List<Order> findByPhone(@Param("phone") String phone, @Param("startpage") int startpage, @Param("count") int count);

	List<Order> findByGoodsanDate(@Param("") String goodsname, @Param("startpage") int startpage,
			@Param("count") int count);

	List<Order> findLikeDate(@Param("orderid") String orderid, @Param("startpage") int startpage,
			@Param("count") int count);

	Integer findOrderidCount(@Param("orderid") String orderid);

	Integer findOrderCount(@Param("orderid") String orderid);

	List<Order> queryAll(@Param("startpage") int startpage, @Param("count") int count);

}
