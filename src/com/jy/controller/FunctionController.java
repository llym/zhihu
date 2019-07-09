package com.jy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FunctionController {
	//跳转到个人主页
	@RequestMapping("myPage.do")
	public ModelAndView personal() {
		ModelAndView mav = new ModelAndView("personalPage");
		return mav;
	}
	//跳转到写回答
	@RequestMapping("writeAnswer.do")
	public ModelAndView writeAnswer() {
		ModelAndView mav = new ModelAndView("MyPage");
		return mav;
	}
	//跳转到写文章
	@RequestMapping("writeArticle.do")
	public ModelAndView writeArticle() {
		ModelAndView mav = new ModelAndView("MyPage");
		return mav;
	}
}
