package cn.lj.shishicai.service.account;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import cn.lj.shishicai.service.account.ShiroDbRealm.ShiroUser;

public class SessionUser {
	public SessionUser() {
	}

	public static ShiroUser getShiroUser() {
		Subject user = SecurityUtils.getSubject();
		if (user == null) {
			return null;
		}
		ShiroUser shiroUser = (ShiroUser) user.getPrincipal();
		if (shiroUser == null) {
			return null;
		}
		return shiroUser;
	}

	public static Session getSession() {
		Subject user = SecurityUtils.getSubject();
		if (user == null) {
			return null;
		}
		Session session = user.getSession();
		return session;
	}

	public static Integer getUserId() {
		ShiroUser shiroUser = getShiroUser();
		if (shiroUser == null) {
			return null;
		}
		return shiroUser.id;
	}

	public static String getUsername() {
		ShiroUser shiroUser = getShiroUser();
		if (shiroUser == null) {
			return null;
		}
		return shiroUser.toString();
	}

	public static String getName() {
		ShiroUser shiroUser = getShiroUser();
		if (shiroUser == null) {
			return null;
		}
		return shiroUser.username;
	}
	
	public static Byte getType() {
		ShiroUser shiroUser = getShiroUser();
		if (shiroUser == null) {
			return null;
		}
		return shiroUser.type;
	}

}
