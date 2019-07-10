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
import com.jy.entity.Privatemessage;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.CareQuestionService;
import com.jy.service.PrivateMessageService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;

@RestController
public class TestController {
	@Autowired
	private AnswerService answerservice;
	@Autowired
	private QuestionService questionservice;
	@Autowired
	private PrivateMessageService privatemessageService;

	
	
	@RequestMapping("test11.do")
	public String personal() {
		List<Privatemessage> list=privatemessageService.getPMService("111");
		System.out.println(list);
		return "12";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/privatem.do",produces="html/text;charset=utf-8")
	public String testcare(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(queid+"找到用户");
		
		List<Privatemessage> list=privatemessageService.getPMService(queid);
		request.getSession().setAttribute("pmlist",list);
		System.out.println(list);
		return "123321";
	}
}
