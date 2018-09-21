package com.augustars.mall.switcher.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.augustars.mall.entity.Menu;
import com.augustars.mall.entity.Role;
import com.augustars.mall.service.MenuService;
import com.augustars.mall.switcher.MenuSwitcher;
@Component("menuSwitcher")
@Service(version="1.0.0")
public class MenuSwitcherImpl implements MenuSwitcher {
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	public List<Menu> getMenuListByRole(Role role) throws Exception {
		List<Menu> menuList = menuService.getMenuListByRole(role);
		return menuList;
	}

}
