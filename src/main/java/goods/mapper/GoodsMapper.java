package goods.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import goods.entity.Goods;

public interface GoodsMapper {

	Integer findgoodsNum();
	
	List<Goods> findLikename(@Param("coursename") String coursename, @Param("startpage") int startpage, @Param("count") int count);
	
	List<Goods> findLikeType(@Param("fenlei") String fenlei);
	
	List<Goods> findLikeNameAndType(@Param("coursename") String coursename,@Param("fenlei") String fenlei);

	List<Goods> findAllFenlei();

	List<Goods> findHot(@Param("temp2") String temp2, @Param("startpage") int startpage, @Param("count") int count);

	List<Goods> findNew(@Param("startpage") int startpage, @Param("count") int count);

	int IfNameExist(@Param("coursename") String coursename);

	List<Goods> queryAll(@Param("startpage") int startpage, @Param("count") int count);

	List<Goods> findByFenlei(@Param("fenlei") String fenlei, @Param("startpage") int startpage,
			@Param("count") int count);

	Goods findGoodsById(@Param("id") String id);

	Goods findByname(@Param("coursename") String coursename);

	void deleteByname(@Param("coursename") String coursename);

	void deleteByGoodsId(@Param("id") String id);

	void AddGoods(Goods goods);

	void updategoodsById(Goods goods);

	void updateGoodsByname(Goods goods);

}
