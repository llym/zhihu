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
public class UserController {
	@Autowired
	private UserService userservice;
	
	@RequestMapping("updatePersonalData.do")
	public ModelAndView personalData(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("username");	
		User user= userservice.findaUser(name);
		ModelAndView mav = new ModelAndView("personalData");
		mav.addObject("user",user);
		return mav;
	}
	@RequestMapping("personalSetting.do")
	public ModelAndView personalSetting() {
		ModelAndView mav = new ModelAndView("personalSetting");
		return mav;
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		//注销登录
		request.getSession().invalidate();
		ModelAndView mav = new ModelAndView("redirect:personalSetting.do");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="getUserInfo.do",produces="html/text;charset=utf-8")
	public String getUserInfo(String username,HttpServletRequest request) {
		//向session中注入用户信息
		User user = userservice.getUserById(username);
		request.getSession().setAttribute("userTelNum", user.getTelnum());
		request.getSession().setAttribute("userEmail", user.getAdress());
		return "";
	}
	@ResponseBody
	@RequestMapping(value="updatePassword.do",produces="html/text;charset=utf-8")
	public String updatePassword(String username,String newPassword,HttpServletRequest request) {
		//修改密码
		User user = new User();
		System.out.println(username);
		System.out.println(newPassword);
		
		
		user.setUserid(username);
		user.setPassword(newPassword);
		
		return userservice.updatePassword(user);
	}
	
	@ResponseBody
	@RequestMapping(value="updateTelNum.do",produces="html/text;charset=utf-8")
	public String updateTelNum(String username,String newTelNum,HttpServletRequest request) {
		//修改密码
		User user = new User();
		System.out.println(username);
		System.out.println(newTelNum);
		
		
		user.setUserid(username);
		user.setTelnum(newTelNum);
		
		return userservice.updateTelNum(user,request);
	}
	
	@ResponseBody
	@RequestMapping(value="updateEmail.do",produces="html/text;charset=utf-8")
	public String updateEmail(String username,String newEmail,HttpServletRequest request) {
		//修改密码
		User user = new User();
		System.out.println(username);
		System.out.println(newEmail);
		
		
		user.setUserid(username);
		user.setAdress(newEmail);
		
		return userservice.updateEmail(user);
	}
}
