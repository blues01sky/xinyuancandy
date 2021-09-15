package admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import admin.entity.Admin;

public interface AdminMapper {

	List<Admin> queryAll(@Param("startpage") Integer startpage, @Param("count") Integer count);

	Admin findByAdminname(@Param("adminname") String adminname);

	Admin findAdminById(@Param("id") Integer id);

	void deleteByAdminname(@Param("adminname") String adminname);

	void deleteByAdminId(@Param("id") Integer id);

	void addAdmin(Admin admin);

	void updateAdminById(Admin admin);

	void updateAdminByUsername(Admin admin);

	Integer findAdminNum();

	Integer IfNameExist(@Param("adminname") String adminname);

}
