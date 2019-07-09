package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Question;
import com.jy.entity.hot;
import com.jy.service.AnswerService;
import com.jy.service.QuestionService;


	@Controller
	public class HotquestionController {
		
		@Autowired
		private QuestionService questionservice ;
		@Autowired
		private AnswerService answerservice;
		
		@RequestMapping("/hotopic.do")
		 public ModelAndView hottopic(Model model,@RequestParam("top") String id){
			System.out.println(id);
			List<Question> list= questionservice.getHotQuestionService(Integer.decode(id));
			List<hot> numlist=new ArrayList<hot>();	
			
			
			for(int i=0;i<list.size();i++) {
	       	 System.out.println(list.get(i).getQuestionid()); 
	       	 String photo=answerservice.getPhotoService(list.get(i).getQuestionid());
	       	 hot ho=new hot();
	       	 ho.setNumb(i+1);
	       	 ho.setPhoto(photo);
	       	 ho.setQuestionid(list.get(i).getQuestionid());
	       	 numlist.add(ho);
			}
			System.out.println(list);
			System.out.println(numlist);
			ModelAndView mav =new ModelAndView("hot");
			mav.addObject("quelist",list);
			mav.addObject("numlist",numlist);
			
			return mav;
		}
		
		@RequestMapping("/hot.do")
		 public ModelAndView hot(){
			List<Question> list= questionservice.getHotService(1);
			List<hot> numlist=new ArrayList<hot>();	
			for(int i=0;i<list.size();i++) {
	      	 System.out.println(list.get(i).getQuestionid()); 
	      	 String photo=answerservice.getPhotoService(list.get(i).getQuestionid());
	      	 hot ho=new hot();
	      	 ho.setNumb(i+1);
	      	 ho.setPhoto(photo);
	      	 ho.setQuestionid(list.get(i).getQuestionid());
	      	 numlist.add(ho);
			}
			System.out.println(list);
			System.out.println(numlist);
			ModelAndView mav =new ModelAndView("hot");
			mav.addObject("quelist",list);
			mav.addObject("numlist",numlist);
			
			return mav;
		}
	}
