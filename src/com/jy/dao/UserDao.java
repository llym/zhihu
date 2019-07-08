package com.jy.dao;

import java.util.List;

import com.jy.entity.User;

public interface UserDao {
	public User findUser(String username);
	
	public void insertUser(User user);

	public User checkTelnum(User user);

	public List<User> getAllUser();

	public User getUserById(int id);
	
}