package com.jy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@RequestMapping("updatePersonalData.do")
	public ModelAndView personal() {
		ModelAndView mav = new ModelAndView("personalData");
		return mav;
	}
}
