package cn.lj.shishicai.repository;

import cn.lj.shishicai.entity.User;

public interface UserDao extends IBaseDao<User,Integer>{

	User findByUsername(String username);

}
