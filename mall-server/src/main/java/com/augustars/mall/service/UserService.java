package com.augustars.mall.service;

import java.util.Map;

import com.augustars.mall.entity.User;

public interface UserService {
	public User getUserByLoginName(String loginName) throws Exception;
	public Map<String, Object> getUserListByPage(Integer pageNum, Integer pageSize, String username) throws Exception;

}
