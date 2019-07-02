package com.jy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Follow;
import com.jy.entity.User;
import com.jy.service.FollowService;
import com.jy.service.UserService;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	UserService userService;
	@Autowired
	FollowService followService;
	@ResponseBody
	@RequestMapping(value="/login.do",produces="html/text;charset=utf-8")
    public String handleRequest(String username,String password,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("LoginController->login");
        System.out.println(username);
        System.out.println(password);
        return "�����̨";
        /*if(username.equals(""))
        	return "�������˺�";
        return userService.findUser(username, password,request);*/
        
    }
	@RequestMapping("/register.do")
    public ModelAndView register(String username,String userpassword,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入Controller-register");
        ModelAndView mav = new ModelAndView("register");
        return mav;
    }
	@RequestMapping("/updateUser.do")
    public ModelAndView update(int id,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入UserController-update");
        ModelAndView mav = new ModelAndView("update");
        System.out.println(id);
        User user = userService.getUserById(id);
        mav.addObject("user",user);
        return mav;
    }
	@RequestMapping("/saveUpdateUser.do")
    public ModelAndView saveUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入UserController-saveUpdate");
        ModelAndView mav = new ModelAndView("redirect:/userList");
        String userId =request.getParameter("userId");
        System.out.println(userId);
        int id=Integer.parseInt(userId);
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        userService.update(user);
        return mav;
    }
	
	@RequestMapping("/loginResult.do")
    public ModelAndView loginResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入LoginController->loginResult");
        ModelAndView mav = new ModelAndView("homePage");
        return mav;
    }
	@RequestMapping("/test.do")
    public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入LoginController->loginResult");
        ModelAndView mav = new ModelAndView("test");
        return mav;
    }
	@RequestMapping("/userList.do")
    public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入LoginController->userList");
        ModelAndView mav = new ModelAndView("userList");
        String name = (String) request.getSession().getAttribute("username");
        int id = userService.findUserByName(name).getId();
        List<String> myFollowList = followService.getUserFollow(name);
        List<User> userList = userService.getAllUser();
        mav.addObject("userList",userList);
        mav.addObject("followList",myFollowList);
        return mav;
    }
	@RequestMapping("/searchUserByName")
    public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入Controller-search");
        ModelAndView mav = new ModelAndView("userList");
        String name = request.getParameter("searchUserName");
        List<User> userList = userService.searchUserByName(name);
        mav.addObject("userList",userList);
        return mav;
        
    }
	@ResponseBody
	@RequestMapping(value="/addUser",produces="html/text;charset=utf-8")
    public String addUser(String username,String password,String repassword,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入UserController");
        return userService.addUser(username, password,repassword);
    }
	
	@ResponseBody
	@RequestMapping(value="/delUser",produces="html/text;charset=utf-8")
    public String delUser(int id,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入UserController");
        return userService.delUser(id);
 		
        
    }
}
