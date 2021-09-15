package liuyan.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import liuyan.entity.Liuyan;
import liuyan.mapper.LiuyanMapper;
import liuyan.services.LiuyanServices;

@Service("liuyanServices")
public class LiuyanServicesImpl implements LiuyanServices {

	@Autowired
	private LiuyanMapper liuyanMapper;

	@Override
	public Integer findLiuyanNum() {
		// TODO Auto-generated method stub
		return liuyanMapper.findLiuyanNum();
	}

	@Override
	public List<Liuyan> queryAll() {
		// TODO Auto-generated method stub
		return liuyanMapper.queryAll();
	}

	@Override
	public Liuyan findById(String id) {
		// TODO Auto-generated method stub
		return liuyanMapper.findById(id);
	}

	@Override
	public void deleteByLiuyanId(String id) {
		// TODO Auto-generated method stub
		liuyanMapper.deleteByLiuyanId(id);
	}

	@Override
	public void addLiuyan(Liuyan liuyan) {
		// TODO Auto-generated method stub
		liuyanMapper.addLiuyan(liuyan);
	}

	@Override
	public Integer findNoreadLiuyanNum(String isread) {
		// TODO Auto-generated method stub
		return liuyanMapper.findNoreadLiuyanNum(isread);
	}

	@Override
	public void updateLiuyanById(Liuyan liuyan) {
		// TODO Auto-generated method stub
		liuyanMapper.updateLiuyanById(liuyan);
	}


	
}
