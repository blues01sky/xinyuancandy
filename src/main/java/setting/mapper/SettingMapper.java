package setting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import setting.entity.Setting;

public interface SettingMapper {

	int IfNameExist(@Param("temp1") String temp1);

	List<Setting> findsetting();
	List<Setting> queryall();
	
	Setting queryone();

	int IfNameAndTypeExist(@Param("adminname") String adminname, @Param("pagetype") String pagetype);

	List<Setting> findBynameAndPagetype(@Param("startpage") Integer startpage, @Param("count") Integer count,
			@Param("adminname") String adminname, @Param("pagetype") String pagetype);

	Setting findSettingById(@Param("id") String id);

	List<Setting> findByname(@Param("adminname") String adminname);

	void deleteByname(@Param("adminname") String adminname);

	void deleteBySettingId(@Param("id") String id);

	void AddSetting(Setting setting);

	void updatesettingById(Setting setting);
}
