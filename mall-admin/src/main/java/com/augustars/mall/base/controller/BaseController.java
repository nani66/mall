package com.augustars.mall.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("baseController")
public class BaseController {
	// @Autowired表示依赖注入，不以bean的ID值注入，而是以类型注入
	@Autowired
	protected HttpServletRequest request;
	@Autowired
	protected HttpSession session;
}
