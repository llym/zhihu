package com.jy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.User;
import com.jy.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
	private UserService userservice;
	
//	//测试界面
//	@RequestMapping("/test.do")
//	public String error() {
//		
//		String a=userservice.findUserService("111","222");
//		System.out.println(a);
//		return "hello";
//	}
//	
	//登录指令
	@ResponseBody
	@RequestMapping(value="/login.do",produces="html/text;charset=utf-8")
	public String login(String username,String password,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(username+"++++"+password);
		String a=userservice.findUserService(username,password);
		System.out.println(a);
		return a;
	}
	
	@ResponseBody
	@RequestMapping(value="/register.do",produces="html/text;charset=utf-8")
	public String register(String telnum,String password,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(telnum+"++++"+password);
		User user = new User();
		user.setTelnum(telnum);
		user.setPassword(password);
		userservice.insertUserService(user);
		return "注册成功";
	}

}
