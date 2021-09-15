package admin.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.entity.Admin;
import admin.mapper.AdminMapper;
import admin.services.AdminServices;

@Service("adminServices")
public class AdminServicesImpl implements AdminServices {

	@Autowired
	private AdminMapper adminMapper;

	@Override
	public List<Admin> queryAll(Integer startpage, Integer count) {
		// TODO Auto-generated method stub
		return adminMapper.queryAll(startpage, count);
	}

	@Override
	public Admin findByAdminname(String adminname) {
		// TODO Auto-generated method stub
		return adminMapper.findByAdminname(adminname);
	}

	@Override
	public void deleteByAdminname(String adminname) {
		// TODO Auto-generated method stub
		adminMapper.deleteByAdminname(adminname);
	}

	@Override
	public void deleteByAdminId(Integer id) {
		// TODO Auto-generated method stub
		adminMapper.deleteByAdminId(id);
	}

	@Override
	public void addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.addAdmin(admin);
	}

	@Override
	public void updateAdminById(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.updateAdminById(admin);
	}

	@Override
	public void updateAdminByUsername(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.updateAdminByUsername(admin);
	}

	@Override
	public Admin findAdminById(Integer id) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminById(id);
	}

	@Override
	public Integer IfNameExist(String adminname) {
		// TODO Auto-generated method stub
		return adminMapper.IfNameExist(adminname);
	}

	@Override
	public Integer findAdminNum() {
		// TODO Auto-generated method stub
		return adminMapper.findAdminNum();
	}

}
