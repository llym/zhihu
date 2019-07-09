package com.jy.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jy.entity.Carequestion;
import com.jy.service.CareQuestionService;
import com.jy.service.QuestionService;

@RestController
public class CareController {
	@Autowired
	private CareQuestionService carequestionservice;
	@Autowired
	private QuestionService questionservice;
	
	//关注
	@ResponseBody
	@RequestMapping(value="/insertcq.do",produces="html/text;charset=utf-8")
	public String insertcq(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(queid);
		Date date = new Date();
		String name=(String) request.getSession().getAttribute("username");
		Carequestion carequestion=new Carequestion();
		carequestion.setQuestionid(Integer.decode(queid));
		carequestion.setUserid(name);
		carequestion.setCreatetime(date);
		carequestionservice.insertCarequestion(carequestion);
		questionservice.addattentionService(Integer.decode(queid));
		return "关注成功";
	}
	
	//取消关注
		@ResponseBody
		@RequestMapping(value="/cancelcq.do",produces="html/text;charset=utf-8")
		public String cancelcq(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
			System.out.println(queid);
			String name=(String) request.getSession().getAttribute("username");
			Carequestion carequestion=new Carequestion();
			carequestion.setQuestionid(Integer.decode(queid));
			carequestion.setUserid(name);
			carequestionservice.reduceCarequestionService(carequestion);
			questionservice.reduceattentionService(Integer.decode(queid));
			return "取消关注成功";
		}
		//测试关注
		@ResponseBody
		@RequestMapping(value="/testcare.do",produces="html/text;charset=utf-8")
		public String testcare(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
			System.out.println(queid);
			String name=(String) request.getSession().getAttribute("username");
			Carequestion carequestion=new Carequestion();
			carequestion.setQuestionid(Integer.decode(queid));
			carequestion.setUserid(name);
			String a=carequestionservice.getCarequestionService(carequestion);
			return a;
		}
	
}
