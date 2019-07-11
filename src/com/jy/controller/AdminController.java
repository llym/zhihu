package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.entity.Idea;
import com.jy.entity.QA;
import com.jy.entity.Question;
import com.jy.entity.Ranswercomment;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.IdeaService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.UserService;

import net.sf.json.JSONArray;


@Controller
public class AdminController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private QuestionService questionservice ;
	@Autowired
	private AnswerService answerservice;
	@Autowired
	private AnswerCommentService answercommentservice;
	@Autowired
	private RAnswerCommentService ranswercommentservice;
	@Autowired
	IdeaService ideaService;
	
	
	@ResponseBody
	@RequestMapping(value="adminLogin.do",produces="html/text;charset=utf-8")
	public String adminLogin(String username,String password,HttpServletRequest request){
		request.getSession().setAttribute("username", username);
		System.out.println("username:"+username+"pa:"+password);
		if(username.equals("admin") && password.equals("123456"))
			return "success";
		else
			return "登录失败！";
	}
	@RequestMapping("adminHome.do")
	public ModelAndView adminHome(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin/adminUser");
		List<User> userList=userservice.getAllUser();
		List<List>  stringList = new ArrayList<List>();
		JSONArray jsonArray = new JSONArray();
	    
		for(User user : userList) {
			jsonArray.add(user);
		}
		//JSONArray object=JSONArray.fromObject(userList);
		mav.addObject("userList",jsonArray);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="getPhotoPath.do",produces="html/text;charset=utf-8")
	public String getPhotoPath(String id,HttpServletRequest request){
		User user = userservice.getUserById(id);
		String path = user.getPhoto();
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value="getIdeaPhotoPath.do",produces="html/text;charset=utf-8")
	public String getIdeaPhotoPath(int id,HttpServletRequest request){
		Idea idea = ideaService.getIdeaById(id);
		
		String path = idea.getPhoto();
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value="closeUser.do",produces="html/text;charset=utf-8")
	public String closeUser(String userid,HttpServletRequest request){
		return userservice.closeUser(userid);
	}
	@ResponseBody
	@RequestMapping(value="openUser.do",produces="html/text;charset=utf-8")
	public String openUser(String userid,HttpServletRequest request){
		return userservice.openUser(userid);
	}
	
}
