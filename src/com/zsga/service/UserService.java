package com.zsga.service;

import com.zsga.domain.User;

public interface UserService {
	User findUser(String userName, String userPwd);
	void saveUser(User user);
}
