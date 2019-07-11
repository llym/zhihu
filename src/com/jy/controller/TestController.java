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
import com.jy.entity.Article;
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
import com.jy.service.ArticleService;
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
	@Autowired
	private ArticleService  articleservice;

	
	
	@RequestMapping("searcharticle.do")
	public ModelAndView test3(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("sear");
		List<Article> arlist =articleservice.searcharticleService(name);
		System.out.println(arlist);
//		List<User> ulist =userservice.searchuserService("李");
//		System.out.println(ulist);
//
		ModelAndView mav =new ModelAndView("searchArticle");
		mav.addObject("arlist",arlist);
		
		
		return mav;
	}
	
	
	@RequestMapping("/care.do")
	 public ModelAndView  care(){
		
		List<Careuser> list=careuserservice.getallCUService("111");
		System.out.println(list);
		
		ModelAndView mav =new ModelAndView("care");
		mav.addObject("ulist",list);
		
		
		return mav;
	}
}
