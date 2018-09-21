package com.augustars.mall.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.augustars.mall.entity.Menu;

public interface MenuDao extends JpaRepository<Menu, Long> {
	@Query(value="from Menu m join fetch m.roleList r where r.roleId=:roleId and m.parent is null")
	public List<Menu> findFirstMenuList(@Param("roleId")Long roleId) throws Exception;
	
	@Query(value="from Menu m join fetch m.roleList r where r.roleId=:roleId and m.parent.menuId=:parentId")
	public List<Menu> findSecondMenuList(@Param("roleId")Long roleId, @Param("parentId")Long menuId) throws Exception;

}
