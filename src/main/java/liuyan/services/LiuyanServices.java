package liuyan.services;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import liuyan.entity.Liuyan;

public interface LiuyanServices {
	
	Integer findNoreadLiuyanNum(@Param("isread") String isread);

	Integer findLiuyanNum();
	
	List<Liuyan> queryAll();
	
	Liuyan findById(@Param("id") String id);
	
	void deleteByLiuyanId(@Param("id") String id);
	
	void addLiuyan(Liuyan liuyan);
	
	void updateLiuyanById(Liuyan liuyan);
}
