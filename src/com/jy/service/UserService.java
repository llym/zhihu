package com.jy.service;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.jy.entity.User;

public interface UserService {
	
	public String findUserService(String username,String password, HttpSession session);
	
	public String insertUserService(User user);

	public String checkTelnumService(User user);

	public List<User> getAllUser();

	public User getUserById(int id);
}
