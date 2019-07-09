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
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.CareQuestionService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;

@RestController
public class TestController {
	@Autowired
	private AnswerService answerservice;
	@ResponseBody
	@RequestMapping(value="/insertanswer.do",produces="html/text;charset=utf-8")
	public String insertan(String queid,String content,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		Date date = new Date();
		String name=(String) request.getSession().getAttribute("username");
		Answer answer=new Answer();
		answer.setAnswercontent(content);
		answer.setUserid(name);
		answer.setQuestionid(Integer.decode(queid));
		answer.setCreatetime(date);
		answerservice.insertAnswerService(answer);
		return "提交成功";
		
	}
}
