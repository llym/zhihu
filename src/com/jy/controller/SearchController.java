package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Rquestioncomment;
import com.jy.entity.User;
import com.jy.service.CareUserService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RQuestionCommentService;
import com.jy.service.UserService;

@Controller
public class SearchController {
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
	
	@RequestMapping("search.do")
	public ModelAndView  test(String sear,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		List<Question> qlist =questionservice.searchquestionService(sear);
		request.getSession().setAttribute("sear",sear);
		System.out.println(qlist);
		List<Questioncomment> list1 = new ArrayList<Questioncomment>();	
		List<Questioncomment> list2 = new ArrayList<Questioncomment>();	
		List<Rquestioncomment> list3 = new ArrayList<Rquestioncomment>();	
		List<Rquestioncomment> list4 = new ArrayList<Rquestioncomment>();	
		for(int i=0;i<qlist.size();i++) {
			 list1=questioncommentservice.getQuestioncommentService(qlist.get(i).getQuestionid());
			 list2.addAll(list1);
		}
		for(int i=0;i<list2.size();i++) {
			 list3=rquestioncommentservice.getRquestioncommentService(list2.get(i).getCommentid());
			 list4.addAll(list3);	
		}
		ModelAndView mav =new ModelAndView("searchResult");
		
		mav.addObject("qlist",qlist);
		mav.addObject("comlist",list2);
		mav.addObject("rcomlist",list4);
		
		return mav;
	}
	
	
		@RequestMapping("searchq.do")
		public ModelAndView  searchq(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
			String name=(String) request.getSession().getAttribute("sear");
			List<Question> qlist =questionservice.searchquestionService(name);
			System.out.println(qlist);
			List<Questioncomment> list1 = new ArrayList<Questioncomment>();	
			List<Questioncomment> list2 = new ArrayList<Questioncomment>();	
			List<Rquestioncomment> list3 = new ArrayList<Rquestioncomment>();	
			List<Rquestioncomment> list4 = new ArrayList<Rquestioncomment>();	
			for(int i=0;i<qlist.size();i++) {
				 list1=questioncommentservice.getQuestioncommentService(qlist.get(i).getQuestionid());
				 list2.addAll(list1);
			}
			for(int i=0;i<list2.size();i++) {
				 list3=rquestioncommentservice.getRquestioncommentService(list2.get(i).getCommentid());
				 list4.addAll(list3);	
			}
			ModelAndView mav =new ModelAndView("searchResult");
			
			mav.addObject("qlist",qlist);
			mav.addObject("comlist",list2);
			mav.addObject("rcomlist",list4);
			
			return mav;
		}
		
	@RequestMapping("searchuser.do")
	public ModelAndView  test2(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
	
		String name=(String) request.getSession().getAttribute("sear");
		List<User> ulist =userservice.searchuserService(name);

		ModelAndView mav =new ModelAndView("searchUser");
		mav.addObject("ulist",ulist);
		
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
