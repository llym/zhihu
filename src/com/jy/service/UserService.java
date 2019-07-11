package com.jy.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jy.entity.User;

public interface UserService {
	
	public String findUserService(String username,String password, HttpSession session);
	
	public String insertUserService(User user);

	public String checkTelnumService(User user);

	public List<User> getAllUser();

	public User getUserById(String username);

	public String updatePassword(User user);

	public String updateTelNum(User user,HttpServletRequest request);

	public String updateEmail(User user);
	
	public List<User> searchuserService(String name);

	public String closeUser(String userid);

	public String openUser(String userid);
	
	public User findaUser(String userid);
	
	public void updateuser(User user);

	public List<User> adminSearchUser(String userid);
}
