package com.augustars.mall.switcher;

import java.util.List;

import com.augustars.mall.entity.Menu;
import com.augustars.mall.entity.Role;

public interface MenuSwitcher {
	public List<Menu> getMenuListByRole(Role role) throws Exception;

}
