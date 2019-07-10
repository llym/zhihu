package com.jy.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.service.UserService;
import com.jy.dao.UserDao;
import com.jy.entity.User;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public String findUserService(String username, String password, HttpSession session) {
		try {
			System.out.println("通过userid查找用户");
			User user = userDao.findUser(username);
			if (user != null) {
				System.out.println("通过userid找到用户，进行密码验证");
				if (user.getPassword().equals(password)) {
					session.setAttribute("username", username);
					return "登录成功";
				} else {
					return "密码错误";
				}
			}else{
				System.out.println("未能通过userid查找用户");
				System.out.println("通过telnum查找用户");
				user = userDao.finUserByTel(username);
				if(user != null) {
					if(user.getPassword().equals(password))
					{
						session.setAttribute("username", user.getUserid());
						return "登录成功";
					}else 
						return "密码错误！";
				}else {
					System.out.println("未能通过telnum查找用户");
					System.out.println("通过email查找用户");
					user = userDao.finUserByEmail(username);
					if(user != null) {
						if(user.getPassword().equals(password))
						{
							session.setAttribute("username", user.getUserid());
							return "登录成功";
						}else 
							return "密码错误！";
					}else 
						return "账号错误！";
				}
			}
		} catch (Exception e) {
			System.out.println("错误信息:"+e.getMessage());
			
			return "账号错误";
		}
	}

	@Override
	public String insertUserService(User user) {
		try {
			userDao.insertUser(user);
			return "注册成功";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "注册失败";
		}
	}

	@Override
	public String checkTelnumService(User user) {

		try {
			User user2 = userDao.checkTelnum(user);
			if (user2 == null)
				return "";
			else
				return "该手机号已注册";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "";
		}
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userDao.getAllUser();
	}

	@Override
	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userDao.getUserById(id);
	}

	@Override
	public String updatePassword(User user) {
		try {
			userDao.updatePassword(user);
			return "修改成功！";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "修改失败！";
		}
	}

	@Override
	public String updateTelNum(User user, HttpServletRequest request) {
		try {
			userDao.updateTelNum(user);

			return "修改成功！";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "修改失败！";
		}
	}

	@Override
	public String updateEmail(User user) {
		try {
			userDao.updateEmail(user);
			return "修改成功！";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "修改失败！";
		}
	}

	@Override
	public List<User> searchuserService(String name) {
		// TODO Auto-generated method stub
		return userDao.searchuser(name);
	}
}
