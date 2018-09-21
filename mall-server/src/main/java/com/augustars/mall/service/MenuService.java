package com.augustars.mall.service;

import java.util.List;

import com.augustars.mall.entity.Menu;
import com.augustars.mall.entity.Role;

public interface MenuService {
	public List<Menu> getMenuListByRole(Role role) throws Exception;

}
