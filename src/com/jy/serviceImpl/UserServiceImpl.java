package com.jy.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.FollowDao;
import com.jy.dao.UserDao;
import com.jy.entity.Follow;
import com.jy.entity.User;
import com.jy.service.FollowService;
import com.jy.service.UserService;
@Service("UserService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	@Autowired 
	FollowService followService;
	@Override
	public String findUser(String name,String password,HttpServletRequest request) {
		System.out.println("进入service");
		User checkuser = new User();
		
		checkuser.setName(name);
		checkuser.setPassword(password);
		System.out.println(checkuser.getName());
        System.out.println(checkuser.getPassword());
		System.out.println("user:"+userDao.findUser(checkuser));
		User user = userDao.findUser(checkuser);
        if(user!=null) {
        	request.getSession().setAttribute("username", user.getName());
        	return "登录成功";
        }else {
        	user = userDao.findUserByName(name);
        	if(user==null) {
        		request.getSession().setAttribute("error", "用户不存在！");
        		return "用户不存在！";
        	}
        	else {
        		request.getSession().setAttribute("error", "密码错误！");
        		return "密码错误！";
        	}
        		
        }
	}

	
	@Override
	public String addUser(String username, String password, String repassword) {
		if(password.equals(repassword))
		{
			User user = new User();
			user.setName(username);
			user.setPassword(password);
			userDao.addUser(user);
			return "注册成功";
		}
		else
			return "注册失败，密码不一致";
	}


	@Override
	public List<User> getAllUser() {
		
		return userDao.getAllUser();
	}
	@Override
	public String delUser(int id) {
		try {
			userDao.delUser(id);
			followService.delFollow(id);
			return "删除成功";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "删除失败";
		}
		
	}


	@Override
	public User getUserById(int id) {
		
		return userDao.getUserById(id);
	}


	@Override
	public void update(User user) {
		userDao.update(user);
		
	}


	@Override
	public List<User> searchUserByName(String name) {
		
		return userDao.searchUserByName(name);
	}




	@Override
	public User findUserByName(String name) {
		
		return userDao.findUserByName(name);
	}
}
