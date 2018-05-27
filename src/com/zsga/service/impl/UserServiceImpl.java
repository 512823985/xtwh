package com.zsga.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zsga.dao.UserMapper;
import com.zsga.domain.User;
import com.zsga.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;

	@Override
	public User findUser(String userName, String userPwd) {
		User user = new User();
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		User result = userMapper.queryUser(user);
		return result;
	}

	@Override
	public void saveUser(User user) {
		userMapper.addUser(user);
	}

	
}
