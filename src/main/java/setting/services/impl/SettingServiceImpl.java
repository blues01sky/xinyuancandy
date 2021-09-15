package setting.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import setting.entity.Setting;
import setting.mapper.SettingMapper;
import setting.services.SettingService;

@Service("settingService")
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingMapper SettingMapper;

	@Override
	public int IfNameExist(String temp1) {
		// TODO Auto-generated method stub
		return SettingMapper.IfNameExist(temp1);
	}

	@Override
	public List<Setting> findsetting() {
		// TODO Auto-generated method stub
		return SettingMapper.findsetting();
	}

	@Override
	public List<Setting> findBynameAndPagetype(Integer startpage, Integer count, String adminname, String pagetype) {
		// TODO Auto-generated method stub
		return SettingMapper.findBynameAndPagetype(startpage, count, adminname, pagetype);
	}

	@Override
	public Setting findSettingById(String id) {
		// TODO Auto-generated method stub
		return SettingMapper.findSettingById(id);
	}

	@Override
	public List<Setting> findByname(String adminname) {
		// TODO Auto-generated method stub
		return SettingMapper.findByname(adminname);
	}

	@Override
	public void deleteByname(String adminname) {
		// TODO Auto-generated method stub
		SettingMapper.deleteByname(adminname);
	}

	@Override
	public void deleteBySettingId(String id) {
		// TODO Auto-generated method stub
		SettingMapper.deleteBySettingId(id);
	}

	@Override
	public void AddSetting(Setting setting) {
		// TODO Auto-generated method stub
		SettingMapper.AddSetting(setting);
	}

	@Override
	public void updatesettingById(Setting setting) {
		// TODO Auto-generated method stub
		SettingMapper.updatesettingById(setting);
	}

	@Override
	public int IfNameAndTypeExist(String adminname, String pagetype) {
		// TODO Auto-generated method stub
		return SettingMapper.IfNameAndTypeExist(adminname, pagetype);
	}

	@Override
	public Setting queryone() {
		// TODO Auto-generated method stub
		return SettingMapper.queryone();
	}

	@Override
	public List<Setting> queryall() {
		// TODO Auto-generated method stub
		return SettingMapper.queryall();
	}

}
