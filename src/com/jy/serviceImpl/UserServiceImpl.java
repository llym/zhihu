package com.jy.serviceImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.service.UserService;
import com.jy.dao.UserDao;
import com.jy.entity.User;


@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	public String findUserService(String username, String password) {
		
		try {
			User user=userDao.findUser(username);
			String a=user.getUserid();
			String b=user.getPassword();
			System.out.println(a);
			System.out.println(b);
		if (user!=null) {
			if (a.equals(username)&&b.equals(password)) {
				return "登录成功";
			}
			else {
				return "密码错误";
			}
		}
		return "账号错误";
		}
		catch(Exception e){
		return "账号错误";	
		}
	}

	@Override
	public void insertUserService(User user) {
		userDao.insertUser(user);
	}	
}
