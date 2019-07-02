package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.User;
import com.jy.service.FollowService;
import com.jy.service.UserService;

@Controller
@RequestMapping("")
public class FollowController {
	@Autowired
	FollowService followService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/myFollow")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入FollowController-myFollow");
        String name =(String) request.getSession().getAttribute("username");
        System.out.println(name);
        List<String> followList = followService.getUserFollow(name);
        List<User> userList = new ArrayList<User>();
        
        for(String n : followList) {
        	userList.add(userService.findUserByName(n));
        }
        ModelAndView mav = new ModelAndView("myFollow");
        mav.addObject("userList",userList);
        return mav;
    }
	
	@ResponseBody
	@RequestMapping(value="/addFollow",produces="html/text;charset=utf-8")
	public String addFollow(int user2,HttpServletRequest request) {
		String user1name = (String) request.getSession().getAttribute("username");
		int user1 = userService.findUserByName(user1name).getId();
		System.out.println("user1:"+user1+"\nuser2:"+user2);
		
		return followService.addFollow(user1,user2);
	}
	@ResponseBody
	@RequestMapping(value="/unfollow",produces="html/text;charset=utf-8")
	public String unfollow(int user2,HttpServletRequest request) {
		String user1name = (String) request.getSession().getAttribute("username");
		int user1 = userService.findUserByName(user1name).getId();
		System.out.println("user1:"+user1+"\nuser2:"+user2);
		
		return followService.unfollow(user1,user2);
	}
}
