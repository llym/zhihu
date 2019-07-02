package com.jy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.jy.entity.Follow;
import com.jy.entity.User;


public interface UserService {
	String findUser(String username,String userpassword,HttpServletRequest request);
	String addUser(String username,String password,String repassword);
	User findUserByName(String name);
	List<User> getAllUser();
	String delUser(int id);
	User getUserById(int id);
	void update(User user);
	List<User> searchUserByName(String name);
}
