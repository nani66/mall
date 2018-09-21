package com.augustars.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.augustars.mall.dao.MenuDao;
import com.augustars.mall.entity.Menu;
import com.augustars.mall.entity.Role;
import com.augustars.mall.service.MenuService;

@Service("menuService")
@Transactional
public class MenuServiceImpl implements MenuService {
	
	@Resource(name="menuDao")
	private MenuDao menuDao;
	
	public List<Menu> getMenuListByRole(Role role) throws Exception {
		// 根据角色获取所有的一级菜单
		List<Menu> menuList = menuDao.findFirstMenuList(role.getRoleId());
		// 将获取的一级菜单列表进行循环，获得每个一级菜单的二级菜单集合
		for (Menu first : menuList) {
			List<Menu> childMenuList = menuDao.findSecondMenuList(role.getRoleId(), first.getMenuId());
			first.setChildMenuList(childMenuList);
		}
		return menuList;
	}

}
