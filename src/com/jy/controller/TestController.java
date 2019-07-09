package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answercomment;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Rquestioncomment;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RQuestionCommentService;

@Controller
public class TestController {
	@Autowired
	private QuestionCommentService questioncommentservice ;
	@Autowired
	private RQuestionCommentService rquestioncommentservice;
	@Autowired
	private QuestionService questionservice ;
	
	@RequestMapping("/test.do")
	 public  ModelAndView test(Model model,@RequestParam("questionid") String id){
		Integer a=Integer.decode(id);	//a为前台传的问题id
		Question question=questionservice.getaQuestionService(a);
		System.out.println(question.getQuestionname());
		List<Questioncomment> list = questioncommentservice.getQuestioncommentService(question.getQuestionid());
		System.out.println(list);
		List<Rquestioncomment> list1 = new ArrayList<Rquestioncomment>();	
		List<Rquestioncomment> list2 = new ArrayList<Rquestioncomment>();	
		for(int i=0;i<list.size();i++) {
			 System.out.println(list.get(i).getCommentid());  
			 list1=rquestioncommentservice.getRquestioncommentService(list.get(i).getCommentid());
			 list2.addAll(list1);
		}
		System.out.println(list2);
		ModelAndView mav =new ModelAndView("WriteAnswer");
		mav.addObject("question",question);
		mav.addObject("questioncomment",list);
		mav.addObject("rquestioncomment",list2);
		
		return mav;
	}
	
	
}
