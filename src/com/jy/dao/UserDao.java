package com.jy.dao;

import com.jy.entity.User;

public interface UserDao {
	public User findUser(String username);
	
	public void insertUser(User user);

	public User checkTelnum(User user);
	
}