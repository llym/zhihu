package com.jy.dao;

import java.util.List;

import com.jy.entity.User;

public interface UserDao {
	
	public User findUserByName(String name);
	public User findUser(User checkuser);
	public List<User> getAllUser();
	public void delUser(int id);
	public User getUserById(int id);
	public void update(User user);
	public void addUser(User user);
	public List<User> searchUserByName(String name);
}
