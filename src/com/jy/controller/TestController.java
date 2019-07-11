package com.jy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.entity.Carequestion;
import com.jy.entity.Careuser;
import com.jy.entity.Idea;
import com.jy.entity.Privatemessage;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.CareQuestionService;
import com.jy.service.CareUserService;
import com.jy.service.PrivateMessageService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;
import com.jy.service.UserService;

@Controller
public class TestController {
	@Autowired
	private QuestionService questionservice ;
	@Autowired
	private UserService userservice;
	@Autowired
	private QuestionCommentService questioncommentservice ;
	@Autowired
	private RQuestionCommentService rquestioncommentservice;
	@Autowired
	private CareUserService  careuserservice;
	
	@RequestMapping("test1.do")
	public ModelAndView  test() {
	
		List<Question> qlist =questionservice.searchquestionService("如何");
		System.out.println(qlist);
		List<Questioncomment> list1 = new ArrayList<Questioncomment>();	
		List<Questioncomment> list2 = new ArrayList<Questioncomment>();	
		List<Rquestioncomment> list3 = new ArrayList<Rquestioncomment>();	
		List<Rquestioncomment> list4 = new ArrayList<Rquestioncomment>();	
		for(int i=0;i<qlist.size();i++) {
			System.out.println(qlist.get(i).getQuestionid());
			 list1=questioncommentservice.getQuestioncommentService(qlist.get(i).getQuestionid());
			 list2.addAll(list1);
		}
		for(int i=0;i<list2.size();i++) {
			System.out.println(list2.get(i).getCommentid());
			 list3=rquestioncommentservice.getRquestioncommentService(list2.get(i).getCommentid());
			 list4.addAll(list3);	
		}
		System.out.println(list2);
		System.out.println(list4);
		/*	模糊查询用户（可用）	
		List<User> ulist =userservice.searchuserService("李");
		System.out.println(ulist);
		*/
		ModelAndView mav =new ModelAndView("searchResult");
		
		mav.addObject("qlist",qlist);
		mav.addObject("comlist",list2);
		mav.addObject("rcomlist",list4);
		
		return mav;
	}
	
	@RequestMapping("test2.do")
	public ModelAndView  test2() {
	
		
		List<User> ulist =userservice.searchuserService("李");
		System.out.println(ulist);

		ModelAndView mav =new ModelAndView("searchUser");
		mav.addObject("ulist",ulist);
		
		
		return mav;
	}
	
	@RequestMapping("test3.do")
	public String test3() {
	
		
//		List<User> ulist =userservice.searchuserService("李");
//		System.out.println(ulist);
//
//		ModelAndView mav =new ModelAndView("searchUser");
//		mav.addObject("ulist",ulist);
		
		
		return "searchArticle";
	}
	
	
	@RequestMapping("/care.do")
	 public String care(){
		List<Careuser> list=careuserservice.getallCUService("111");
		System.out.println(list);
		return "care";
		
	}
}
