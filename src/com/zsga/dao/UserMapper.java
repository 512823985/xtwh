package com.zsga.dao;

import com.zsga.domain.User;

public interface UserMapper {
	User queryUser(User user);
	void addUser(User user);
}
