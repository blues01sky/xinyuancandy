package order.services.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.entity.Order;
import order.mapper.OrderMapper;
import order.services.OrderServices;
import xiaoshoue.entity.Xioashoue;

@Service("orderServices")
public class OrderServicesImpl implements OrderServices {

	@Autowired
	private OrderMapper orderMapper;

	@Override
	public void updatedingdanByOrderId(Order order) {
		// TODO Auto-generated method stub
		orderMapper.updatedingdanByOrderId(order);
	}

	@Override
	public void adddingdan(Order order) {
		// TODO Auto-generated method stub
		orderMapper.adddingdan(order);
	}

	@Override
	public void deleteByOrderid(String orderid) {
		// TODO Auto-generated method stub
		orderMapper.deleteByOrderid(orderid);
	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		orderMapper.deleteById(id);
	}

	@Override
	public void deleteByName(String name) {
		// TODO Auto-generated method stub
		orderMapper.deleteByName(name);
	}

	@Override
	public List<Order> finddingdanById(String id, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.finddingdanById(id, startpage, count);
	}

	@Override
	public List<Order> findLikeName(String name, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findLikeName(name, startpage, count);
	}

	@Override
	public List<Order> findLikeNameAndDate(String name, Date createtime, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findLikeNameAndDate(name, createtime, startpage, count);
	}

	@Override
	public List<Order> findByDate(Date createtime, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findByDate(createtime, startpage, count);
	}

	@Override
	public List<Order> findByName(String name, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findByName(name, startpage, count);
	}

	@Override
	public List<Order> findByPhone(String phone, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findByPhone(phone, startpage, count);
	}

	@Override
	public List<Order> findByGoodsanDate(String goodsname, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findByGoodsanDate(goodsname, startpage, count);
	}

	@Override
	public List<Order> findLikeDate(String orderid, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findLikeDate(orderid, startpage, count);
	}

	@Override
	public Integer findOrderidCount(String orderid) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderidCount(orderid);
	}

	@Override
	public Integer findOrderCount(String orderid) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderCount(orderid);
	}

	@Override
	public List<Order> queryAll(int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.queryAll(startpage, count);
	}

	@Override
	public Integer findCountName(String name) {
		// TODO Auto-generated method stub
		return orderMapper.findCountName(name);
	}

	@Override
	public List<Order> findStatus(String status, int startpage, int count) {
		// TODO Auto-generated method stub
		return orderMapper.findStatus(status, startpage, count);
	}

	@Override
	public List<Order> findStatusAndName(String status, int startpage, int count, String name) {
		// TODO Auto-generated method stub
		return orderMapper.findStatusAndName(status, startpage, count, name);
	}

	@Override
	public Integer findOrderstatus(String status) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderstatus(status);
	}

	@Override
	public void updatedingdanById(Order order) {
		// TODO Auto-generated method stub
		orderMapper.updatedingdanById(order);
	}

	@Override
	public Integer IfStatusAndName(String status, String name) {
		// TODO Auto-generated method stub
		return orderMapper.IfStatusAndName(status, name);
	}

	@Override
	public List<Order> findStatusAndNameNoLimit(String status, String name) {
		// TODO Auto-generated method stub
		return orderMapper.findStatusAndNameNoLimit(status, name);
	}

	@Override
	public List<Order> findOrderid(String orderid) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderid(orderid);
	}

	@Override
	public List<Order> findTemp5(String temp5) {
		// TODO Auto-generated method stub
		return orderMapper.findTemp5(temp5);
	}

	@Override
	public Order findStatusAndNameAndTemp5(String status, String name, String temp5) {
		// TODO Auto-generated method stub
		return orderMapper.findStatusAndNameAndTemp5(status, name, temp5);
	}

	@Override
	public Integer IfStatusAndNameAndTemp5(String status, String name, String temp5) {
		// TODO Auto-generated method stub
		return orderMapper.IfStatusAndNameAndTemp5(status, name, temp5);
	}

	@Override
	public List<Order> findStatusOrder(String status) {
		// TODO Auto-generated method stub
		return orderMapper.findStatusOrder(status);
	}

	@Override
	public List<Xioashoue> findxiaoshoue() {
		// TODO Auto-generated method stub
		return orderMapper.findxiaoshoue();
	}

}
