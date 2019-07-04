package com.jy.serviceImpl;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String findUserService(String username, String password,HttpSession session) {
		
		try {
			User user=userDao.findUser(username);
			String a=user.getUserid();
			String b=user.getPassword();
			System.out.println(a);
			System.out.println(b);
		if (user!=null) {
			if (a.equals(username)&&b.equals(password)) {
				session.setAttribute("username", username);
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
	public String insertUserService(User user) {
		try {
			userDao.insertUser(user);
			return "注册成功";
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			return "注册失败";
		}
	}

	@Override
	public String checkTelnumService(User user) {
		
		try {
			User user2 = userDao.checkTelnum(user);
			if(user2==null)
				return "";
			else
				return "该手机号已注册";
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			return "";
		}
	}	
}
