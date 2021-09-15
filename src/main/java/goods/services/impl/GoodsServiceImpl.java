package goods.services.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.entity.Goods;
import goods.mapper.GoodsMapper;
import goods.services.GoodsService;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public int IfNameExist(String coursename) {
		// TODO Auto-generated method stub
		return goodsMapper.IfNameExist(coursename);
	}

	@Override
	public List<Goods> queryAll(int startpage, int count) {
		// TODO Auto-generated method stub
		return goodsMapper.queryAll(startpage, count);
	}

	@Override
	public List<Goods> findByFenlei(String fenlei, int startpage, int count) {
		// TODO Auto-generated method stub
		return goodsMapper.findByFenlei(fenlei, startpage, count);
	}

	@Override
	public Goods findGoodsById(String id) {
		// TODO Auto-generated method stub
		return goodsMapper.findGoodsById(id);
	}

	@Override
	public Goods findByname(String coursename) {
		// TODO Auto-generated method stub
		return goodsMapper.findByname(coursename);
	}

	@Override
	public void deleteByname(String coursename) {
		// TODO Auto-generated method stub
		goodsMapper.deleteByname(coursename);
	}

	@Override
	public void deleteByGoodsId(String id) {
		// TODO Auto-generated method stub
		goodsMapper.deleteByGoodsId(id);
	}

	@Override
	public void AddGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.AddGoods(goods);
	}

	@Override
	public void updategoodsById(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.updategoodsById(goods);
	}

	@Override
	public void updateGoodsByname(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.updateGoodsByname(goods);
	}

	@Override
	public List<Goods> findAllFenlei() {
		// TODO Auto-generated method stub
		return goodsMapper.findAllFenlei();
	}

	@Override
	public Integer findgoodsNum() {
		// TODO Auto-generated method stub
		return goodsMapper.findgoodsNum();
	}

	@Override
	public List<Goods> findHot(String temp2, int startpage, int count) {
		// TODO Auto-generated method stub
		return goodsMapper.findHot(temp2, startpage, count);
	}

	@Override
	public List<Goods> findNew(int startpage, int count) {
		// TODO Auto-generated method stub
		return goodsMapper.findNew(startpage, count);
	}

	@Override
	public List<Goods> findLikename(String coursename,int startpage,int count) {
		// TODO Auto-generated method stub
		return goodsMapper.findLikename(coursename,startpage,count);
	}

	@Override
	public List<Goods> findLikeType(String fenlei) {
		// TODO Auto-generated method stub
		return goodsMapper.findLikeType(fenlei);
	}

	@Override
	public List<Goods> findLikeNameAndType(String fenlei, String coursename) {
		// TODO Auto-generated method stub
		return goodsMapper.findLikeNameAndType(fenlei, coursename);
	}

}
