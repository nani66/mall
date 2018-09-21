package com.augustars.mall.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Reference;
import com.augustars.mall.entity.User;
import com.augustars.mall.switcher.UserSwitcher;

@Component("shiroDBRealm")
public class ShiroDBRealm extends AuthorizingRealm {
	
	@Reference(version="1.0.0")
	private UserSwitcher userSwitcher;
	
	/**
	 * 进行权限授权的时候调用
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
		return null;
	}

	/**
	 * 进行用户身份验证的时候进行调用
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 将默认的token切换成UsernamePasswordToken
		UsernamePasswordToken userToken = (UsernamePasswordToken) token;
		// 获得登录用户名
		String loginName = userToken.getUsername();
		// 对于登录密码进行加密
		char[] chrs = userToken.getPassword();
		if (loginName != null && !"".equals(loginName.trim()) && 
				chrs != null && chrs.length > 0) {
			// 将加密后的密码重新设定回userToken中
			userToken.setPassword(EncryptionUtil.encrypt(new String(userToken.getPassword())).toCharArray());
			// 通过使用loginName查询用户信息
			try {
				User user = userSwitcher.getUserByLoginName(loginName);
				// 调用Shiro进行判断
				if (user != null && ConstantsUtil.STATUS_YES.equals(user.getStatus().getStatusCode())) {
					// 将正确的用户信息和密码交给Shiro进行判断
					SimpleAuthenticationInfo info = 
							new SimpleAuthenticationInfo(user.getLoginName(), user.getPassword(), getName());
					// 默认登录成功，绑定Session
					SecurityUtils.getSubject().getSession().setAttribute("user", user);
					return info;
				} else {
					throw new AuthenticationException("该用户无法登陆，请联系管理员");
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new AuthenticationException("系统异常");
			}
		} else {
			throw new AuthenticationException("请填写用户名或密码");
		}
	}
	
}








