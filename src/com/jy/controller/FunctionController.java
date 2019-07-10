package com.jy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Idea;
import com.jy.service.IdeaService;

@Controller
public class FunctionController {
	@Autowired
	IdeaService ideaService;
	
	//跳转到个人主页
	@RequestMapping("myPage.do")
	public ModelAndView personal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("personalPage");
		String user = (String) request.getSession().getAttribute("username");
		List<Idea> ideas = ideaService.getIdeasByUser(user);
		mav.addObject("ideas",ideas);
		mav.addObject("ideasNum",ideas.size());
		return mav;
	}
	//跳转到写回答
	@RequestMapping("writeAnswer.do")
	public ModelAndView writeAnswer(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("MyPage");
		
		
		return mav;
	}
	//跳转到写文章
	@RequestMapping("writeArticle.do")
	public ModelAndView writeArticle() {
		ModelAndView mav = new ModelAndView("writeArticle");
		return mav;
	}
}
