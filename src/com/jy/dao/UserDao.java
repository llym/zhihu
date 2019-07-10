package com.jy.dao;

import java.util.List;

import com.jy.entity.User;

public interface UserDao {
	public User findUser(String username);
	
	public void insertUser(User user);

	public User checkTelnum(User user);

	public List<User> getAllUser();
	
	public List<User> searchuser(String name);

	public User getUserById(String id);

	public void updatePassword(User user);

	public void updateTelNum(User user);
	public void updateEmail(User user);

	public void updateUserId(User user);

	public User finUserByTel(String username);

	public User finUserByEmail(String username);
	
}