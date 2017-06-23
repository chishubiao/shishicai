package cn.lj.shishicai.web;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lj.shishicai.entity.User;
import cn.lj.shishicai.service.UserService;
import cn.lj.shishicai.service.account.SessionUser;
@RequestMapping("/user")
@Controller
public class UserController extends ABaseController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/toModifyPassword")
	public String toModifyPassword() {
		return "user/modifyPassword";
	}
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public Map modifyPassword(String oldPassword, String password,
			String confirmPassword) {
		Date date = new Date();
		if (StringUtils.isBlank(password)
				|| StringUtils.isBlank(confirmPassword)
				|| !password.equals(confirmPassword))
			return getReturnMap(SUCCESS_CODE, "两次输入的密码不一致", null);

		try {
			Integer id = SessionUser.getUserId();
			User admin = userService.getById(id);
			if (!admin.getPassword()
					.equals(new Md5Hash(oldPassword).toString())) {
				return getReturnMap(ERROR_CODE, "密码认证错误", null);
			}
			admin.setPassword(new Md5Hash(password).toString());
			admin.setLastUpdateTime(date);
			userService.save(admin);
			return getReturnMap(SUCCESS_CODE, "更改成功", null);
		} catch (Exception e) {
			e.printStackTrace();
			return getReturnMap(ERROR_CODE, "网络错误", null);
		}
	}
}
