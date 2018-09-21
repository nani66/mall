package com.augustars.mall.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.augustars.mall.entity.Menu;
import com.augustars.mall.entity.Role;
import com.augustars.mall.entity.User;
import com.augustars.mall.switcher.MenuSwitcher;

@Controller("indexController")
public class IndexController extends BaseController {
	@Reference(version="1.0.0")
	private MenuSwitcher menuSwitcher;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getIndex() throws Exception {
		System.out.println("getIndex()....");
		// 获取该用户所对应的所有操作菜单
		// 获取当前登录用户
		User user = (User) session.getAttribute("user");
		// 通过该用户获取对应的角色信息
		Role role = user.getRole();
//		// 通过角色获取该角色对应的所有菜单
//		List<Menu> menuList = role.getMenuList();
		// 根据角色，获取该角色所对应的menuList
		List<Menu> menuList = menuSwitcher.getMenuListByRole(role);
		// 转发到首页面
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("menuList", menuList);
		return new ModelAndView("index", resultMap);
	}
	
}
