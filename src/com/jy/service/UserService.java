package com.jy.service;
import java.util.List;

import com.jy.entity.User;

public interface UserService {
	
	public String findUserService(String username,String password);
	
	public String insertUserService(User user);
}
