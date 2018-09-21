package com.augustars.mall.switcher.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.augustars.mall.entity.User;
import com.augustars.mall.service.UserService;
import com.augustars.mall.switcher.UserSwitcher;

@Component("userSwitcher")
@Service(version="1.0.0")
public class UserSwitcherImpl implements UserSwitcher {
	
	@Resource(name="userService")
	private UserService userService;
	
	public User getUserByLoginName(String loginName) throws Exception {
		User user = userService.getUserByLoginName(loginName);
		return user;
	}

	public Map<String, Object> getUserListByPage(Integer pageNum, Integer pageSize, String username) throws Exception {
		Map<String, Object> resultMap = userService.getUserListByPage(pageNum, pageSize, username);
		return resultMap;
	}



}
