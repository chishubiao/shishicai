package cn.lj.shishicai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.lj.shishicai.entity.User;
import cn.lj.shishicai.repository.IBaseDao;
import cn.lj.shishicai.repository.UserDao;
@Service
public class UserService extends ABaseService<User,Integer> {
    @Autowired
    private UserDao userDao;
	@Override
	protected IBaseDao<User, Integer> getEntityDAO() {
		return userDao;
	}
	public User findByUsername(String username) {
		
		return userDao.findByUsername(username);
	}
	public boolean isExistUsername(String username) {
		return userDao.findByUsername(username)!=null;
	}



}
