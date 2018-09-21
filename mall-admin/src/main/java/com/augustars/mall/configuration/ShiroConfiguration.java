package com.augustars.mall.configuration;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.augustars.mall.util.ShiroDBRealm;

@Configuration
public class ShiroConfiguration {
	@Bean
	public ShiroDBRealm shiroDBRealm() {
		return new ShiroDBRealm();
	}
	
	/**
	 * 获得SecurityManagerBean
	 */
	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = 
				new DefaultWebSecurityManager();
		securityManager.setRealm(shiroDBRealm());
		return securityManager;
	}
	
	@Bean
	public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
		// 获得过滤对象
		ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
		// 设定核心安全管理对象
		shiroFilter.setSecurityManager(securityManager);
		// 设定认证请求
		shiroFilter.setLoginUrl("/user/userLogin");
		// 默认的认证成功之后的重定向地址
		shiroFilter.setSuccessUrl("/");
		// 设定其他过滤规则
		Map<String, String> filterChainDefinitionMap = 
				new LinkedHashMap<String, String>();
		// anon表示不需要认证
		filterChainDefinitionMap.put("/static/**", "anon");
		// 退出请求使用退出规则
		filterChainDefinitionMap.put("/user/logout", "logout");
		// "/**", "authc"表示剩余请求全部需要认证
		filterChainDefinitionMap.put("/**", "authc");
		shiroFilter.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return shiroFilter;
	}
}
